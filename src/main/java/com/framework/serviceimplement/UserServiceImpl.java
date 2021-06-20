package com.framework.serviceimplement;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.framework.daoImplement.UserDaoImpl;
import com.framework.model.Pass;
import com.framework.model.User;
import com.framework.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserDaoImpl userDao;

	@Override
	public String addUser(User user,String modifiedBy) {
		try{
			int i=userDao.createUser(user,modifiedBy);
			if(i==1) {
				return "User created successfully";
			}
			else {
				return "User is not created successfully";
			}
		}
		catch(Exception e){
			System.out.println(e);
			return null;
		}
	}

	@Override
	public List<User> getAllUser() {
		return userDao.getAllUser();
	}

	@Override
	public String deleteUser(User user,String modifiedBy) {
		int i=userDao.deleteUser(user,modifiedBy);
		if(i==1) {
			return "User Deleted successfully";
		}
		else{
			return "User not Deleted";
		}
	}

	@Override
	public String updateUser(User user,String modifiedBy) {
		// TODO Auto-generated method stub
		int i=userDao.updateUser(user,modifiedBy);
		if(i==1) {
			return "User updated successfully";
		}
		else{
			return "User not updated";
		}
	}

	@Override
	public User getUser(String username) {
		// TODO Auto-generated method stub
		return userDao.getUser(username);
	}

	public String verifyUser(User user) {
		if(user.getUsername()!=null) {
		User serveruser =userDao.getUser(user.getUsername());
		if(serveruser.getUsername()==null) {
			return "USER DOES NOT EXIST PLEASE CONTACT ADMIN !!";
		}
		else {
			if((user.getPassword().equals(serveruser.getPassword())) && (user.getUsertype().equals(serveruser.getUsertype()))) {
				return "True";
			}
			else {
				return "USER NAME AND PASSWORD DOES NOT MATCH !!";
			}
		}
		}
		else {
			return "PLEASE LOGIN FIRST !!";
		}
			
	}

	public String changepassword(Pass pass,String username) {
		int i=userDao.changepassword(pass,username);
		if(i==1) {
			return "Password changed successfully";
		}
		else{
			return "Wrong old password!!";
		}
	}
}
