package vn.iotstar.service.impl;

import java.io.File;
import java.util.List;
import vn.iotstar.dao.CategoryDAO;
import vn.iotstar.dao.impl.CategoryDaoImpl;
import vn.iotstar.models.Category;
import vn.iotstar.service.CategoryService;
import vn.iotstar.util.Constant;

public class CategoryServiceImpl implements CategoryService {
	private final CategoryDAO dao = new CategoryDaoImpl();

	@Override
	public void insert(Category c) {
		dao.insert(c);
	}

	@Override
	public void update(Category c) {
		dao.update(c);
	}

	@Override
	public void delete(int id, int ownerUserId) {
		Category old = dao.getById(id, ownerUserId);
		dao.delete(id, ownerUserId);
		if (old != null && old.getIcon() != null) {
			File f = new File(Constant.DIR + File.separator + old.getIcon());
			if (f.exists())
				try {
					f.delete();
				} catch (Exception ignore) {
				}
		}
	}

	@Override
	public Category getById(int id, int ownerUserId) {
		return dao.getById(id, ownerUserId);
	}

	@Override
	public Category getByName(String name, int ownerUserId) {
		return dao.getByName(name, ownerUserId);
	}

	@Override
	public List<Category> getAllByUser(int ownerUserId) {
		return dao.getAllByUser(ownerUserId);
	}

	@Override
	public List<Category> searchByUser(String keyword, int ownerUserId) {
		return dao.searchByUser(keyword, ownerUserId);
	}
}
