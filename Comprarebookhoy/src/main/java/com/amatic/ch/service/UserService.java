package com.amatic.ch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amatic.ch.dao.UserDao;
import com.amatic.ch.dto.User;


@Service
public class UserService {
	@Autowired
	private UserDao userDao;

	public void create(User user, boolean update) {
		this.userDao.create(user, update);
	}

	public boolean existsName(String name) {
		return this.userDao.existsName(name);
	}

	public User findTopUser(String name) {
		return this.userDao.findTopUser(name);
	}

	/*
	 * public User updateUserName(String mail, String name) { return
	 * this.userDao.updateName(mail, name); }
	 */

	public List<User> findTopUsers() {
		return this.userDao.findTopUsers();
	}

	public User findUser(String mail) {
		return this.userDao.find(mail);
	}

	public User update(User user) {
		return this.userDao.update(user);
	}

	public User updateUserIp(User user) {
		return this.userDao.updateIp(user);
	}

}
