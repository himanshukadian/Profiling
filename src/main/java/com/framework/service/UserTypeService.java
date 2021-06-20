package com.framework.service;

import java.util.List;
import com.framework.model.UserType;

public interface UserTypeService {
	
	public List<UserType> getAllUserType();
	public String addUserType(UserType usertype,Integer[] features);
	public String deleteUsertype(UserType usertype);
	public String updateUserType(UserType usertype);
}
