package com.framework.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.framework.serviceimplement.*;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.framework.model.AnswerBank;
import com.framework.model.Campaign;
import com.framework.model.CampaignPublisherMapping;
import com.framework.model.CampaignQuestion;
import com.framework.model.Publisher;
import com.framework.model.QuestionBank;

@Controller
public class CampignController {
	@Autowired
	CampaignServiceImpl CampaignServiceImpl;
	@Autowired
	QuestionBankServiceImpl questionBankService;
	@Autowired
	PublisherServiceImpl PublisherServiceImpl;

	@RequestMapping(value = "CampaignManagement", method = RequestMethod.GET)
	public ModelAndView getAllQuestion(HttpSession session) {
		List<Campaign> campaignList = CampaignServiceImpl.getAllCampaign(Integer.parseInt(session.getAttribute("id").toString()));
		ModelAndView mv = new ModelAndView("campaignmanagement");
		mv.addObject("Caimpaign", campaignList);
		return mv;
	}
	@RequestMapping(value = "cCampaign", method = RequestMethod.GET)
	public ModelAndView cCampaign(HttpSession session) {
		ModelAndView mv = new ModelAndView("createcampaign");
		return mv;
	}

	@RequestMapping(value ="createCampaign", method = RequestMethod.POST)
	public ModelAndView createCampaign(@ModelAttribute Campaign campaign, HttpSession session) {
		campaign.setCreator(Integer.parseInt(session.getAttribute("id").toString()));
		campaign.setModifiedBy(session.getAttribute("username").toString());
		int campId= CampaignServiceImpl.createCampaign(campaign);
		ModelAndView mv = new ModelAndView("redirect:/addCampaignQuestion?campaignId="+campId);
		return mv;
	}

	@RequestMapping(value = "updateCampaign", method = RequestMethod.POST)
	public ModelAndView updateCampaign(@ModelAttribute Campaign campaign, HttpSession session) {

		campaign.setModifiedBy(session.getAttribute("username").toString());
		String serverMsg = CampaignServiceImpl.updateCampaign(campaign);
		System.out.println(serverMsg);
		ModelAndView mv = new ModelAndView("redirect:/CampaignManagement");
		return mv;
	}
	@RequestMapping(value = "addCampaignQuestion", method = RequestMethod.GET)
	public ModelAndView addCampaignQuestion(@RequestParam int campaignId, HttpSession session) {
		ModelAndView mv = new ModelAndView("addcampaignquestion");
		List<QuestionBank> standardQuestion = questionBankService.getStanderdQuetion(campaignId);
		List<QuestionBank> clientQuestion = null;
		List<Integer> campaignQuestion = CampaignServiceImpl.getCampaignQuestionId(campaignId);
		System.out.println("Length="+standardQuestion.size());
		clientQuestion = questionBankService.getClientQuetion(Integer.parseInt(session.getAttribute("id").toString()),campaignId);
		mv.addObject("StanderdQuestion", standardQuestion);
		mv.addObject("ClientQuestion", clientQuestion);
		mv.addObject("campaignId", campaignId);
		mv.addObject("CampaignQuestion", campaignQuestion);
		return mv;
	}
	
	@RequestMapping(value = "newAddCampaignQuestion", method = RequestMethod.GET)
	public ModelAndView newAddCampaignQuestion(@RequestParam int campaignId, HttpSession session) {
		ModelAndView mv = new ModelAndView("newaddcampaignquestion");
		List<QuestionBank> standardQuestion = questionBankService.getStanderdQuetion(campaignId);
		List<QuestionBank> clientQuestion = null;
		List<Integer> campaignQuestion = CampaignServiceImpl.getCampaignQuestionId(campaignId);
		//System.out.println("Length="+standardQuestion.size());
		clientQuestion = questionBankService.getClientQuetion(Integer.parseInt(session.getAttribute("id").toString()),campaignId);
		mv.addObject("StanderdQuestion", standardQuestion);
		mv.addObject("ClientQuestion", clientQuestion);
		mv.addObject("campaignId", campaignId);
		mv.addObject("CampaignQuestion", campaignQuestion);
		return mv;
	}
	

