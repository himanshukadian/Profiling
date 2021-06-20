package com.framework.model;

import java.util.List;

public class Dashboard {
		
	private Integer totalPublisher;
	private Integer totalClient;
	private Integer totalLiveCampaign;
	private List<Campaign> campaignList;
	
	public Integer getTotalPublisher() {
		return totalPublisher;
	}
	public void setTotalPublisher(Integer totalPublisher) {
		this.totalPublisher = totalPublisher;
	}
	public Integer getTotalClient() {
		return totalClient;
	}
	public void setTotalClient(Integer totalClient) {
		this.totalClient = totalClient;
	}
	public Integer getTotalLiveCampaign() {
		return totalLiveCampaign;
	}
	public void setTotalLiveCampaign(Integer totalLiveCampaign) {
		this.totalLiveCampaign = totalLiveCampaign;
	}
	public List<Campaign> getCampaignList() {
		return campaignList;
	}
	public void setCampaignList(List<Campaign> campaignList) {
		this.campaignList = campaignList;
	}
	
}
