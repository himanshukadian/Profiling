package com.framework.serviceimplement;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.framework.dao.UserTypeDao;
import com.framework.daoImplement.UserFeatureMappingDaoImpl;
import com.framework.model.Feature;
import com.framework.model.UserType;
import com.framework.service.UserFeatureMappingService;

@Service
public class UserFeatureMappingServiceImpl implements UserFeatureMappingService{
	
	@Autowired
	UserFeatureMappingDaoImpl userFeatureMappingDaoImpl;
	@Autowired
	UserTypeDao userTypeDao;

	@Override
	public List<Feature> getFeaturesOfUserType(String username) {
		UserType userType=new UserType();
		userType=userTypeDao.getUserType(username);
		return userFeatureMappingDaoImpl.getFeatureOfUserType(userType);
	}

}
