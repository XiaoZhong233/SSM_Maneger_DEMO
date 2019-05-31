package service.impl;

import dao.IRoleDao;
import domain.Permission;
import domain.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import service.IRoleService;

import java.util.HashMap;
import java.util.List;

@Service("roleService")
@Transactional
public class RoleService implements IRoleService {

    @Autowired
    @Qualifier("roleMapper")
    private IRoleDao roleDao;

    public List<Role> findAll() {
        return roleDao.findAll();
    }

    public Role findById(String id) {
        return roleDao.findRoleById(id);
    }

    public void insert(Role role) {
        roleDao.insert(role);
    }

    public List<Permission> findOtherPermission(String id) {
        return roleDao.findOtherPermission(id);
    }

    public void addPermissionToRole(String roleId, String[] permissionIds) {
        for(String permissionId : permissionIds){
            HashMap map = new HashMap();
            map.put("roleId",roleId);
            map.put("permissionId",permissionId);
            roleDao.addPermissionToRole(map);
        }
    }
}
