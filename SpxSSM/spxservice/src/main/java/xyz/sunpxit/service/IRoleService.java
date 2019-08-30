package xyz.sunpxit.service;

import xyz.sunpxit.domain.Permission;
import xyz.sunpxit.domain.Role;

import java.util.List;

public interface IRoleService {

    List<Role> findAll(int f,int e);

    Role findById(String roleId) throws Exception;

    List<Permission> findUserByIdAndAllRole(String rid)throws Exception;

    void addPermissionToRole(String rid, String[] arr) throws Exception;

    void udelete(String[] ids);

    void save(Role urole);
}
