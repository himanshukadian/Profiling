package com.framework.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.framework.model.AnswerBank;
import com.framework.model.QuestionBank;
import com.framework.serviceimplement.QuestionBankServiceImpl;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;


@Controller
public class QuestionController {
	@Autowired
	QuestionBankServiceImpl questionBankService;
	
	@RequestMapping(value="questionmanagement",method=RequestMethod.GET)
	public ModelAndView getAllQuestion(HttpSession session) {
		List<QuestionBank> questionBank=questionBankService.getUserQuetion(Integer.parseInt(session.getAttribute("id").toString()));
		ModelAndView mv=new ModelAndView("questionmanagement");
		mv.addObject("usertype",session.getAttribute("usertype").toString());
		mv.addObject("QuestionBank",questionBank);
		return mv;
	}
	@RequestMapping(value="createquestion",method=RequestMethod.POST)
	public ModelAndView createQuestion(@RequestBody String questionbankStr,HttpSession session) {
		System.out.println("questionList:::::"+questionbankStr);
		Gson gson = new Gson();
		QuestionBank questionBank = gson.fromJson(questionbankStr, new TypeToken<QuestionBank>() {}.getType());
		if(questionBank.getUserId()==0) {
		questionBank.setUserId(Integer.parseInt(session.getAttribute("id").toString()));
		questionBank.setUsertype(session.getAttribute("usertype").toString());
		}
		else {
			questionBank.setUsertype("campaign");
		}
		
		try {
				System.out.println(gson.toJson(questionBank,QuestionBank.class));
		        questionBankService.createQuestionBank(questionBank);
		}
		catch(Exception ex) {
			System.err.println(ex);
			System.out.println(ex);
		}
		ModelAndView mv=new ModelAndView("redirect:/questionmanagement");
		return mv;
	}
	@RequestMapping(value="viewAnswers")
	public ModelAndView viewAnswers(@RequestParam int questionId) {
		List<AnswerBank> list=questionBankService.getAnswers(questionId);
	    ModelAndView mv=new ModelAndView("viewAnswer");
	    mv.addObject("answerList",list);
		return mv;
	}
	@RequestMapping(value="deleteQuestion")
	public ModelAndView deleteQuestion(@RequestParam int questionId) {
		System.out.println("xyz");
		questionBankService.deleteQuestion(questionId);
		return new ModelAndView("redirect:/questionmanagement");
	}
	@RequestMapping(value="updateQuestion")
	public ModelAndView updateQuestion(@RequestParam int questionId) {
		List<AnswerBank> list=questionBankService.getAnswers(questionId);
		QuestionBank questionBank=questionBankService.getQuestion(questionId);
		ModelAndView mv=new ModelAndView("updatequestion");
		mv.addObject("Question",questionBank.getQuestion());
		mv.addObject("Tag",questionBank.getTag());
		mv.addObject("id",questionId);
		mv.addObject("answerList",list);
		return mv;
	}
	@RequestMapping(value="updateQue",method=RequestMethod.POST)
	public ModelAndView updateQue(@RequestBody String questionbankStr,HttpSession session) {
		System.out.println("Updateing QB="+questionbankStr);
		Gson gson = new Gson();
		QuestionBank questionBank = gson.fromJson(questionbankStr, new TypeToken<QuestionBank>() {}.getType());
		questionBank.setUserId(Integer.parseInt(session.getAttribute("id").toString()));
		questionBank.setUsertype(session.getAttribute("usertype").toString());
		try {
				System.out.println(gson.toJson(questionBank,QuestionBank.class));
		       questionBankService.updateQuestionBank(questionBank);
		}
		catch(Exception ex) {
			System.err.println(ex);
			System.out.println(ex);
		}
		ModelAndView mv=new ModelAndView("redirect:/questionmanagement");
		return mv;
	}
	
	
}