	@RequestMapping(value = "addQuestion", method = RequestMethod.POST)
	@ResponseBody
	public String addQuestion(@RequestBody String str, HttpSession session) {
		System.out.println(str);
		String msg = CampaignServiceImpl.addQuestion(str);
		System.out.println(msg);
		return msg;
	}

	@RequestMapping(value = "ViewCampaignQuestion", method = RequestMethod.GET)
	public ModelAndView viewCampaignQuestion(@RequestParam int campaignId) {
		ModelAndView mv = new ModelAndView("viewcampaignquestion");
		List<CampaignQuestion> campaignQuestion = CampaignServiceImpl.getCampaignQuestion(campaignId);
		System.out.println(campaignQuestion.isEmpty());
		mv.addObject("campaignId", campaignId);
		mv.addObject("CampaignQuestion", campaignQuestion);
		return mv;
	}
	@RequestMapping(value = "ReorderCampaignQuestion", method = RequestMethod.GET)
	public ModelAndView reorderCampaignQuestion(@RequestParam int campaignId) {
		ModelAndView mv = new ModelAndView("reordercampaignquestion");
		List<CampaignQuestion> campaignQuestion = CampaignServiceImpl.getCampaignQuestion(campaignId);
		System.out.println(campaignQuestion.isEmpty());
		mv.addObject("campaignId", campaignId);
		mv.addObject("CampaignQuestion", campaignQuestion);
		return mv;
	}
	@RequestMapping(value="fupdateCampaignQuestion", method = RequestMethod.GET)
	public ModelAndView fupdateQuestion(@RequestParam int campaignId) {
		System.out.println("Received Campaign Id="+campaignId);
		List<Integer> list=CampaignServiceImpl.getCampaignQuestionId(campaignId);
		System.out.println(list);
		System.out.println("Check whether it is empty "+list.isEmpty());
		return new ModelAndView("redirect:/updateCampaignQuestion?questionId="+list.get(0)+"&campaignId="+campaignId+"&size="+list.size());
	}
	
	@RequestMapping(value="AddPublisher", method = RequestMethod.GET)
	public ModelAndView addPublisher(@RequestParam int campaignId) {
		System.out.println("Campaign Id="+campaignId);
		List<Publisher> list=PublisherServiceImpl.getAllPublisher();
		List<Publisher> campaignPub=PublisherServiceImpl.getCampaignPublisher(campaignId);
	    ModelAndView mv=new ModelAndView("addcampaignpublisher");
	    Campaign createdcampaign=CampaignServiceImpl.getCampaign(campaignId);
	    System.out.println("Client Link="+createdcampaign.getClientLink());
	    mv.addObject("clientLink",createdcampaign.getClientLink());
	    mv.addObject("callbackLink",createdcampaign.getCallbackLink());
	    mv.addObject("publishers",list);
	    mv.addObject("campaignPublisher",campaignPub);
	    mv.addObject("campaignId", campaignId);
	    return mv;
	}
	
