package ru.duytsev.crud.service;

import java.util.List;

import ru.duytsev.crud.model.User;

public interface UserService {

	public void addUser(User user);
	public void updateUser(User user);
	public void deleteUser(int id);
	public User getUserById(int id);
	public List<User> listUsers();
}
