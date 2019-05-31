package controller;

import domain.Permission;
import domain.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import service.IRoleService;
import service.impl.RoleService;

import java.util.List;

@Controller
@RequestMapping("role")
public class RoleController {

    @Autowired
    @Qualifier("roleService")
    private IRoleService roleService;

    @RequestMapping("findAll.do")
    public ModelAndView findAll(){
        ModelAndView mv = new ModelAndView();
        List<Role> roles=roleService.findAll();
        mv.addObject("roleList",roles);
        mv.setViewName("role-list");
        return mv;
    }

    @RequestMapping("findById.do")
    public ModelAndView findById(@RequestParam(required = true,name = "id") String id){
        ModelAndView mv = new ModelAndView();
        Role role = roleService.findById(id);
        mv.addObject("role",role);
        mv.setViewName("role-show");
        return mv;
    }


    @RequestMapping("save.do")
    public String save(Role role){
        roleService.insert(role);
        return "redirect:findAll.do";
    }

    /**
     * 根据角色ID查询role，并且查询出可添加的权限
     * @param id
     * @return
     */
    @RequestMapping("findRoleByIdAndAllPermission.do")
    public ModelAndView findRoleByIdAndAllPermission(@RequestParam(name = "id",required = true)String id){
        //根据roleID查询Role
        Role role = roleService.findById(id);
        //根据ID查询可添加权限
        List<Permission> permissions = roleService.findOtherPermission(id);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("role-permission-add");
        mv.addObject("pemissions",permissions);
        mv.addObject("role",role);
        return mv;
    }

    @RequestMapping("addPermissionToRole.do")
    public String addPermissionToRole(@RequestParam(name = "roleId",required = true) String roleId,
                                      @RequestParam(name = "ids") String[] permissionIds){
        roleService.addPermissionToRole(roleId,permissionIds);
        return "redirect:findAll.do";
    }

}
