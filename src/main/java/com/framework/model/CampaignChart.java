package com.framework.model;

import java.util.List;

public class CampaignChart {
	private String campaign;
	private List<String> categories;
	private List<List<Integer>> series;
	
	public List<String> getCategories() {
		return categories;
	}
	public void setCategories(List<String> categories) {
		this.categories = categories;
	}
	public List<List<Integer>> getSeries() {
		return series;
	}
	public void setSeries(List<List<Integer>> series) {
		this.series = series;
	}
	
	
	public String getCampaign() {
		return campaign;
	}
	public void setCampaign(String campaign) {
		this.campaign = campaign;
	}
	@Override
	public String toString() {
		return "CampaignChart [categories=" + categories + ", series=" + series + "]";
	}
	
	
}
