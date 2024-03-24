package com.ebanking.service;

import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.ebanking.entity.User;

public interface UserService {
	public List<User> findAll();
	
	public User find(long id);
	
	public void hash(User user);
	
	public User save(User user);
	
	public User update(User user);
	
	public void delete(long id);
	
	public void bindRole(User user);
	
	public void deleteRole(User user);
	
	public int countAccount(List<User> users);
	
	public void createNewUser(User user, HttpServletRequest request) throws ParseException;
	
	public User getCurrentUser();
	
	public void editProfile(User user, HttpServletRequest request);
	
	public void editFullProfile(User user, HttpServletRequest request);
}
