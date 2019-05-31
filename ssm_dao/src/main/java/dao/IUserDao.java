package dao;

import domain.Role;
import domain.User;

import java.util.HashMap;
import java.util.List;

public interface IUserDao {

    /**
     * 根据用户名查找用户信息
     * @param username
     * @return
     * @throws Exception
     */
    User findByUsername(String username) throws Exception;


    /**
     * 查询所有用户信息
     * @return
     */
    List<User> findAll();

    /**
     * 根据角色ID查找用户信息
     * @param rid
     * @return
     */
    List<User> findByRoleId(String rid);

    /**
     * 新增用户
     * @param user
     */
    void insert(User user);

    User findById(String id);


    /**
     * 根据用户ID查询用户可添加的Role
     * @param id
     * @return
     */
    List<Role> findOtherRolesByUserId(String id);

    /**
     * 为用户添加角色
     */
    void addRoleToUser(HashMap<String,String> hashMap);
}
