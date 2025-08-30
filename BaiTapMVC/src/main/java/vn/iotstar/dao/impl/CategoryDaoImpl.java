package vn.iotstar.dao.impl;

import java.sql.*;
import java.util.*;
import vn.iotstar.connection.DBConnection;
import vn.iotstar.dao.CategoryDAO;
import vn.iotstar.models.Category;

public class CategoryDaoImpl extends DBConnection implements CategoryDAO {

	@Override
	public void insert(Category c) {
		String sql = "INSERT INTO dbo.Category(cate_name, icons, user_id) VALUES (?,?,?)";
		try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setString(1, c.getName());
			ps.setString(2, c.getIcon());
			ps.setInt(3, c.getUserId());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void update(Category c) {
		String sql = "UPDATE dbo.Category SET cate_name=?, icons=? WHERE cate_id=? AND user_id=?";
		try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setString(1, c.getName());
			ps.setString(2, c.getIcon());
			ps.setInt(3, c.getId());
			ps.setInt(4, c.getUserId());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void delete(int id, int ownerUserId) {
		String sql = "DELETE FROM dbo.Category WHERE cate_id=? AND user_id=?";
		try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setInt(1, id);
			ps.setInt(2, ownerUserId);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public Category getById(int id, int ownerUserId) {
		String sql = "SELECT cate_id,cate_name,icons,user_id FROM dbo.Category WHERE cate_id=? AND user_id=?";
		try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setInt(1, id);
			ps.setInt(2, ownerUserId);
			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					return map(rs);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Category getByName(String name, int ownerUserId) {
		String sql = "SELECT cate_id,cate_name,icons,user_id FROM dbo.Category WHERE cate_name=? AND user_id=?";
		try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setString(1, name);
			ps.setInt(2, ownerUserId);
			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next())
					return map(rs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Category> getAllByUser(int ownerUserId) {
		List<Category> list = new ArrayList<>();
		String sql = "SELECT cate_id,cate_name,icons,user_id FROM dbo.Category WHERE user_id=? ORDER BY cate_id DESC";
		try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setInt(1, ownerUserId);
			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next())
					list.add(map(rs));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Category> searchByUser(String keyword, int ownerUserId) {
		List<Category> list = new ArrayList<>();
		String sql = "SELECT cate_id,cate_name,icons,user_id FROM dbo.Category "
				+ "WHERE user_id=? AND cate_name LIKE ? ORDER BY cate_name";
		try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setInt(1, ownerUserId);
			ps.setString(2, "%" + keyword + "%");
			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next())
					list.add(map(rs));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	private Category map(ResultSet rs) throws SQLException {
		return new Category(rs.getInt("cate_id"), rs.getString("cate_name"), rs.getString("icons"),
				rs.getInt("user_id"));
	}
}
