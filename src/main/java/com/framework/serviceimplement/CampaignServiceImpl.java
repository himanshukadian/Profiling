package com.framework.serviceimplement;

import java.io.File;
import java.io.FileWriter;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.framework.daoImplement.CampaignDaoImpl;
import com.framework.daoImplement.QuestionBankDaoImpl;
import com.framework.model.AnswerBank;
import com.framework.model.Campaign;
import com.framework.model.CampaignPublisherMapping;
import com.framework.model.CampaignQuestion;
import com.framework.model.ExportReport;
import com.framework.model.Publisher;
import com.framework.model.QuestionBank;
import com.framework.service.CampaignService;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

@Service
public class CampaignServiceImpl implements CampaignService {
	@Autowired
	CampaignDaoImpl campaignDaoImpl;
	@Autowired
	QuestionBankDaoImpl questionBankDao;
	@Autowired
	PublisherServiceImpl PublisherServiceImpl;
	@Override
	public List<Campaign> getAllCampaign(int creator) {
		return campaignDaoImpl.getAllCampaign(creator);
	}
	
	public Campaign getCampaign(int campaignId) {
		return campaignDaoImpl.getCampaign(campaignId);
	}
	
	public int createCampaign(Campaign campaign) {
			return campaignDaoImpl.createCampaign(campaign);
	}

	public String updateCampaign(Campaign campaign) {
		try {
			int i = campaignDaoImpl.updateCampaign(campaign);
			System.out.println(i);
			if (i != 0) {
				return "Campaign Updated Successfully";
			} else {
				return "Campaign Updation Failed";
			}
		} catch (Exception ex) {
			System.err.println(ex);
			System.out.println(ex);
			return "Exception";
		}
	}

	public String addQuestion(String str) {
		Gson gson = new Gson();
		List<CampaignQuestion> campaignQuestion = gson.fromJson(str, new TypeToken<List<CampaignQuestion>>() {
		}.getType());
		try {
			int j=0;
			int campaignId1 = 0;
			if (!campaignQuestion.isEmpty()) {
				campaignId1 = campaignQuestion.get(0).getCampaignId();
				campaignDaoImpl.updateNumberofQuestions(campaignId1, campaignQuestion.size());
				j=campaignDaoImpl.getCampaignQuestion(campaignId1).size();
			}
			for (int i = 0; i < campaignQuestion.size(); i++) {
				int questionId = campaignQuestion.get(i).getId();
				int campaignId = campaignQuestion.get(i).getCampaignId();
				int savediquestionid = campaignDaoImpl.saveCampaignQuestion(questionBankDao.getQuestion(questionId), i+j,
						campaignId);
				campaignDaoImpl.saveAnswerBank(questionBankDao.getAnswerOfQuestion(questionId), savediquestionid);
			}
			return "Campaign Question added Successfully!!";
		} catch (Exception ex) {
			return "Failed to add Campaign Question!!";
		}
	}

	@Override
	public List<CampaignQuestion> getCampaignQuestion(int campaignId) {
		try {
			return campaignDaoImpl.getCampaignQuestion(campaignId);
		} catch (Exception ex) {
			System.out.println(ex);
			System.err.println(ex);
			return null;
		}
	}

	public CampaignQuestion getQuestion(int questionId) {
		try {
			return campaignDaoImpl.getQuestion(questionId);
		} catch (Exception ex) {
			System.out.println(ex);
			System.err.println(ex);
			return null;
		}
	}

	public List<AnswerBank> getAnswers(int questionId) {
		try {
			return campaignDaoImpl.getAnswers(questionId);
		} catch (Exception ex) {
			System.out.println(ex);
			System.err.println(ex);
			return null;
		}
	}

	public String updateQuestionBank(CampaignQuestion questionBank) {
		int i = campaignDaoImpl.updateQuestion(questionBank);
		int j = -1;
		if (i != 0)
			j = campaignDaoImpl.updateAnswerBank(questionBank.getAnswerList(), questionBank.getId());
		System.out.println("J is=" + j);
		if (j > 0) {
			System.out.println("Question Updated");
			return "Question Updated";
		} else {
			System.out.println("Error Updating Question");
			return "Error Updating Question";
		}
	}

	public int deleteQuestion(int questionId,int campaignId) {
		campaignDaoImpl.updateNumberofQuestions(campaignId, -1);
		return campaignDaoImpl.deleteQuestion(questionId);
	}

	public void copyCampaign(Campaign campaign) {
		Campaign camp = campaignDaoImpl.getCampaign(campaign.getId());
		System.out.println(camp);
		List<CampaignQuestion> campQuestion = campaignDaoImpl.getCampaignQuestion(campaign.getId());
		camp.setDescription(campaign.getDescription());
		camp.setClientLink(camp.getClientLink());
		camp.setCallbackLink(camp.getCallbackLink());
		int campId = campaignDaoImpl.createCampaign(camp);
		List<Publisher> publishers=PublisherServiceImpl.getCampaignPublisher(campaign.getId());
		List<CampaignPublisherMapping> cpublishers=new ArrayList<CampaignPublisherMapping>();
		System.out.println("Going to  copy publisher of campaign!!");
		System.out.println("List of campaign publisher="+cpublishers);
		for(int i=0;i<publishers.size();i++) {	
			CampaignPublisherMapping campaignPubMapping=new CampaignPublisherMapping();
			campaignPubMapping.setCampaignId(campId);
			campaignPubMapping.setPublisherId(publishers.get(i).getId());
			cpublishers.add(campaignPubMapping);
		}
		try {
			campaignDaoImpl.addPublisher(cpublishers);
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			System.err.println(ex);
		}
		for (int i = 0; i < campQuestion.size(); i++) {
			CampaignQuestion question = campQuestion.get(i);
			QuestionBank qb = new QuestionBank();
			qb.setQuestion(question.getQuestion());
			qb.setTag(question.getTag());
			qb.setId(question.getQuestionid());
			int questionid = campaignDaoImpl.saveCampaignQuestion(qb, question.getOrder(), campId);
			List<AnswerBank> answerList = campaignDaoImpl.getAnswers(question.getId());
			campaignDaoImpl.saveAnswerBank(answerList, questionid);
		}

	}

