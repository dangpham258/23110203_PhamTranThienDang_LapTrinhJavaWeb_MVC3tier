package vn.iotstar.dao;

import java.util.List;
import vn.iotstar.models.Category;

public interface CategoryDAO {
	void insert(Category category);

	void update(Category category);

	void delete(int id, int ownerUserId);

	Category getById(int id, int ownerUserId);

	Category getByName(String name, int ownerUserId);

	List<Category> getAllByUser(int ownerUserId);

	List<Category> searchByUser(String keyword, int ownerUserId);
}
