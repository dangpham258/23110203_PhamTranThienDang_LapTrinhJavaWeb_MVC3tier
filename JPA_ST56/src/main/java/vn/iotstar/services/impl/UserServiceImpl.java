package vn.iotstar.services.impl;

import vn.iotstar.dao.UserDao;
import vn.iotstar.dao.impl.UserDaoImpl;
import vn.iotstar.entity.User;
import vn.iotstar.services.UserService;

public class UserServiceImpl implements UserService {
    private final UserDao userDao = new UserDaoImpl();

    @Override
    public User login(String username, String password) {
        User u = userDao.findByUsername(username);
        return (u != null && u.getPassword().equals(password)) ? u : null;
    }

    @Override
    public boolean register(User u) {
        if (userDao.findByUsername(u.getUsername()) != null) return false;
        if (u.getRoleId() == null) u.setRoleId(1);
        userDao.insert(u);
        return true;
    }

    @Override
    public boolean resetPassword(String username, String newPass) {
        User u = userDao.findByUsername(username);
        if (u == null) return false;
        u.setPassword(newPass);
        userDao.update(u);
        return true;
    }

    @Override
    public User findById(Integer id) { return userDao.findById(id); }
}
