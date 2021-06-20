package com.framework.dao;

import java.util.List;

import com.framework.model.Feature;
import com.framework.model.UserType;

public interface UserFeatureMappingDao {
	public List<Integer> getFeaturesId(UserType userType);
	public List<Feature> getFeatureOfUserType(UserType userType);
}
