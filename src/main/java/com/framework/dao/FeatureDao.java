package com.framework.dao;

import java.util.List;
import com.framework.model.Feature;

public interface FeatureDao {
	public List<Feature> getAllFeatures();
	public String createFeature(Feature feature,String[] usertypes);
	public int fwDeleteFeature(Feature feature);
	public int updateFeature(Feature feature);
}
