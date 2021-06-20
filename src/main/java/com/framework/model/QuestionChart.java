package com.framework.model;

import java.util.List;

public class QuestionChart {
	private List<String> categories;
	private List<Model> series;
	public List<String> getCategories() {
		return categories;
	}
	public void setCategories(List<String> categories) {
		this.categories = categories;
	}
	public List<Model> getSeries() {
		return series;
	}
	public void setSeries(List<Model> series) {
		this.series = series;
	}
	@Override
	public String toString() {
		return "QuestionChart [categories=" + categories + ", series=" + series + "]";
	}
	
}
