package controller;

import com.github.pagehelper.PageInfo;
import domain.SysLog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import service.ISysLogService;

import java.util.List;

@Controller
@RequestMapping("sysLog")
public class SysLogController {

    @Autowired
    private ISysLogService sysLogService;

    @RequestMapping("findAll.do")
    public ModelAndView findAll(){
        ModelAndView mv = new ModelAndView();
        List<SysLog> logs = sysLogService.findAll();
        mv.addObject("logs",logs);
        mv.setViewName("");
        return mv;
    }

    @RequestMapping("findAllInPages.do")
    public ModelAndView findAllInPages(@RequestParam(name = "page",required = true,defaultValue = "1")Integer page,
                                       @RequestParam(name = "size",required = true,defaultValue = "10")Integer size){
        ModelAndView mv = new ModelAndView();
        List<SysLog> logs = sysLogService.findAllInPages(page,size);
        //获取分页bean
        PageInfo pageInfo = new PageInfo(logs);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("log-page-list");
        return mv;
    }
}