	public void deleteCampaign(Campaign campaign) {
		List<CampaignQuestion> campQuestion = campaignDaoImpl.getCampaignQuestion(campaign.getId());
		campaignDaoImpl.deleteCampaign(campaign.getId());
		for (int i = 0; i < campQuestion.size(); i++) {
			CampaignQuestion question = campQuestion.get(i);
			campaignDaoImpl.deleteQuestion(question.getId());
		}
	}

	public List<Integer> getCampaignQuestionId(int campaignId) {
		try {
			return campaignDaoImpl.getCampaignQuestionId(campaignId);
		} catch (Exception ex) {
			System.out.println(ex);
			System.err.println(ex);
			return null;
		}
	}
	
	public List<Integer> getCampaignQuestionsId(int campaignId) {
		try {
			return campaignDaoImpl.getCampaignQuestionsId(campaignId);
		} catch (Exception ex) {
			System.out.println(ex);
			System.err.println(ex);
			return null;
		}
	}

	public String updateQuestionOrder(List<CampaignQuestion> campaignQuestion) {
		try {
			int x=campaignDaoImpl.getCampaignQuestionId(campaignQuestion);
			if(x!=0) {
				return "Success";
			}
			else {
				return "Failed";
			}
			
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			System.err.println(ex);
			return null;
		}
	}

	public String updateStatus(String status, int campaignId) {
		try {
			int x=campaignDaoImpl.updateStatus(status,campaignId);
			if(x!=0) {
				return "Status Updated";
			}
			else {
				return "Status Updation Failed";
			}
			
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			System.err.println(ex);
			return null;
		}
	}

	public String addPublisher(List<CampaignPublisherMapping> publishers) {
		try {
			int x=campaignDaoImpl.addPublisher(publishers);
			if(x!=0) {
				return "Status Updated";
			}
			else {
				return "Status Updation Failed";
			}
			
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			System.err.println(ex);
			return null;
		}
	}
	public List<ExportReport> getExportReport(int campaignId){
		try {
			List<CampaignQuestion> qb=getCampaignQuestion(campaignId);
			campaignDaoImpl.getExportReport(qb,campaignId).size();
			return campaignDaoImpl.getExportReport(qb,campaignId);
			
		}
		catch(Exception ex) {
			System.out.println("Exception"+ex);
			return null;
		}
	}
	
	public int saveExportReport(int campaignId) {
		try {	
			List<CampaignQuestion> qb=getCampaignQuestion(campaignId);
			System.out.println("Saving Export Data");
		String header="SID, Status, Start Date, End Date, Start Time, End Time, Duration, Provider Name, Provider Id,Respondent Id";
		for(int i=0;i<qb.size();i++) {
			header=header+","+qb.get(i).getTag();
		}
		System.out.println("Headers/n"+header);
		//String fileName = "C://Users//hemud//Downloads//Microsoft.SkypeApp_kzf8qxf38zg5c!App"+"/"+"campaigndata_"+campaignId+".csv";
		String fileName = "/home/ubuntu/apache-tomcat-9.0.4/webapps/ExportCampaignData"+"/"+"campaigndata_"+campaignId+".csv";
		System.out.println("Path="+fileName);
		List<ExportReport> ExportData=getExportReport(campaignId);
		System.out.println(ExportData);
		System.out.println("Length"+ExportData.size());
		for(ExportReport exportReport : ExportData) {	
			String textInput = exportReport.getCampaignId() +"," +exportReport.getStatus() +"," + exportReport.getStartDate() + "," + exportReport.getEndDate() + "," +exportReport.getStartTime() + "," +exportReport.getEndTime()+ "," +exportReport.getDuration()+ "," +exportReport.getProviderName()+ "," +exportReport.getProviderId()+ "," +exportReport.getRespondentId();
			writeInFile(fileName, header, textInput);
		}
		if(ExportData.isEmpty()) {
			String data="NA,NA,NA,NA,NA,NA,NA,NA,NA,NA";
			for(int i=0;i<qb.size();i++) {
				data=data+",NA";
			}
		writeInFile(fileName, header,data);
		}
		return 1;
		}
		catch(Exception ex) {
			System.out.println("Error"+ex);
			return 0;
		}
	}
		public void writeInFile(String fileName, String header, String record) {
			try {
				File tmpDir = new File(fileName);
				Files.deleteIfExists(tmpDir.toPath());
				boolean exists = tmpDir.exists();
				FileWriter fw = new FileWriter(fileName, true);
				if (!exists)     	
				fw.append(header);
				fw.append("\n");
				fw.append(record);
				fw.close();

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
}