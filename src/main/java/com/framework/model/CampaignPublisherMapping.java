package com.framework.model;

public class CampaignPublisherMapping {
	int id;
	int publisherId;
	int campaignId;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPublisherId() {
		return publisherId;
	}
	public void setPublisherId(int publisherId) {
		this.publisherId = publisherId;
	}
	public int getCampaignId() {
		return campaignId;
	}
	public void setCampaignId(int campaignId) {
		this.campaignId = campaignId;
	}
	@Override
	public String toString() {
		return "CampaignPublisherMapping [id=" + id + ", publisherId=" + publisherId + ", campaignId=" + campaignId
				+ "]";
	}
	
}
