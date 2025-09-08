package vn.iotstar.dao.impl;

import jakarta.persistence.EntityManager;
import vn.iotstar.configs.JPAConfig;
import vn.iotstar.dao.CategoryDao;
import vn.iotstar.entity.Category;
import java.util.List;

public class CategoryDaoImpl implements CategoryDao {

	public List<Category> findAll() {
		EntityManager enma = JPAConfig.getEntityManager();
		try {
			return enma.createQuery("SELECT c FROM Category c ORDER BY c.id", Category.class).getResultList();
		} finally {
			enma.close();
		}
	}

	public List<Category> findByUser(Integer userId) {
		EntityManager enma = JPAConfig.getEntityManager();
		try {
			return enma.createQuery("SELECT c FROM Category c WHERE c.user.id = :uid ORDER BY c.id", Category.class)
					.setParameter("uid", userId).getResultList();
		} finally {
			enma.close();
		}
	}

	public Category findById(Integer id) {
		EntityManager enma = JPAConfig.getEntityManager();
		try {
			return enma.find(Category.class, id);
		} finally {
			enma.close();
		}
	}

	public void insert(Category c) {
		EntityManager enma = JPAConfig.getEntityManager();
		try {
			enma.getTransaction().begin();
			enma.persist(c);
			enma.getTransaction().commit();
		} finally {
			if (enma.getTransaction().isActive())
				enma.getTransaction().rollback();
			enma.close();
		}
	}

	public void update(Category c) {
		EntityManager enma = JPAConfig.getEntityManager();
		try {
			enma.getTransaction().begin();
			enma.merge(c);
			enma.getTransaction().commit();
		} finally {
			if (enma.getTransaction().isActive())
				enma.getTransaction().rollback();
			enma.close();
		}
	}

	public void delete(Integer id) {
		EntityManager enma = JPAConfig.getEntityManager();
		try {
			enma.getTransaction().begin();
			Category c = enma.find(Category.class, id);
			if (c != null)
				enma.remove(c);
			enma.getTransaction().commit();
		} finally {
			if (enma.getTransaction().isActive())
				enma.getTransaction().rollback();
			enma.close();
		}
	}
}
