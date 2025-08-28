package vn.iotstar.userService;

import vn.iotstar.models.User;

public interface UserService {
	User login(String username, String password);
	User get(String username);
}
