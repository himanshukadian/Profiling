package com.framework.serviceimplement;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.framework.daoImplement.UserFeatureMappingDaoImpl;
import com.framework.daoImplement.UserTypeDaoImpl;
import com.framework.model.UserType;
import com.framework.service.UserTypeService;

@Service
public class UserTypeServiceImpl implements UserTypeService {

	@Autowired
	UserTypeDaoImpl userTypeDao;
	@Autowired
	UserFeatureMappingDaoImpl userFeatureMapping;

	@Override
	public List<UserType> getAllUserType() {
		// TODO Auto-generated method stub
		List<UserType> usertype = null;
		try {
			usertype = userTypeDao.getAllUserType();
		} catch (Exception e) {
			System.out.println(e);
		}
		return usertype;
	}
	public List<UserType> getCreateUserType() {
		// TODO Auto-generated method stub
		List<UserType> usertype = null;
		try {
			usertype = userTypeDao.getcreatUserType();
		} catch (Exception e) {
			System.out.println(e);
		}
		return usertype;
	}

	@Override
	public String addUserType(UserType usertype, Integer[] features) {
		int i = 0;
		try {
			i = userTypeDao.addUserType(usertype);
			System.out.println("Received id="+i);
			System.out.println(i!=0);
			if (i!=0) {
				for (int j = 0; j < features.length; j++) {
					try {
						System.out.println(features[j]);
						userFeatureMapping.mapuserIdtoFeature(features[j], i);
					} catch (Exception ex) {
						System.err.println(ex);
						return "Error";
					}
				}
				System.out.println("User Type Added successfully!!");
				return "User Type Added successfully!!";
			} else {
				System.out.println("Add User Type Failed");
				return "Add User Type Failed";
			}
		} catch (Exception e) {
			System.err.println(e);
			System.out.println("Add User Type Failed");
			return "Add User Type Failed";
		}
	}

	@Override
	public String deleteUsertype(UserType usertype) {

		try {
			int i = userTypeDao.deleteUserType(usertype);
			if(i!=0) {
				System.out.println("User Type Deleted Sucessfully!!");
				return "User Type Deleted Sucessfully!!";
			}
			else
			{
				System.out.println("User Type Deletion failed!!");
				return "User Type Deletion failed!!";
			}
		} catch (Exception ex) {
			System.err.println(ex);
			return "User Type Deletion failed!!";
		}
	}

	@Override
	public String updateUserType(UserType usertype) {
		try {
			int i = userTypeDao.updateUserType(usertype);
			if(i!=0) {
				System.out.println("User Type Updated Sucessfully!!");
				return "User Type Updated Sucessfully!!";
			}
			else
			{
				System.out.println("User Type Updation failed!!");
				return "User Type Updation failed!!";
			}
		} catch (Exception ex) {
			System.err.println(ex);
			return "User Type Updation failed!!";
		}
	}

}