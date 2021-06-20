package com.framework.serviceimplement;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.framework.daoImplement.CampaignDaoImpl;
import com.framework.daoImplement.DashboardDaoImpl;
import com.framework.daoImplement.PublisherDaoImpl;
import com.framework.model.Dashboard;
import com.framework.model.QuestionChart;
import com.framework.service.DashboardService;

@Service
public class DashboardServiceImpl implements DashboardService{
	
	@Autowired
	DashboardDaoImpl dashboardDao;
	@Autowired
	CampaignDaoImpl campaignDaoImpl;
	@Autowired
	PublisherDaoImpl publisherDaoImpl;
	
	@Override
	public Dashboard getDashboard() {
		Dashboard db=new Dashboard();
		try {
			db.setCampaignList(campaignDaoImpl.getLiveCampaign());
			db.setTotalLiveCampaign(campaignDaoImpl.getLiveCampaign().size());
			db.setTotalPublisher(publisherDaoImpl.getAllPublisher().size());
			db.setTotalClient(campaignDaoImpl.getClient());
		}
		catch(Exception ex) {
			System.err.println("Exception:"+ex);
		}
		return db;
	}

	@Override
	public List<List<Integer>> getCampaignChartSeries(int campaignId) {
		try {
		return campaignDaoImpl.getCampaignChartSeries(campaignId);
		}
		catch(Exception ex) {
			System.out.println(ex);
			return null;
		}
	}

	@Override
	public QuestionChart getCampaignQuestionChart(int campaignId) {
		try {
			return campaignDaoImpl.getCampaignQuestionChart(campaignId);
			}
			catch(Exception ex) {
				System.out.println(ex);
				return null;
			}
	}

}
