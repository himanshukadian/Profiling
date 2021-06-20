package com.framework.service;

import java.util.List;

import com.framework.model.Campaign;
import com.framework.model.CampaignQuestion;

public interface CampaignService {
	public List<Campaign> getAllCampaign(int creator);
	public int createCampaign(Campaign campaign);
	public String updateCampaign(Campaign campaign);
	public List<CampaignQuestion> getCampaignQuestion(int campaignId);
}
