package vn.iotstar.services;

import vn.iotstar.entity.Category;
import java.util.List;

public interface CategoryService {
    List<Category> findAll();
    List<Category> findByUser(Integer userId);
    Category findById(Integer id);
    void insert(Category c);
    void update(Category c);
    void delete(Integer id);
}
