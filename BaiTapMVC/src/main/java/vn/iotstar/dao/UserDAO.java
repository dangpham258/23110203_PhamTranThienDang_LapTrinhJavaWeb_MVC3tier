package vn.iotstar.dao;

import vn.iotstar.models.User;

public interface UserDAO {
	User get(String username);
	
	void insert(User user);
	boolean checkExistEmail(String email);
	boolean checkExistUsername(String username);
	boolean checkExistPhone(String phone);
	boolean updatePassword(String username, String newPassword);
	User getByUsernameAndEmail(String username, String email);
}
