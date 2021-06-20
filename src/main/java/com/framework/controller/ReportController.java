package com.framework.controller;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.framework.daoImplement.CampaignDaoImpl;
import com.framework.model.CampaignChart;
import com.framework.model.Dashboard;
import com.framework.model.Model;
import com.framework.model.QuestionChart;
import com.framework.service.DashboardService;
import com.framework.serviceimplement.CampaignServiceImpl;

@Controller
public class ReportController {	
	
	@Autowired
	DashboardService DashboardServiceImpl;
	@Autowired
	CampaignDaoImpl campaignDaoImpl;
	@Autowired
	CampaignServiceImpl CampaignServiceImpl;
	
	@RequestMapping(value = "DashboardReport", method = RequestMethod.GET)
	public ModelAndView dashboardReport(HttpSession session) {
		Dashboard db=DashboardServiceImpl.getDashboard();
		ModelAndView mv = new ModelAndView("dashboardreport");
		mv.addObject("Dashboard",db);
		return mv;
	}
	
	@RequestMapping(value="getCampaignChart",method=RequestMethod.GET)
	@ResponseBody
	public CampaignChart getCampaignChart(@RequestParam int campaignId) {
		CampaignChart campaignChart=new CampaignChart();
		campaignChart.setCampaign(campaignDaoImpl.getCampaign(campaignId).getDescription());
		List<String> categories = Arrays.asList("Publisher Hits","Client Hits","Platform Rejected Hits","Client Rejected Hits","Campaign Quota");
		campaignChart.setCategories(categories);
		campaignChart.setSeries(DashboardServiceImpl.getCampaignChartSeries(campaignId));
		CampaignServiceImpl.saveExportReport(campaignId);
		System.out.println("Campaign Series"+DashboardServiceImpl.getCampaignChartSeries(campaignId));
		return campaignChart;
	}
	@RequestMapping(value="getQuestionChart",method=RequestMethod.GET)
	@ResponseBody
	public QuestionChart getQuestionChart(int campaignId){
		return DashboardServiceImpl.getCampaignQuestionChart(campaignId);
	}

}
