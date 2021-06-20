package com.framework.service;

import java.util.List;

import com.framework.model.Dashboard;
import com.framework.model.QuestionChart;

public interface DashboardService {
	public Dashboard getDashboard();
	public List<List<Integer>> getCampaignChartSeries(int campaignId);
	public QuestionChart getCampaignQuestionChart(int campaignId);
}
