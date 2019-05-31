package util;

import org.aspectj.lang.ProceedingJoinPoint;

/**
 * 事务管理工具类
 * 包含开启事务，提交事务，回滚事务和释放连接
 */
public class TransactionManager {

    private ConnectionUtils connectionUtils;

    public void setConnectionUtils(ConnectionUtils connectionUtils) {
        this.connectionUtils = connectionUtils;
    }

    /**
     * 开始事务
     */
    public void beginTransaction(){
        try {
            connectionUtils.getThreadConnection().setAutoCommit(false);
            System.out.println("开始事务");
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    /**
     * 提交事务
     */
    public void commit(){
        try {
            connectionUtils.getThreadConnection().commit();
            System.out.println("提交事务");
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    /**
     * 回滚事务
     */
    public void rollback(){
        try {
            connectionUtils.getThreadConnection().rollback();
            System.out.println("出现错误，回滚事务");
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    /**
     * 释放连接,解绑线程
     */
    public void release(){
        try {
            connectionUtils.getThreadConnection().close();
            //解绑线程和连接
            connectionUtils.removeConnection();
            System.out.println("事务关闭，解绑线程和连接");
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    /**
     * 自定义事务
     */
    public Object custom(ProceedingJoinPoint pjp){
        Object rtValue = null;
        try {
            Object[] args = pjp.getArgs();//得到方法执行所需的参数
            System.out.println("环绕通知-前置通知");
            //rtValue=pjp.proceed(args);//明确调用业务层方法
            System.out.println("环绕通知-后置通知");

        } catch (Throwable throwable) {
            System.out.println("环绕通知-异常通知");
            //必须写这个异常，exception拦不住
            throwable.printStackTrace();
        }finally {
            System.out.println("环绕通知-最终通知");
        }
        return rtValue;
    }
}