	@RequestMapping(value="addPublisherToCampaign", method = RequestMethod.POST)
	@ResponseBody
	public String addPublisherToCampaign(@RequestBody String str) {
		Gson gson=new Gson();
		List<CampaignPublisherMapping> publishers=gson.fromJson(str, new TypeToken<List<CampaignPublisherMapping>>() {}.getType());
		try {
		CampaignServiceImpl.addPublisher(publishers);
		}
		catch(Exception ex){
			System.out.println(ex);
		}
		return "success";
	}
	
	
	@RequestMapping(value="updateCampaignQuestion", method = RequestMethod.GET)
	public ModelAndView updateQuestion(@RequestParam int questionId,@RequestParam int campaignId,@RequestParam int size) {
		List<Integer> questionIdlist=CampaignServiceImpl.getCampaignQuestionId(campaignId);
		questionId=questionIdlist.get(questionIdlist.size()-size);
		List<AnswerBank> list=CampaignServiceImpl.getAnswers(questionId);
		CampaignQuestion questionBank=CampaignServiceImpl.getQuestion(questionId);
		System.out.println(questionBank);
		ModelAndView mv=new ModelAndView("updatecampaignquestion");
		mv.addObject("Question",questionBank.getQuestion());
		mv.addObject("id",questionId);
		mv.addObject("campaignId",campaignId);
		mv.addObject("answerList",list);
		mv.addObject("QuestionCount", size);
		return mv;
	}
	@RequestMapping(value="adupdateCampaignQuestion", method = RequestMethod.GET)
	public ModelAndView updateQuestion(@RequestParam int questionId,@RequestParam int campaignId) {
		List<AnswerBank> list=CampaignServiceImpl.getAnswers(questionId);
		CampaignQuestion questionBank=CampaignServiceImpl.getQuestion(questionId);
		System.out.println(questionBank);
		ModelAndView mv=new ModelAndView("adupdatecampaignquestion");
		mv.addObject("Question",questionBank.getQuestion());
		mv.addObject("id",questionId);
		mv.addObject("campaignId",campaignId);
		mv.addObject("answerList",list);
		return mv;
	}
	@RequestMapping(value="updateCampaignQue",method=RequestMethod.POST)
	public ModelAndView updateCampaignQue(@RequestBody String questionbankStr,HttpSession session) {
		System.out.println("Updateing CQB ="+questionbankStr);
		Gson gson = new Gson();
		CampaignQuestion questionBank = gson.fromJson(questionbankStr, new TypeToken<CampaignQuestion>() {}.getType());
		try {
				System.out.println(gson.toJson(questionBank,CampaignQuestion.class));
				CampaignServiceImpl.updateQuestionBank(questionBank);
		}
		catch(Exception ex) {
			System.err.println(ex);
			System.out.println(ex);
		}
		ModelAndView mv=new ModelAndView("redirect:/questionmanagement");
		return mv;
	}
	
	@RequestMapping(value="deleteCampaignQuestion")
	public ModelAndView deleteQuestion(@RequestParam int questionId,@RequestParam int campaignId) {
		System.out.println("xyz");
		CampaignServiceImpl.deleteQuestion(questionId,campaignId);
		return new ModelAndView("redirect:/ViewCampaignQuestion?campaignId="+campaignId);
	}
	
	@RequestMapping(value="CopyCampaign")
	public ModelAndView copyCampaign(@ModelAttribute Campaign campaign) {
		System.out.println(campaign);
		CampaignServiceImpl.copyCampaign(campaign);
		return new ModelAndView("redirect:/CampaignManagement");
	}
	@RequestMapping(value="DeleteCampaign")
	public ModelAndView deleteCampaign(@ModelAttribute Campaign campaign) {
		CampaignServiceImpl.deleteCampaign(campaign);
		return new ModelAndView("redirect:/CampaignManagement");
	}
	@RequestMapping(value="ReorderQuestion",method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView reorderQuestion(@RequestBody String str) {
		System.out.println(str);
		Gson gson=new Gson();
		List<CampaignQuestion> campaignQuestion=gson.fromJson(str, new TypeToken<List<CampaignQuestion>>() {}.getType());
		CampaignServiceImpl.updateQuestionOrder(campaignQuestion);
		return new ModelAndView("home");
	}
	@RequestMapping(value="UpdateStatus",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView updateStatus(@RequestParam String status,@RequestParam int campaignId){
		CampaignServiceImpl.updateStatus(status,campaignId);
		return new ModelAndView("redirect:/CampaignManagement");
	}
	@RequestMapping(value="addQuestionToCampaign",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView addQuestionToCampaign(@RequestParam int campaignId){
		ModelAndView mv=new ModelAndView("createcampaignquestion");
		mv.addObject("campaignId",campaignId);
		return mv;
	}
	@RequestMapping(value="CampaignPublisher",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView getCampaignPublisher(@RequestParam int campaignId){
			List<Publisher> publishers = PublisherServiceImpl.getCampaignPublisher(campaignId);
			ModelAndView mv = new ModelAndView("campaignpublisher");
			mv.addObject("publishers", publishers);		
		    return mv;
	}
	
}