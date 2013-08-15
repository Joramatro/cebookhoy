package com.amatic.ch.dao;

import java.util.List;

import com.amatic.ch.dto.User;

public interface UserDao {

	public void create(User user, boolean update);

	public boolean existsName(String name);

	public User find(String mail);

	// public User updateName(String mail, String name);

	public User findTopUser(String name);

	public List<User> findTopUsers();

	public User update(User user);

	public User updateIp(User user);

}
