package com.framework.model;

public class Campaign {
	@Override
	public String toString() {
		return "Campaign [id=" + id + ", creator=" + creator + ", description=" + description + ", questions="
				+ questions + ", status=" + status + ", callbackLink=" + callbackLink + ", clientLink=" + clientLink
				+ ", modifiedBy=" + modifiedBy + ", quota=" + quota + "]";
	}
	int id;
	int creator;
	String description;
	int questions;
	String status;
	String callbackLink;
	String clientLink;
	String modifiedBy;
	int quota;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCreator() {
		return creator;
	}
	public void setCreator(int creator) {
		this.creator = creator;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getQuestions() {
		return questions;
	}
	public void setQuestions(int questions) {
		this.questions = questions;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getModifiedBy() {
		return modifiedBy;
	}
	public void setModifiedBy(String modifiedBy) {
		this.modifiedBy = modifiedBy;
	}
	public int getQuota() {
		return quota;
	}
	public void setQuota(int quota) {
		this.quota = quota;
	}
	public String getCallbackLink() {
		return callbackLink;
	}
	public void setCallbackLink(String callbackLink) {
		this.callbackLink = callbackLink;
	}
	public String getClientLink() {
		return clientLink;
	}
	public void setClientLink(String clientLink) {
		this.clientLink = clientLink;
	}
	

}
