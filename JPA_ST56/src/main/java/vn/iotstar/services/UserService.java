package vn.iotstar.services;

import vn.iotstar.entity.User;

public interface UserService {
    User login(String username, String password);
    boolean register(User u);
    boolean resetPassword(String username, String newPass);
    User findById(Integer id);
}
