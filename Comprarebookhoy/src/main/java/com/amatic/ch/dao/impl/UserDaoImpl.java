package com.amatic.ch.dao.impl;

import static com.googlecode.objectify.ObjectifyService.ofy;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.springframework.stereotype.Repository;


import com.amatic.ch.dao.UserDao;
import com.amatic.ch.dto.User;
import com.googlecode.objectify.Ref;

@Repository
public class UserDaoImpl implements UserDao {

	public void copyUser(User updateUser, User user) {
		updateUser.setDate(user.getDate());
		updateUser.setIpAddress(user.getIpAddress());
		updateUser.setMail(user.getMail());
		updateUser.setName(user.getName());
		updateUser.setVotes(user.getVotes());
		updateUser.setAvatarUrl(user.getAvatarUrl());
		updateUser.setChatHistory(user.getChatHistory());
	}

	@Override
	public void create(User user, boolean update) {
		user.setDate(new Date());
		ofy().save().entity(user);
	}

	@Override
	public boolean existsName(String name) {
		Ref<User> refUser = ofy().load().type(User.class).filter("name", name)
				.first();
		if (refUser.get() != null) {
			return true;
		} else {
			return false;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public User find(String mail) {
		User user = ofy().load().type(User.class).id(mail).safeGet();
		return user;
	}

	@Override
	public User findTopUser(String name) {
		User user = null;
		// name unique
		user = ofy().load().type(User.class).filter("name", name).first().get();

		return user;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> findTopUsers() {
		List<User> topUsers = new ArrayList<User>();

		List<User> users = ofy().load().type(User.class).order("-votes").list();

		if (users != null) {
			Iterator<User> iUser = users.iterator();
			int count = 0;
			while (iUser.hasNext() && count < 10) {
				User user = iUser.next();
				if (user.getName() != null && !user.getName().trim().equals("")) {
					topUsers.add(user);
					count++;
				}
			}
		}

		return topUsers;
	}

	@Override
	public User update(User user) {

		User updateUser = ofy().load().type(User.class).id(user.getMail())
				.safeGet();

		copyUser(updateUser, user);

		ofy().save().entity(updateUser);

		return updateUser;
	}

	// @Override
	// /*
	// * public User updateName(String mail, String name) {
	// *
	// * User updateUser = ofy().load().type(User.class).id(mail).safeGet();
	// *
	// * updateUser.setName(name);
	// *
	// * ofy().save().entity(updateUser);
	// *
	// * return updateUser; }
	// */
	@Override
	public User updateIp(User user) {

		User updateUser = ofy().load().type(User.class).id(user.getMail())
				.safeGet();

		updateUser.setIpAddress(user.getIpAddress());
		updateUser.setDate(new Date());

		ofy().save().entity(updateUser);

		return updateUser;
	}
}
