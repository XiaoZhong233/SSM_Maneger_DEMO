package dao;

import domain.Permission;
import domain.Role;

import java.util.HashMap;
import java.util.List;

public interface IRoleDao {

    /**
     * 根据用户名ID查找角色集合信息,包括权限信息
     * @return
     */
    List<Role> findRolesByUserId(String uid);

    /**
     * 查询所有角色信息包括该角色下的用户信息与权限信息
     */
    List<Role> findAll();

    /**
     * 根据权限ID查询角色信息
     */
    List<Role> findRolesByPermissionId (String pid);

    /**
     * 根据ID查询角色包括该角色下的用户信息与权限信息
     * @param id
     * @return
     */
    Role findRoleById(String id);

    /**
     * 插入一条新的角色信息
     * @param role
     */
    void insert(Role role);

    /**
     * 根据ID查询可添加的权限
     * @param id
     * @return
     */
    List<Permission> findOtherPermission(String id);

    /**
     * 为角色添加权限
     * @param map
     */
    void addPermissionToRole(HashMap map);
}
