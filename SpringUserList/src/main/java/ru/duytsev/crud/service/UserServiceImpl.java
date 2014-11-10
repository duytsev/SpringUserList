package ru.duytsev.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ru.duytsev.crud.dao.UserDao;
import ru.duytsev.crud.model.User;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;

	@Override
	@Transactional
	public void addUser(User user) {
		userDao.addUser(user);
	}

	@Override
	@Transactional
	public void updateUser(User user) {
		userDao.updateUser(user);
	}

	@Override
	@Transactional
	public void deleteUser(int id) {
		userDao.deleteUser(id);
	}

	@Override
	@Transactional
	public User getUserById(int id) {
		return userDao.getUserById(id);
	}

	@Override
	@Transactional
	public List<User> listUsers() {
		return userDao.listUsers();
	}

}
