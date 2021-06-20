package com.framework.dao;

import java.util.List;
import com.framework.model.User;

public interface UserDao {
		public int createUser(User user,String modifiedBy);
		public User getUser(String username);
		public List<User> getAllUser();
		public int deleteUser(User user,String modifiedBy);
		public int updateUser(User user,String modifiedBy);
}
