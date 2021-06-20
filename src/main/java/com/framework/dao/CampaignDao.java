package com.framework.dao;

import java.util.List;
import com.framework.model.Campaign;
import com.framework.model.CampaignAnswer;
import com.framework.model.CampaignQuestion;
import com.framework.model.QuestionBank;

public interface CampaignDao {
	public List<Campaign> getAllCampaign(int creator);
	public int createCampaign(Campaign campaign);
	public int updateCampaign(Campaign campaign);
	public int saveCampaignQuestion(QuestionBank questionBank,int order,int campaignId);
	public Campaign getCampaign(int campaignId);
	public List<CampaignQuestion> getCampaignQuestion(int campaignId);
	public List<CampaignAnswer> getQuestionAnswers(int questionId);
}
