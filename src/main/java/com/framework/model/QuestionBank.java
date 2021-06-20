package com.framework.model;

import java.util.List;

public class QuestionBank {
	int id;
	int userId;
	String usertype;
	String question;
	List<AnswerBank> answerList;
	int status;
	String tag;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUsertype() {
		return usertype;
	}
	public void setUsertype(String usertype) {
		this.usertype = usertype;
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
	
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	@Override
	public String toString() {
		return "QuestionBank [id=" + id + ", userId=" + userId + ", usertype=" + usertype + ", question=" + question
				+ ", answerList=" + answerList + ", status=" + status + "]";
	}
	
}
