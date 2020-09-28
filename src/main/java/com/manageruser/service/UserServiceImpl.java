package com.manageruser.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.atomic.AtomicLong;

import org.springframework.stereotype.Service;

import com.manageruser.entities.User;

@Service
public class UserServiceImpl implements IUserService {

	private static final AtomicLong counter = new AtomicLong();

	private static List<User> getAllUser() {
		List<User> users = new ArrayList<User>();
		users.add(new User(counter.incrementAndGet(), "Sam", "NY", "sam@abc.com"));
		users.add(new User(counter.incrementAndGet(), "Tomy", "ALBAMA", "tomy@abc.com"));
		users.add(new User(counter.incrementAndGet(), "Kelly", "NEBRASKA", "kelly@abc.com"));
		return users;
	}

	private static List<User> users;

	static {
		users = getAllUser();
	}

	@Override
	public User findById(long id) {
		for (User user : users) {
			if (user.getId() == id) {
				return user;
			}
		}
		return null;
	}

	@Override
	public User findByName(String name) {
		for (User user : users) {
			if (user.getUsername().equalsIgnoreCase(name)) {
				return user;
			}
		}
		return null;
	}

	@Override
	public void saveUser(User user) {
		user.setId(counter.incrementAndGet());
		users.add(user);
	}

	@Override
	public void updateUser(User user) {
		int index = users.indexOf(user);
		users.set(index, user);
	}

	@Override
	public void deleteUserById(long id) {
		Iterator<User> iterator = users.iterator();
		while (iterator.hasNext()) {
			if (iterator.next().getId() == id) {
				iterator.remove();
			}
		}
	}

	@Override
	public List<User> findAllUsers() {
		return users;
	}

	@Override
	public void deleteAllUsers() {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean isUserExist(User user) {
		return findByName(user.getUsername()) != null;
	}

}
