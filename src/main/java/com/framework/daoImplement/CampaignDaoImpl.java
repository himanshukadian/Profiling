package com.framework.daoImplement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import com.framework.dao.CampaignDao;
import com.framework.model.AnswerBank;
import com.framework.model.Campaign;
import com.framework.model.CampaignAnswer;
import com.framework.model.CampaignPublisherMapping;
import com.framework.model.CampaignQuestion;
import com.framework.model.ExportReport;
import com.framework.model.QuestionBank;
import com.framework.model.QuestionChart;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class CampaignDaoImpl implements CampaignDao{
	@Autowired
	private JdbcTemplate jdbcTemplate;
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public List<Campaign> getAllCampaign(int creator) {
		System.out.println("select * from campaign_management");
		try {
			return jdbcTemplate.query("select * from campaign_management",
					new ResultSetExtractor<List<Campaign>>() {

				@Override
				public List<Campaign> extractData(ResultSet rs) throws SQLException, DataAccessException {
					List<Campaign> campaignList=new ArrayList<Campaign>();
					while(rs.next()) {
						Campaign campaign=new Campaign();
						campaign.setId(rs.getInt("campaignId"));
						campaign.setCreator(rs.getInt("creator"));
						campaign.setDescription(rs.getString("description"));
						campaign.setStatus(rs.getString("status"));
						campaign.setQuestions(rs.getInt("noOfQuestions"));
						campaign.setQuota(rs.getInt("quota"));
						campaign.setCallbackLink(rs.getString("callbacklink"));
						campaign.setClientLink(rs.getString("clientlink"));
						campaignList.add(campaign);
					}
					return campaignList;
				}			
			});}
		catch(Exception ex) {
			System.err.println(ex);
			System.out.println("Exception getting Campaign");
			return null;
		}
	}
	
	public List<Campaign> getAllCampaign() {
		System.out.println("select * from campaign_management");
		try {
			return jdbcTemplate.query("select * from campaign_management",
					new ResultSetExtractor<List<Campaign>>() {

				@Override
				public List<Campaign> extractData(ResultSet rs) throws SQLException, DataAccessException {
					List<Campaign> campaignList=new ArrayList<Campaign>();
					while(rs.next()) {
						Campaign campaign=new Campaign();
						campaign.setId(rs.getInt("campaignId"));
						campaign.setCreator(rs.getInt("creator"));
						campaign.setDescription(rs.getString("description"));
						campaign.setStatus(rs.getString("status"));
						campaign.setQuestions(rs.getInt("noOfQuestions"));
						campaign.setQuota(rs.getInt("quota"));
						campaign.setCallbackLink(rs.getString("callbacklink"));
						campaign.setClientLink(rs.getString("clientlink"));
						campaignList.add(campaign);
					}
					return campaignList;
				}			
			});}
		catch(Exception ex) {
			System.err.println(ex);
			System.out.println("Exception getting Campaign");
			return null;
		}
	}

	public int createCampaign(Campaign campaign) {
		int userSessionId=0;
		KeyHolder keyHolder = new GeneratedKeyHolder();
      try {
		int insertStatus = jdbcTemplate.update(new PreparedStatementCreator() {
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement preparedStatement = con.prepareStatement("INSERT INTO campaign_management(creator,description,noOfQuestions,clientlink,callbacklink,modifiedBy,quota) values(?,?,?,?,?,?,?)", new String[] {"id"});
				preparedStatement.setInt(1,campaign.getCreator());
				preparedStatement.setString(2, campaign.getDescription());
				preparedStatement.setInt(3, campaign.getQuestions());
				preparedStatement.setString(4, campaign.getClientLink());
				preparedStatement.setString(5, campaign.getCallbackLink());
				preparedStatement.setString(6, campaign.getModifiedBy());
				preparedStatement.setInt(7, campaign.getQuota());
				return preparedStatement;
			}
		}, keyHolder);
		userSessionId = keyHolder.getKey( ).intValue();
		System.out.println("Returned userSessionId: " + userSessionId);	
		System.out.println("Status userSessionId: " + insertStatus);	
	}catch (DataAccessException e) {
		System.out.println(e);
	}catch (Exception e) {
		System.out.println(e);
	}
	return userSessionId;
	}

	public int updateCampaign(Campaign campaign) {
		try {
			System.out.println("Executing UPDATE query...");
			return jdbcTemplate.update("UPDATE campaign_management SET description=?,callbacklink=?,clientlink=?,status=?,modifiedBy=?,quota=? where campaignId=?",campaign.getDescription(),campaign.getCallbackLink(),campaign.getClientLink(),campaign.getStatus(),campaign.getModifiedBy(),campaign.getQuota(),campaign.getId());
		}
		catch(Exception ex){
			System.out.println(ex);
			System.err.println(ex);
			return -1;
		}
	}

	public int addQuestion(QuestionBank questionBank) {
		return 0;
	}

	@Override
	public int saveCampaignQuestion(QuestionBank questionBank, int order,int campaignId) {
		int userSessionId=0;
		KeyHolder keyHolder = new GeneratedKeyHolder();
		try {
			int insertStatus = jdbcTemplate.update(new PreparedStatementCreator() {
				public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
					PreparedStatement preparedStatement = con.prepareStatement("INSERT INTO campaignquestionbank(`question`,`questionOrder`,`campaignId`,`modifiedBy`,`questionId`,`tag`) VALUES(?,?,?,?,?,?)", new String[] {"id"});
					preparedStatement.setString(1,questionBank.getQuestion());
					preparedStatement.setInt(2, order);
					preparedStatement.setInt(3, campaignId);
					preparedStatement.setString(4, "Admin");
					preparedStatement.setInt(5, questionBank.getId());
					preparedStatement.setString(6, questionBank.getTag());
					return preparedStatement;
				}
			}, keyHolder);
			userSessionId = keyHolder.getKey( ).intValue();
			System.out.println("Returned userSessionId: " + userSessionId);	
			System.out.println("Status userSessionId: " + insertStatus);	
		}catch (DataAccessException e) {
			System.out.println(e);
		}catch (Exception e) {
			System.out.println(e);
		}
		return userSessionId;
	}

	public int saveAnswerBank(List<AnswerBank> list, int questionId) {
		String query = "INSERT INTO campaignanswerbank(answer,quota,questionid,modifiedBy) VALUES(?,?,?,?)";

		jdbcTemplate.batchUpdate(query, new BatchPreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps, int i) throws SQLException {
				AnswerBank answerBank = list.get(i);
				ps.setString(1, answerBank.getAnswer());
				ps.setInt(2, answerBank.getQuota());
				ps.setInt(3, questionId);
				ps.setString(4,"Admin");
			}

			@Override
			public int getBatchSize() {
				return list.size();
			}
		});

		return 1;
	}

	@Override
	public Campaign getCampaign(int campaignId) {
		try {
			System.out.println("select * from campaign_management where campaignId=\"+campaignId");
			return jdbcTemplate.query("select * from campaign_management where campaignId="+campaignId,
					new ResultSetExtractor<Campaign>() {

				@Override
				public Campaign extractData(ResultSet rs) throws SQLException, DataAccessException {
					Campaign campaign=new Campaign();
					while(rs.next()) {
						campaign.setId(rs.getInt("campaignId"));
						campaign.setCreator(rs.getInt("creator"));
						campaign.setDescription(rs.getString("description"));
						campaign.setStatus(rs.getString("status"));
						campaign.setQuestions(rs.getInt("noOfQuestions"));
						campaign.setQuota(rs.getInt("quota"));
						campaign.setCallbackLink(rs.getString("callbacklink"));
						campaign.setClientLink(rs.getString("clientlink"));
					}
					return campaign;
				}			
			});}
		catch(Exception ex) {
			System.err.println(ex);
			System.out.println("Exception getting Campaign");
			return null;
		}
	}

	@Override
	public List<CampaignQuestion> getCampaignQuestion(int campaignId) {
		try {
			return jdbcTemplate.query("select * from campaignquestionbank where campaignId="+campaignId,
					new ResultSetExtractor<List<CampaignQuestion>>() {

				@Override
				public List<CampaignQuestion> extractData(ResultSet rs) throws SQLException, DataAccessException {
					List<CampaignQuestion> questionBankList=new ArrayList<CampaignQuestion>();
					while(rs.next()) {
						CampaignQuestion questionBank=new CampaignQuestion();
						questionBank.setCampaignId(rs.getInt("campaignId"));
						questionBank.setOrder(rs.getInt("questionOrder"));
						questionBank.setQuestion(rs.getString("question"));
						questionBank.setId(rs.getInt("id"));
						questionBank.setQuestionid(rs.getInt("questionId"));
						questionBank.setTag(rs.getString("tag"));
						questionBankList.add(questionBank);
					}
					return questionBankList;
				}			
			}); 
		}
		catch(Exception e) {
			System.err.println(e);
			System.out.println("Exception getiing Campaign Question");
			return null;
		}
	}

	@Override
	public List<CampaignAnswer> getQuestionAnswers(int questionId) {
		// TODO Auto-generated method stub
		return null;
	}
	public int updateNumberofQuestions(int campaignId,int noOfQuestion) {
		try {
		return jdbcTemplate.update("UPDATE campaign_management SET noOfQuestions=noOfQuestions+? where campaignId=?",noOfQuestion,campaignId);
		}
		catch(Exception ex) {
			System.out.println(ex);
			System.err.println(ex);
			return -1;
		}
		
	}

	public CampaignQuestion getQuestion(int questionId) {
		try {
			return jdbcTemplate.query("select * from campaignquestionbank where id="+questionId,
					new ResultSetExtractor<CampaignQuestion>() {

				@Override
				public CampaignQuestion extractData(ResultSet rs) throws SQLException, DataAccessException {
					CampaignQuestion questionBank=new CampaignQuestion();
					while(rs.next()) {
						questionBank.setId(rs.getInt("id"));
						questionBank.setQuestion(rs.getString("question"));
						questionBank.setStatus(rs.getInt("status"));
						questionBank.setOrder(rs.getInt("questionOrder"));
						questionBank.setCampaignId(rs.getInt("campaignId"));
					}
					return questionBank;
				}			
	          }); 
			}
			catch(Exception e) {
				System.err.println(e);
				System.out.println("Exception getiing QuestionBank");
				return null;
			}
	}

	public List<AnswerBank> getAnswers(int questionId) {
		System.out.println("select * from campaignanswerbank where questionid="+questionId);
		try {
		return jdbcTemplate.query("select * from campaignanswerbank where questionid="+questionId,
				new ResultSetExtractor<List<AnswerBank>>() {

			@Override
			public List<AnswerBank> extractData(ResultSet rs) throws SQLException, DataAccessException {
				List<AnswerBank> answerBankList=new ArrayList<AnswerBank>();
				while(rs.next()) {
					AnswerBank answerBank=new AnswerBank();
					answerBank.setId(rs.getInt("id"));
					answerBank.setAnswer(rs.getString("answer"));
					answerBank.setQuestionId(rs.getInt("questionId"));
					answerBank.setStatus(rs.getInt("status"));
					answerBank.setQuota(rs.getInt("quota"));
					answerBankList.add(answerBank);
				}
				return answerBankList;
			}			
          });}
		catch(Exception ex) {
			System.err.println(ex);
			System.out.println("Exception getting AnswerBank");
			return null;
		}
	}

	public int updateQuestion(CampaignQuestion questionBank) {
		return jdbcTemplate.update("UPDATE campaignquestionbank set question='"+questionBank.getQuestion()+"' WHERE id="+questionBank.getId());
	}

	public int updateAnswerBank(List<AnswerBank> list, int id) {
		jdbcTemplate.update("DELETE FROM campaignanswerbank WHERE questionid="+id);
		return saveAnswerBank(list, id);
	}

	public int deleteQuestion(int questionId) {
		System.out.println("deletion about to start");
		jdbcTemplate.update("DELETE FROM campaignanswerbank WHERE questionid="+questionId);
		CampaignQuestion campaignQuestion=getQuestion(questionId);
		//System.out.println("Campaign List:"+);
		udateQuestionOrder(campaignQuestion.getOrder(),campaignQuestion.getCampaignId());
		return jdbcTemplate.update("DELETE FROM campaignquestionbank WHERE id="+questionId);
	}

	private void udateQuestionOrder(int order,int campaignId) {
		System.out.println("Updating order");
		List<CampaignQuestion> campaigns=getCampaignQuestionQrder(campaignId,order);
		System.out.println("Campaign List Size="+campaigns);
		for(int i=0;i<campaigns.size();i++) {
			System.out.println("UPDATE campaignquestionbank SET questionOrder=questionOrder-1 WHERE id="+campaigns.get(i).getId());
			jdbcTemplate.update("UPDATE campaignquestionbank SET questionOrder=questionOrder-1 WHERE id="+campaigns.get(i).getId());
		}
	}
	public List<CampaignQuestion> getCampaignQuestionQrder(int campaignId,int order) {
		try {
			System.out.println("select * from campaignquestionbank where questionOrder>"+order+" AND campaignId="+campaignId);
			return jdbcTemplate.query("select * from campaignquestionbank where questionOrder>"+order+" AND campaignId="+campaignId,
					new ResultSetExtractor<List<CampaignQuestion>>() {

				@Override
				public List<CampaignQuestion> extractData(ResultSet rs) throws SQLException, DataAccessException {
					List<CampaignQuestion> questionBankList=new ArrayList<CampaignQuestion>();
					while(rs.next()) {
						CampaignQuestion questionBank=new CampaignQuestion();
						questionBank.setCampaignId(rs.getInt("campaignId"));
						questionBank.setOrder(rs.getInt("questionOrder"));
						questionBank.setQuestion(rs.getString("question"));
						questionBank.setId(rs.getInt("id"));
						questionBankList.add(questionBank);
					}
					return questionBankList;
				}			
			}); 
		}
		catch(Exception e) {
			System.err.println(e);
			System.out.println("Exception getiing Campaign Question");
			return null;
		}
	}

	public void deleteCampaign(int id) {
		jdbcTemplate.update("DELETE FROM campaign_management WHERE campaignId="+id);		
	}

	public List<Integer> getCampaignQuestionId(int campaignId) {
		try {
			return jdbcTemplate.query("select * from campaignquestionbank where campaignId="+campaignId,
					new ResultSetExtractor<List<Integer>>() {

				@Override
				public List<Integer> extractData(ResultSet rs) throws SQLException, DataAccessException {
					List<Integer> questionBankList=new ArrayList<Integer>();
					while(rs.next()) {
						Integer i =rs.getInt("id");
						questionBankList.add(i);
					}
					return questionBankList;
				}			
			}); 
		}
		catch(Exception e) {
			System.err.println(e);
			System.out.println("Exception getiing Campaign Question");
			return null;
		}
	}
	public List<Integer> getCampaignQuestionsId(int campaignId) {
		try {
			return jdbcTemplate.query("select * from campaignquestionbank where campaignId="+campaignId,
					new ResultSetExtractor<List<Integer>>() {

				@Override
				public List<Integer> extractData(ResultSet rs) throws SQLException, DataAccessException {
					List<Integer> questionBankList=new ArrayList<Integer>();
					while(rs.next()) {
						Integer i =rs.getInt("questionId");
						questionBankList.add(i);
					}
					return questionBankList;
				}			
			}); 
		}
		catch(Exception e) {
			System.err.println(e);
			System.out.println("Exception getiing Campaign Question");
			return null;
		}
	}
	public int getCampaignQuestionId(List<CampaignQuestion> campaignQuestion) {
		String query = "UPDATE campaignquestionbank SET questionOrder=? where id=?";

		jdbcTemplate.batchUpdate(query, new BatchPreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps, int i) throws SQLException {
				CampaignQuestion question = campaignQuestion.get(i);
				System.out.println(question.getOrder());
				ps.setInt(1, question.getOrder());
				ps.setInt(2, question.getId());
			}

			@Override
			public int getBatchSize() {
				return campaignQuestion.size();
			}
		});

		return 1;
	}

	public int updateStatus(String status, int campaignId) {
		String query="CREATE TABLE campaigndata_"+campaignId+"(id int NOT NULL PRIMARY KEY AUTO_INCREMENT,survey_id bigint,status_from_client varchar(125),start_date DATETIME,end_date DATETIME,provider_name varchar(125),provider_id varchar(125),respondent_id varchar(125)";
		if(status.equals("LIVE")) {
			List<CampaignQuestion> campaignQuestions=getCampaignQuestion(campaignId);
			for(int i=0;i<campaignQuestions.size();i++) {
				query=query+","+campaignQuestions.get(i).getTag()+" varchar(125)";
			}
			query=query+")";
			System.out.println(query);
			jdbcTemplate.update(query);
		}
		return jdbcTemplate.update("UPDATE campaign_management SET status='"+status+"' WHERE campaignId="+campaignId);
	}

	public int addPublisher(List<CampaignPublisherMapping> publishers) {
		String query = "INSERT INTO campaign_publisher_mapping(`publisherid`,`campaignid`) values(?,?)";

		jdbcTemplate.batchUpdate(query, new BatchPreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps, int i) throws SQLException {
				CampaignPublisherMapping publisher = publishers.get(i);
				ps.setInt(1, publisher.getPublisherId());
				ps.setInt(2, publisher.getCampaignId());
			}

			@Override
			public int getBatchSize() {
				return publishers.size();
			}
		});

		return 1;
	}

	public List<Campaign> getLiveCampaign() {
		try {
			return jdbcTemplate.query("select * from campaign_management where status='LIVE'",
					new ResultSetExtractor<List<Campaign>>() {

				@Override
				public List<Campaign> extractData(ResultSet rs) throws SQLException, DataAccessException {
					List<Campaign> campaignList=new ArrayList<Campaign>();
					while(rs.next()) {
						Campaign campaign=new Campaign();
						campaign.setId(rs.getInt("campaignId"));
						campaign.setCreator(rs.getInt("creator"));
						campaign.setDescription(rs.getString("description"));
						campaign.setStatus(rs.getString("status"));
						campaign.setQuestions(rs.getInt("noOfQuestions"));
						campaign.setQuota(rs.getInt("quota"));
						campaign.setCallbackLink(rs.getString("callbacklink"));
						campaign.setClientLink(rs.getString("clientlink"));
						campaignList.add(campaign);
					}
					return campaignList;
				}			
			});}
		catch(Exception ex) {
			System.err.println(ex);
			System.out.println("Exception getting Campaign");
			return null;
		}
	}

	public Integer getClient() {
		try {
			return jdbcTemplate.query("select COUNT(campaignId) as clientCount from campaign_management where clientlink!=''",
					new ResultSetExtractor<Integer>() {

				@Override
				public Integer extractData(ResultSet rs) throws SQLException, DataAccessException {
					Integer clientCount=0;
					while(rs.next()) {
						clientCount=rs.getInt("clientCount");
					}
					return clientCount;
				}			
			}); 
		}
		catch(Exception e) {
			System.err.println(e);
			System.out.println("Exception getiing Live Campaign");
			return 0;
		}
	}

	public List<List<Integer>> getCampaignChartSeries(int campaignId) {
		try {
			return jdbcTemplate.query("select SUM(hits_details.toClient+hits_details.rejectedBySystem) AS PHits,SUM(hits_details.toClient) AS CHits,SUM(hits_details.rejectedBySystem) AS rejectedSystem,SUM(hits_details.rejectedByClient) AS rejectedClient,campaign_management.quota AS Quota from campaign_management INNER JOIN hits_details ON hits_details.campaignId=campaign_management.campaignId WHERE hits_details.campaignId="+campaignId,
					new ResultSetExtractor<List<List<Integer>>>() {

				@Override
				public List<List<Integer>> extractData(ResultSet rs) throws SQLException, DataAccessException {
					List<List<Integer>> campaignDashboard=new ArrayList<List<Integer>>();
					while(rs.next()) {
						campaignDashboard.add(Arrays.asList(rs.getInt("PHits"),rs.getInt("CHits"),rs.getInt("rejectedSystem"),rs.getInt("rejectedClient"),rs.getInt("CHits")));
						campaignDashboard.add(Arrays.asList(rs.getInt("Quota"),rs.getInt("Quota"),0,0,rs.getInt("Quota")));
					}
					return campaignDashboard;
				}			
			});}
		catch(Exception ex) {
			System.err.println(ex);
			System.out.println("Exception getting Campaign");
			return null;
		}
	}

	public QuestionChart getCampaignQuestionChart(int campaignId) {
	   //TODO
		return null;
	}

	public List<ExportReport> getExportReport(List<CampaignQuestion> qb, int campaignId) {
		try {
			String query="select survey_id,status_from_client,start_date,end_date,(end_date-start_date) as duration,provider_name,provider_id,respondent_id";
			for(int i=0;i<qb.size();i++) {
				query=query+","+qb.get(i).getTag();
			}
			query=query+" from campaigndata_"+campaignId;
			System.out.println("Query:"+query);
			return jdbcTemplate.query(query,
					new ResultSetExtractor<List<ExportReport>>() {

				@Override
				public List<ExportReport> extractData(ResultSet rs) throws SQLException, DataAccessException {
					List<ExportReport> ExportReportList=new ArrayList<ExportReport>();
					while(rs.next()) {
						ExportReport exportReport=new ExportReport();
						exportReport.setCampaignId(rs.getInt("survey_id"));
						exportReport.setStatus(rs.getString("status_from_client"));
						exportReport.setStartDate(rs.getString("start_date").substring(0, 9));
						exportReport.setEndDate(rs.getString("end_date").substring(0, 9));
						exportReport.setStartTime(rs.getString("start_date").substring(11,18));
						exportReport.setEndTime(rs.getString("end_date").substring(11,18));
						exportReport.setDuration(rs.getString("duration"));
						exportReport.setProviderName(rs.getString("provider_name"));
						exportReport.setProviderId(rs.getString("provider_id"));
						exportReport.setRespondentId(rs.getString("respondent_id"));
						List<String> dynamicColumn=new ArrayList<String>();
						for(int i=0;i<qb.size();i++)
						{
							dynamicColumn.add(rs.getString(qb.get(i).getTag()));	
						}
						exportReport.setDynamicColumn(dynamicColumn);
					}
					return ExportReportList;
				}			
			});}
		catch(Exception ex) {
			System.err.println(ex);
			System.out.println("Exception getting Campaign");
			return null;
		}
	}
	
	
	

}
