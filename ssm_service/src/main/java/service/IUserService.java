package service;

import domain.Role;
import domain.User;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

public interface IUserService extends UserDetailsService {
    List<User> findAll();

    void insert(User user);

    User findUserInfoById(String id);

    User findByUsername(String username);

    List<Role> findOtherRolesByUserId(String id);

    void addRoleToUser(String userid, String[] roleIds);
}
