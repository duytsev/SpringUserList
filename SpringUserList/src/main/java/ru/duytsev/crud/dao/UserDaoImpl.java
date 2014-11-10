package ru.duytsev.crud.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ru.duytsev.crud.model.User;

@Repository
public class UserDaoImpl implements UserDao {

	private static Logger logger = LoggerFactory.getLogger(UserDaoImpl.class);

	@Autowired
	SessionFactory sf;

	@Override
	public void addUser(User user) {
		Session session = sf.getCurrentSession();
		session.persist(user);
		logger.info("User = {} successfully added", user);
	}

	@Override
	public void updateUser(User user) {
		Session session = sf.getCurrentSession();
		session.update(user);
		logger.info("User = {} successfully updated", user);
	}

	@Override
	public void deleteUser(int id) {
		Session session = sf.getCurrentSession();
		User user = (User) session.load(User.class, new Integer(id));
		if (user != null) {
			session.delete(user);
			logger.info("User = {} successfully deleted", user);
		} else {
			logger.warn("No user found with id = {}", id);
		}

	}

	@Override
	public User getUserById(int id) {
		Session session = sf.getCurrentSession();
		User user = (User) session.load(User.class, new Integer(id));
		logger.info("User = {} successfully loaded", user);
		return user;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> listUsers() {
		Session session = sf.getCurrentSession();
		List<User> users = session.createQuery("FROM User").list();
		for (User user : users) {
			logger.info("User list:: {}", user);
		}
		return users;
	}

}
