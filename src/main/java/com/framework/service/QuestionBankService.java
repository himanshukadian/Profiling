package com.framework.service;

import java.util.List;

import com.framework.model.AnswerBank;
import com.framework.model.QuestionBank;

public interface QuestionBankService {
	public List<QuestionBank> getAllQuestion(int campaignId);
	public List<QuestionBank> getUserQuetion(int id);
	public String createQuestionBank(QuestionBank qb);
	public List<AnswerBank> getAnswers(int questionId);
	public int deleteQuestion(int questionId);
	public QuestionBank getQuestion(int questionId);
}
