package vn.iotstar.dao;

import vn.iotstar.models.User;

public interface UserDAO {
	User get(String username);
}
