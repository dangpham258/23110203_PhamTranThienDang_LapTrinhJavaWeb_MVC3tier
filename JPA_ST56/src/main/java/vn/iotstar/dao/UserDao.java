package vn.iotstar.dao;

import vn.iotstar.entity.User;

public interface UserDao {
    User findByUsername(String username);
    User findById(Integer id);
    void insert(User u);
    void update(User u);
}
