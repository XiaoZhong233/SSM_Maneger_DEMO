package dao;

import domain.Permission;

import java.util.List;

public interface IPermissionDao {

    /**
     * 根据角色ID进行权限查询
     * @return
     */
    List<Permission> findByRoleId(String id);

    /**
     * 查询全部权限信息，包括对应的角色
     * @return
     */
    List<Permission> findAll();

    /**
     * 根据ID查询权限信息，包括对应的角色信息
     * @param id
     * @return
     */
    Permission findById(String id);

    /**
     * 插入新的权限
     * @param permission
     */
    void insert(Permission permission);
}
