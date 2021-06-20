package com.framework.model;

import java.util.List;

public class Model {
	String name;
	List<Integer> data;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List<Integer> getData() {
		return data;
	}
	public void setData(List<Integer> data) {
		this.data = data;
	}
	@Override
	public String toString() {
		return "Model [name=" + name + ", data=" + data + "]";
	}
	
}
