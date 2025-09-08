package vn.iotstar.services.impl;

import java.util.List;
import vn.iotstar.dao.CategoryDao;
import vn.iotstar.dao.impl.CategoryDaoImpl;
import vn.iotstar.entity.Category;
import vn.iotstar.services.CategoryService;

public class CategoryServiceImpl implements CategoryService {
	private final CategoryDao dao = new CategoryDaoImpl();

	public List<Category> findAll() {
		return dao.findAll();
	}

	public List<Category> findByUser(Integer userId) {
		return dao.findByUser(userId);
	}

	public Category findById(Integer id) {
		return dao.findById(id);
	}

	public void insert(Category c) {
		dao.insert(c);
	}

	public void update(Category c) {
		dao.update(c);
	}

	public void delete(Integer id) {
		dao.delete(id);
	}
}
