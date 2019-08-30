package xyz.sunpxit.service;

import org.springframework.security.core.userdetails.UserDetailsService;
import xyz.sunpxit.domain.Role;
import xyz.sunpxit.domain.Users;

import java.util.List;

public interface IUserService extends UserDetailsService {
    List<Users> findAll(int first,int end);
    void save(Users userInfo) throws Exception;

    Users  findById(String id) throws Exception;

    List<Role> uidAddRoleid(String uid);

    void addRoleToUser(String uid, String[] arr);
    public void udelete(String[] ids);
}
