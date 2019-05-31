package service;

import domain.Permission;
import domain.Role;

import java.util.List;

public interface IRoleService {

    /**
     * 查询所有角色信息,包括了用户信息与权限信息
     * @return
     */
    List<Role> findAll();

    /**
     * 根据ID查询角色信息，包括该角色下的用户信息与权限信息
     * @return
     */
    Role findById(String id);


    /**
     * 插入一个新的角色信息
     * @param role
     */
    void insert(Role role);

    /**
     * 根据角色查询可添加的权限
     * @param id
     * @return
     */
    List<Permission> findOtherPermission(String id);

    /**
     * 为角色添加资源权限
     * @param roleId
     * @param permissionIds
     */
    void addPermissionToRole(String roleId, String[] permissionIds);
}
