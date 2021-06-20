package com.framework.service;

import java.util.List;
import com.framework.model.Feature;

public interface UserFeatureMappingService {
	public List<Feature> getFeaturesOfUserType(String username);
}
