package controller;

import domain.Role;
import domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import service.IUserService;
import java.util.List;

@Controller
@RequestMapping("user")
public class UserController {

    @Autowired
    @Qualifier("userService")
    private IUserService userService;

    @RequestMapping("findAll.do")
    public ModelAndView findAll(){
        ModelAndView mv = new ModelAndView();
        List<User> userList = userService.findAll();
        mv.setViewName("user-list");
        mv.addObject("userList",userList);
        return mv;
    }




    @RequestMapping("save.do")
    public String save(User user){
        userService.insert(user);
        return "redirect:findAll.do";
    }

    @RequestMapping("findById.do")
    public ModelAndView findById(@RequestParam(required = true,name = "id") String id){
        User user=userService.findUserInfoById(id);
        ModelAndView mv = new ModelAndView();
        System.out.println(user.toString());
        mv.addObject("user",user);
        mv.setViewName("user-show");
        return mv;
    }

    /**
     * 显示用户添加角色表单
     * @param id
     * @return
     */
    @RequestMapping("AddRole.do")
    public ModelAndView showAddRoleForm(@RequestParam(required = true,name = "id") String id){
        //根据用户查询角色
        User user = userService.findUserInfoById(id);
        //根据用户ID查询用户可以添加的角色
        List<Role> otherRole = userService.findOtherRolesByUserId(id);
        ModelAndView mv = new ModelAndView();
        mv.addObject("user",user);
        mv.addObject("roleList",otherRole);
        mv.setViewName("user-role-add");
        return mv;
    }


    @RequestMapping("addRoleToUser.do")
    public String addRole(@RequestParam(name = "userId",required = true) String userid,
                                @RequestParam(name ="ids" ,required = true) String[] roleIds){
        userService.addRoleToUser(userid,roleIds);
        return "redirect:findAll.do";
    }


    @RequestMapping("findByUserName.do")
    public ModelAndView findByUserName(@RequestParam(required = true,name = "username") String username){
        User user = userService.findByUsername(username);
        ModelAndView mv = new ModelAndView();
        System.out.println(user.toString());
        mv.addObject("user",user);
        mv.setViewName("user-show");
        return mv;
    }

}
