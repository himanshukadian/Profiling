package com.framework.model;

public class User {
	
	private Integer id;
	private String usertype;
	private String username;
	private String password;
    private String email;
	//private String clientLink;
	private String modifiedOn;
	private String createdOn;
	private String modifiedBy;
//	private String fileName;	
	
	
	
	public String getModifiedBy() {
		return modifiedBy;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setModifiedBy(String modifiedBy) {
		this.modifiedBy = modifiedBy;
	}
	public String getCreatedOn() {
		return createdOn;
	}
	public void setCreatedOn(String createdOn) {
		this.createdOn = createdOn;
	}
	public String getModifiedOn() {
		return modifiedOn;
	}
	public void setModifiedOn(String modifiedOn) {
		this.modifiedOn = modifiedOn;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsertype() {
		return usertype;
	}
	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
/*	public String getCallBackLink() {
		return callBackLink;
	}
	public void setCallBackLink(String callBackLink) {
		this.callBackLink = callBackLink;
	}
	public String getClientLink() {
		return clientLink;
	}
	public void setClientLink(String clientLink) {
		this.clientLink = clientLink;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}*/
	
	
}
