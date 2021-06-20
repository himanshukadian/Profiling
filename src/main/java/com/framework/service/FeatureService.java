package com.framework.service;

import java.util.List;
import com.framework.model.Feature;

public interface FeatureService {
	public List<Feature> getAllFeatures();
	public String createFeature(Feature feature,String[] usertypes);
	public String fwDeleteFeature(Feature feature);
	public String updateFeature(Feature feature);
	public Feature getFeature(String feature);
}
