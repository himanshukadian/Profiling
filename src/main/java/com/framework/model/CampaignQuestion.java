package com.framework.model;

import java.util.List;

public class CampaignQuestion {
	int id;
	int campaignId;
	String question;
	int order;
	List<AnswerBank> answerList;
	int status;
	int questionid;
	String tag;
	
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCampaignId() {
		return campaignId;
	}
	public void setCampaignId(int campaignId) {
		this.campaignId = campaignId;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public List<AnswerBank> getAnswerList() {
		return answerList;
	}
	public void setAnswerList(List<AnswerBank> answerList) {
		this.answerList = answerList;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getOrder() {
		return order;
	}
	public void setOrder(int order) {
		this.order = order;
	}
	
	public int getQuestionid() {
		return questionid;
	}
	public void setQuestionid(int questionid) {
		this.questionid = questionid;
	}
	@Override
	public String toString() {
		return "CampaignQuestion [id=" + id + ", campaignId=" + campaignId + ", question=" + question + ", order="
				+ order + ", answerList=" + answerList + ", status=" + status + ", questionid=" + questionid + "]";
	}

	
	
}
