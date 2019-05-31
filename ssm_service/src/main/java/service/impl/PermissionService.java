package service.impl;

import dao.IPermissionDao;
import domain.Permission;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import service.IPermissionService;

import java.util.List;

@Service
@Transactional
public class PermissionService implements IPermissionService {

    @Autowired
    @Qualifier("permissionMapper")
    private IPermissionDao permissionDao;

    public List<Permission> findByRoleId(String id) {
        return permissionDao.findByRoleId(id);
    }

    public List<Permission> findAll() {
        return permissionDao.findAll();
    }

    public Permission findById(String id) {
        return permissionDao.findById(id);
    }

    public void insert(Permission permission) {
        permissionDao.insert(permission);
    }
}
