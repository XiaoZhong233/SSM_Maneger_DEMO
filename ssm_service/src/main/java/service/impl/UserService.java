package service.impl;

import dao.IPermissionDao;
import dao.IRoleDao;
import dao.IUserDao;
import domain.Permission;
import domain.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import service.IUserService;
import sun.security.ssl.Debug;
import util.BCryptPasswordEncoderUtils;

import java.util.*;

@Service("userService")
@Transactional
public class UserService implements IUserService {

    @Autowired
    @Qualifier("userMapper")
    private IUserDao userDao;

    @Autowired
    @Qualifier("roleMapper")
    private IRoleDao roleDao;

    @Autowired
    @Qualifier("permissionMapper")
    private IPermissionDao permissionDao;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    /**
     * 用户认证服务
     * 包括认证用户的账号密码和授权信息
     * @param s
     * @return
     * @throws UsernameNotFoundException
     */
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        domain.User userinfo = null;
        try {
            userinfo = userDao.findByUsername(s);
//            List<domain.User> userList =userDao.findAll();
//            List<Role> roles = roleDao.findAll();
//            List<Permission> permissions = permissionDao.findAll();
//            System.out.println(roles);

        } catch (Exception e) {
            e.printStackTrace();
        }
        //把用户对象封装UserDetails,
        User user = new User(userinfo.getUsername(),userinfo.getPassword(),
                userinfo.getStatus() == 1,
                true,true,true,getAuthority(userinfo.getRoles()));
        return user;
    }

    /**
     * 返回认证权限集合（角色描述）
     * @return
     */
    private List<SimpleGrantedAuthority> getAuthority() {
        List<SimpleGrantedAuthority> list = new ArrayList<SimpleGrantedAuthority>();
        list.add(new SimpleGrantedAuthority("ROLE_USER"));
        //list.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
        return list;
    }

    private Set<SimpleGrantedAuthority> getAuthority(List<Role> roles) {
        Set<SimpleGrantedAuthority> list = new HashSet<SimpleGrantedAuthority>();
        //list.add(new SimpleGrantedAuthority("ROLE_USER"));
        //list.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
        for(Role role : roles){
            for(Permission permission :role.getPermissions()){
                list.add(new SimpleGrantedAuthority(permission.getPermissionName()));
                Debug.println(role.getRoleDesc()+"用户登录权限:",permission.getPermissionName());
            }
        }
        return list;
    }

    public List<domain.User> findAll(){
        return userDao.findAll();
    }

    public void insert(domain.User user) {
        //对密码进行加密
        user.setPassword(BCryptPasswordEncoderUtils.encodePassword(user.getPassword()));
        userDao.insert(user);
    }

    public domain.User findUserInfoById(String id) {
        return userDao.findById(id);
    }

    public domain.User findByUsername(String username) {
        try {
            return userDao.findByUsername(username);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Role> findOtherRolesByUserId(String id) {
        return userDao.findOtherRolesByUserId(id);
    }

    public void addRoleToUser(String userId, String[] roleIds) {
        for(String roleId : roleIds){
            HashMap<String,String> map = new HashMap<String, String>();
            map.put("userId",userId);
            map.put("roleId",roleId);
            userDao.addRoleToUser(map);
        }
    }
}
