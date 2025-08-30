package vn.iotstar.service;

import java.util.List;
import vn.iotstar.models.Category;

public interface CategoryService {
	void insert(Category c);

	void update(Category c);

	void delete(int id, int ownerUserId);

	Category getById(int id, int ownerUserId);

	Category getByName(String name, int ownerUserId);

	List<Category> getAllByUser(int ownerUserId);

	List<Category> searchByUser(String keyword, int ownerUserId);
}
