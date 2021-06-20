package com.framework.serviceimplement;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.framework.daoImplement.QuestionBankDaoImpl;
import com.framework.model.AnswerBank;
import com.framework.model.QuestionBank;
import com.framework.service.QuestionBankService;

@Service
public class QuestionBankServiceImpl implements QuestionBankService{
	@Autowired
	QuestionBankDaoImpl questionBankDao;
	@Override
	public List<QuestionBank> getAllQuestion(int campaignId) {
		return questionBankDao.getAllQuetion(campaignId);
	}
	@Override
	public String createQuestionBank(QuestionBank questionBank) {
		try {
		int i=questionBankDao.saveQuestion(questionBank);
		System.out.println("Question Saved");
		try {
			questionBankDao.saveAnswerBank(questionBank.getAnswerList(), i);
			System.out.println("Answers Saved");
			return "Question Saved";
		}
		catch(Exception ex) {
			System.out.println(ex);
			return "Error Saveing Question";
		}
		}
		catch(Exception e) {
			return "Error Saveing Question";
		}
	}
	public List<AnswerBank> getAnswers(int questionId){
		return questionBankDao.getAnswerOfQuestion(questionId);
	}
	@Override
	public int deleteQuestion(int questionId) {
		return questionBankDao.deleteQuestion(questionId);
	}
	public String updateQuestionBank(QuestionBank questionBank) {
		int i=questionBankDao.updateQuestion(questionBank);
		int j=-1;
		if(i!=0) 
			j=questionBankDao.updateAnswerBank(questionBank.getAnswerList(), questionBank.getId());
		if(j>0) {
			System.out.println("Question Updated");
			return "Question Updated";
		}
		else {
			System.out.println("Error Updating Question");
			return "Error Updating Question";
		}
		
	}
	@Override
	public List<QuestionBank> getUserQuetion(int id) {
	return questionBankDao.getUserQuetion(id);
	}
	@Override
	public QuestionBank getQuestion(int questionId) {
		return questionBankDao.getQuestion(questionId);
	}
	public List<QuestionBank> getStanderdQuetion(int campaignId) {
		return questionBankDao.getStanderdQuetion(campaignId);
	}
	public List<QuestionBank> getClientQuetion(int userId, int campaignId) {
		return questionBankDao.getClientQuetion(userId,campaignId);
	}
}
