package vn.iotstar.dao.impl;

import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import vn.iotstar.configs.JPAConfig;
import vn.iotstar.dao.UserDao;
import vn.iotstar.entity.User;

public class UserDaoImpl implements UserDao {

	@Override
	public User findByUsername(String username) {
		EntityManager enma = JPAConfig.getEntityManager();
		try {
			return enma.createQuery("SELECT u FROM User u WHERE u.username = :u", User.class).setParameter("u", username)
					.getSingleResult();
		} catch (NoResultException e) {
			return null;
		} finally {
			enma.close();
		}
	}

	@Override
	public User findById(Integer id) {
		EntityManager enma = JPAConfig.getEntityManager();
		try {
			return enma.find(User.class, id);
		} finally {
			enma.close();
		}
	}

	@Override
	public void insert(User u) {
		EntityManager enma = JPAConfig.getEntityManager();
		try {
			enma.getTransaction().begin();
			enma.persist(u);
			enma.getTransaction().commit();
		} finally {
			if (enma.getTransaction().isActive())
				enma.getTransaction().rollback();
			enma.close();
		}
	}

	public void update(User u) {
		EntityManager enma = JPAConfig.getEntityManager();
		try {
			enma.getTransaction().begin();
			enma.merge(u);
			enma.getTransaction().commit();
		} finally {
			if (enma.getTransaction().isActive())
				enma.getTransaction().rollback();
			enma.close();
		}
	}
}
