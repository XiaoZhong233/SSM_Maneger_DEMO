package controller;

import domain.Permission;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import service.IPermissionService;

import java.util.List;

@Controller
@RequestMapping("permission")
public class PermissionController {

    @Autowired
    private IPermissionService permissionService;

    @RequestMapping("findAll.do")
    public ModelAndView findAll(){
        List<Permission> permissions = permissionService.findAll();
        ModelAndView mv = new ModelAndView();
        mv.setViewName("permission-list");
        mv.addObject("permissions",permissions);
        return mv;
    }

    @RequestMapping("findByRoleId.do")
    public ModelAndView findByRoleId(@RequestParam(required = true,name = "roleId") String id){
        List<Permission> permissions = permissionService.findByRoleId(id);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("permission-list");
        mv.addObject("permissions",permissions);
        return mv;
    }

    @RequestMapping("findById.do")
    public ModelAndView findById(@RequestParam(required = true,name= "id")String id){
        Permission permission = permissionService.findById(id);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("permission-show");
        mv.addObject("permission",permission);
        return mv;
    }

    /**
     * 增加资源权限
     */
    @RequestMapping("save.do")
    public String save(Permission permission){
        permissionService.insert(permission);
        return "redirect:findAll.do";
    }

}
