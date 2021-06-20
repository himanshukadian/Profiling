package com.framework.dao;

import java.util.List;

import com.framework.model.AnswerBank;
import com.framework.model.QuestionBank;

public interface QuestionBankDao {
	public List<QuestionBank> getAllQuetion(int campaignId);
	public List<QuestionBank> getUserQuetion(int id);
	public List<AnswerBank> getAnswerOfQuestion(int questionid);
	public int saveQuestion(QuestionBank qb);
	public int saveAnswerBank(List<AnswerBank> AnswerList,int questionId);
	public QuestionBank getQuestion(int questionId);
}
