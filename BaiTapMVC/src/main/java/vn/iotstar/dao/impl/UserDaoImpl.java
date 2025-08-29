package vn.iotstar.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import vn.iotstar.connection.DBConnection;
import vn.iotstar.dao.UserDAO;
import vn.iotstar.models.User;

public class UserDaoImpl implements UserDAO {

	public Connection conn = null;
	public PreparedStatement ps = null;
	public ResultSet rs = null;

	@Override
	public User get(String username) {
		String sql = "SELECT * FROM [User] WHERE userName = ? ";
		try {
			conn = new DBConnection().getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			rs = ps.executeQuery();
			while (rs.next()) {
				User user = new User();
				user.setId(rs.getInt("id"));
				user.setEmail(rs.getString("email"));
				user.setUserName(rs.getString("userName"));
				user.setFullName(rs.getString("fullName"));
				user.setPassWord(rs.getString("passWord"));
				user.setAvatar(rs.getString("avatar"));
				user.setRoleid(Integer.parseInt(rs.getString("roleid")));
				user.setPhone(rs.getString("phone"));
				user.setCreatedDate(rs.getDate("createdDate"));
				return user;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	@Override
	public void insert(User user) {
		String sql = "INSERT INTO [User](email, userName, fullName, passWord, avatar, roleid, phone, createdDate) VALUES (?,?,?,?,?,?,?,?)";
		try {
			conn = new DBConnection().getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, user.getEmail());
			ps.setString(2, user.getUserName());
			ps.setString(3, user.getFullName());
			ps.setString(4, user.getPassWord());
			ps.setString(5, user.getAvatar());
			ps.setInt(6, user.getRoleid());
			ps.setString(7, user.getPhone());
			ps.setDate(8, user.getCreatedDate());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public boolean checkExistEmail(String email) {
		boolean duplicate = false;
		String query = "select * from [User] where email = ?";
		try {
			conn = new DBConnection().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, email);
			rs = ps.executeQuery();
			if (rs.next()) {
				duplicate = true;
			}
			ps.close();
			conn.close();
		} catch (Exception ex) {
		}
		return duplicate;
	}

	@Override
	public boolean checkExistUsername(String username) {
		boolean duplicate = false;
		String query = "select * from [User] where userName = ?";
		try {
			conn = new DBConnection().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, username);
			rs = ps.executeQuery();
			if (rs.next()) {
				duplicate = true;
			}
			ps.close();
			conn.close();
		} catch (Exception ex) {
		}
		return duplicate;
	}

	@Override
	public boolean checkExistPhone(String phone) {
		boolean duplicate = false;
	    String query = "SELECT * FROM [User] WHERE phone = ?";
	    try {
	        conn = new DBConnection().getConnection();
	        ps = conn.prepareStatement(query);
	        ps.setString(1, phone);
	        rs = ps.executeQuery();
	        if (rs.next()) {
	            duplicate = true;
	        }
	        ps.close();
	        conn.close();
	    } catch (Exception ex) {
	        ex.printStackTrace();
	    }
	    return duplicate;
	}
	
	@Override
	public boolean updatePassword(String username, String newPassword) {
	    String sql = "UPDATE [User] SET passWord = ? WHERE userName = ?";
	    try {
	        conn = new DBConnection().getConnection();
	        ps = conn.prepareStatement(sql);
	        ps.setString(1, newPassword); // TODO: nếu dùng hash, thay bằng mật khẩu đã hash
	        ps.setString(2, username);
	        return ps.executeUpdate() > 0;
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return false;
	}
	@Override
	public User getByUsernameAndEmail(String username, String email) {
	    String sql = "SELECT * FROM [User] WHERE userName = ? AND email = ?";
	    try {
	        conn = new DBConnection().getConnection();
	        ps = conn.prepareStatement(sql);
	        ps.setString(1, username);
	        ps.setString(2, email);
	        rs = ps.executeQuery();
	        if (rs.next()) {
	            User u = new User();
	            u.setUserName(rs.getString("userName"));
	            u.setEmail(rs.getString("email"));
	            u.setPassWord(rs.getString("passWord"));
	            u.setFullName(rs.getString("fullName"));
	            return u;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return null;
	}
}
