package vn.iotstar.service;

import vn.iotstar.models.User;

public interface UserService {
	// For login
	User login(String username, String password);

	User get(String username);

	// For register
	void insert(User user);

	boolean register(String email, String password, String username, String fullname, String phone);

	boolean checkExistEmail(String email);

	boolean checkExistUsername(String username);

	boolean checkExistPhone(String phone);

	boolean updatePassword(String username, String newPassword);

	User getByUsernameAndEmail(String username, String email);
}
