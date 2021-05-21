package com.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.springboot.web.model.User;

public interface UserRepository extends CrudRepository<User, Integer> {	
	List<User> findByUsername(String lastName);
	public User findByUsernameAndPassword(String username, String password);
}
