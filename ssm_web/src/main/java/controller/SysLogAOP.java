package controller;

import dao.ISysLogDao;
import domain.SysLog;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import service.ISysLogService;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.Date;

/**
 * 日志记录切面
 */
@Component
@Aspect
public class SysLogAOP {

    @Autowired
    private HttpServletRequest request;

    @Autowired
    private ISysLogService sysLogService;

    private Date startTime; // 访问时间
    private Class executionClass;// 访问的类
    private Method executionMethod; // 访问的方法



    // 主要获取访问时间、访问的类、访问的方法

    //前置通知
    @Before("execution(* controller.*.*(..))")
    public void doBefore(JoinPoint pt) throws NoSuchMethodException {
        //获取方法开始时间，访问的类是哪一个
        startTime = new Date();

        //获取访问的类
        executionClass = pt.getTarget().getClass();

        //获取访问方法
        String methodName = pt.getSignature().getName();
        Object[] args = pt.getArgs(); //获取方法参数
        if(args==null || args.length==0){
            executionMethod = executionClass.getMethod(methodName);//无参构造方法
        }else{
            Class[] classesArgs = new Class[args.length];
            for(int i=0;i<args.length;i++){
                classesArgs[i] = args[i].getClass(); //获取每个参数的class
            }
            executionMethod = executionClass.getMethod(methodName,classesArgs);
        }



    }


    //后置通知
    @AfterReturning("execution(* controller.*.*(..))")
    public void doAfterReturning(JoinPoint pt){

    }

    //异常通知
    @AfterThrowing("execution(* controller.*.*(..))")
    public void doAfterThrowing(JoinPoint pt){

    }

    //最终通知
    @After("execution(* controller.*.*(..))")
    public void doAfter(JoinPoint pt){
        //获取访问时长
        long time = new Date().getTime() - startTime.getTime();
        //获取url
        String url  = "";
        if(executionClass!=null && executionMethod!=null && executionClass != SysLogAOP.class){
            //获取类上的@RequestMapping
            RequestMapping classAnnotation = (RequestMapping) executionClass.getAnnotation(RequestMapping.class);
            if(classAnnotation!=null){
                String[] classValues = classAnnotation.value();
                //获取方法上的注解的Value值
                RequestMapping methodAnnotation = executionMethod.getAnnotation(RequestMapping.class);
                if(methodAnnotation!=null){
                    String[] methodValues = methodAnnotation.value();
                    url = classValues[0]+"/"+methodValues[0];
                }
            }
        }
        //获取访问的IP
        String ip = request.getRemoteAddr();
        //获取当前操作者，利用security获取当前的登录用户
        SecurityContext context = SecurityContextHolder.getContext();
        User userDetails = (User) context.getAuthentication().getPrincipal();
        String username = userDetails.getUsername();

        //将日志信息封装
        SysLog sysLog = new SysLog();
        sysLog.setExecutionTime(time);
        sysLog.setIp(ip);
        sysLog.setUrl(url);
        sysLog.setUsername(username);
        sysLog.setVisitTime(startTime);
        //防止空指针异常
        try{
            sysLog.setMethod("[类名] "+executionClass.getName()+"[方法名] "+executionMethod.getName());
        }catch (Exception e){
            sysLog.setMethod("[类名] null"+"[方法名] null");
        }
        //调用Service完成操作
        sysLogService.save(sysLog);

    }
}
