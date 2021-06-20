package com.framework.model;

import java.util.List;

public class ExportReport {
	private int campaignId;
	private String status;
	private String startDate;
	private String endDate;
	private String providerName;
	private String providerId;
	private String respondentId;
	private String startTime;
	private String endTime;
	private String duration;
	
	List<String> dynamicColumn;
	public int getCampaignId() {
		return campaignId;
	}
	public void setCampaignId(int campaignId) {
		this.campaignId = campaignId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getProviderName() {
		return providerName;
	}
	public void setProviderName(String providerName) {
		this.providerName = providerName;
	}
	public String getProviderId() {
		return providerId;
	}
	public void setProviderId(String providerId) {
		this.providerId = providerId;
	}
	public String getRespondentId() {
		return respondentId;
	}
	public void setRespondentId(String respondentId) {
		this.respondentId = respondentId;
	}
	public List<String> getDynamicColumn() {
		return dynamicColumn;
	}
	public void setDynamicColumn(List<String> dynamicColumn) {
		this.dynamicColumn = dynamicColumn;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	@Override
	public String toString() {
		return "ExportReport [campaignId=" + campaignId + ", status=" + status + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", providerName=" + providerName + ", providerId=" + providerId
				+ ", respondentId=" + respondentId + ", startTime=" + startTime + ", endTime=" + endTime + ", duration="
				+ duration + ", dynamicColumn=" + dynamicColumn + "]";
	}
	
	
	
	
}
