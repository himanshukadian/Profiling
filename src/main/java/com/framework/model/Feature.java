package com.framework.model;

import java.util.List;

public class Feature {
	private String modifiedOn;
	private String createdOn;
	private Integer id;
	private Integer pid;
	private String logo;
	private String featureName;
	private String link;
	private List<Feature> subfeature;
	
	
	public String getModifiedOn() {
		return modifiedOn;
	}
	public void setModifiedOn(String modifiedOn) {
		this.modifiedOn = modifiedOn;
	}
	public String getCreatedOn() {
		return createdOn;
	}
	public void setCreatedOn(String createdOn) {
		this.createdOn = createdOn;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	public String getFeatureName() {
		return featureName;
	}
	public void setFeatureName(String featureName) {
		this.featureName = featureName;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public List<Feature> getSubfeature() {
		return subfeature;
	}
	public void setSubfeature(List<Feature> subfeature) {
		this.subfeature = subfeature;
	}
	
	
}
