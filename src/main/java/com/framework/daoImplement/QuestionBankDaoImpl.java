package com.framework.daoImplement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

import com.framework.dao.QuestionBankDao;
import com.framework.model.AnswerBank;
import com.framework.model.QuestionBank;
import com.framework.serviceimplement.CampaignServiceImpl;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class QuestionBankDaoImpl implements QuestionBankDao {

	@Autowired
	private SessionFactory factory;

	@Autowired
	CampaignServiceImpl CampaignServiceImpl;

	@Autowired
	private JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public List<QuestionBank> getAllQuetion(int campaignId) {
		System.out.println("select * from questionbank");
		try {
			List<Integer> campaignQuestion = CampaignServiceImpl.getCampaignQuestionId(campaignId);
			return jdbcTemplate.query("select * from questionbank where userid!=1",
					new ResultSetExtractor<List<QuestionBank>>() {

						@Override
						public List<QuestionBank> extractData(ResultSet rs) throws SQLException, DataAccessException {
							List<QuestionBank> questionBankList = new ArrayList<QuestionBank>();
							while (rs.next()) {
								if (!campaignQuestion.contains(rs.getInt("id"))) {
									QuestionBank questionBank = new QuestionBank();
									questionBank.setId(rs.getInt("id"));
									questionBank.setQuestion(rs.getString("question"));
									questionBank.setUserId(rs.getInt("userid"));
									questionBank.setUsertype(rs.getString("usertype"));
									questionBank.setStatus(rs.getInt("status"));
									questionBank.setAnswerList(getAnswerOfQuestion(rs.getInt("id")));
									questionBankList.add(questionBank);
								}
							}
							return questionBankList;
						}
					});
		} catch (Exception e) {
			System.err.println(e);
			System.out.println("Exception geting QuestionBank");
			return null;
		}

	}

	@Override
	public List<AnswerBank> getAnswerOfQuestion(int questionid) {
		System.out.println("select * from answerbank where questionid=" + questionid);
		try {
			return jdbcTemplate.query("select * from answerbank where questionid=" + questionid,
					new ResultSetExtractor<List<AnswerBank>>() {

						@Override
						public List<AnswerBank> extractData(ResultSet rs) throws SQLException, DataAccessException {
							List<AnswerBank> answerBankList = new ArrayList<AnswerBank>();
							while (rs.next()) {
								AnswerBank answerBank = new AnswerBank();
								answerBank.setId(rs.getInt("id"));
								answerBank.setAnswer(rs.getString("answer"));
								answerBank.setQuestionId(rs.getInt("questionId"));
								answerBank.setStatus(rs.getInt("status"));
								answerBank.setQuota(rs.getInt("quota"));
								answerBankList.add(answerBank);
							}
							return answerBankList;
						}
					});
		} catch (Exception ex) {
			System.err.println(ex);
			System.out.println("Exception getting AnswerBank");
			return null;
		}
	}

	@Override
	public int saveQuestion(QuestionBank questionBank) {
		int userSessionId = 0;
		KeyHolder keyHolder = new GeneratedKeyHolder();
		try {
			int insertStatus = jdbcTemplate.update(new PreparedStatementCreator() {
				public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
					PreparedStatement preparedStatement = con.prepareStatement(
							"INSERT INTO questionbank(`question`,`usertype`,`userid`,`tag`,`modifiedBy`) VALUES(?,?,?,?,?)",
							new String[] { "id" });
					preparedStatement.setString(1, questionBank.getQuestion());
					preparedStatement.setString(2, questionBank.getUsertype());
					preparedStatement.setInt(3, questionBank.getUserId());
					preparedStatement.setString(4, questionBank.getTag());
					preparedStatement.setString(5, questionBank.getUsertype());
					return preparedStatement;
				}
			}, keyHolder);
			userSessionId = keyHolder.getKey().intValue();
			System.out.println("Returned userSessionId: " + userSessionId);
			System.out.println("Status userSessionId: " + insertStatus);
		} catch (DataAccessException e) {
			System.out.println(e);
		} catch (Exception e) {
			System.out.println(e);
		}
		return userSessionId;
	}

	@Override
	public int saveAnswerBank(List<AnswerBank> AnswerList, int questionId) {
		String query = "INSERT INTO answerbank(answer,quota,questionid,modifiedBy) VALUES(?,?,?,?)";

		jdbcTemplate.batchUpdate(query, new BatchPreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps, int i) throws SQLException {
				AnswerBank answerBank = AnswerList.get(i);
				ps.setString(1, answerBank.getAnswer());
				ps.setInt(2, answerBank.getQuota());
				ps.setInt(3, questionId);
				ps.setString(4, "Admin");
			}

			@Override
			public int getBatchSize() {
				return AnswerList.size();
			}
		});

		return 0;
	}

	public int deleteQuestion(int questionId) {
		jdbcTemplate.update("DELETE FROM answerbank WHERE questionid=" + questionId);
		return jdbcTemplate.update("DELETE FROM questionbank WHERE id=" + questionId);
	}

	public int updateQuestion(QuestionBank questionBank) {
		return jdbcTemplate.update("UPDATE questionbank set question='" + questionBank.getQuestion() + "',tag='"
				+ questionBank.getTag() + "' WHERE id=" + questionBank.getId());
	}

	public int updateAnswerBank(List<AnswerBank> answerList, int i) {
		jdbcTemplate.update("DELETE FROM answerbank WHERE questionid=" + i);
		return saveAnswerBank(answerList, i);
	}

	@Override
	public List<QuestionBank> getUserQuetion(int id) {
		System.out.println("select * from questionbank");
		try {
			return jdbcTemplate.query("select * from questionbank", new ResultSetExtractor<List<QuestionBank>>() {

				@Override
				public List<QuestionBank> extractData(ResultSet rs) throws SQLException, DataAccessException {
					List<QuestionBank> questionBankList = new ArrayList<QuestionBank>();
					while (rs.next()) {
						QuestionBank questionBank = new QuestionBank();
						questionBank.setId(rs.getInt("id"));
						questionBank.setQuestion(rs.getString("question"));
						questionBank.setUserId(rs.getInt("userid"));
						questionBank.setUsertype(rs.getString("usertype"));
						questionBank.setStatus(rs.getInt("status"));
						questionBank.setTag(rs.getString("tag"));
						questionBank.setAnswerList(getAnswerOfQuestion(rs.getInt("id")));
						questionBankList.add(questionBank);
					}
					return questionBankList;
				}
			});
		} catch (Exception e) {
			System.err.println(e);
			System.out.println("Exception getiing QuestionBank");
			return null;
		}

	}

	public QuestionBank getQuestion(int questionId) {
		try {
			return jdbcTemplate.query("select * from questionbank where id=" + questionId,
					new ResultSetExtractor<QuestionBank>() {

						@Override
						public QuestionBank extractData(ResultSet rs) throws SQLException, DataAccessException {
							QuestionBank questionBank = new QuestionBank();
							while (rs.next()) {
								questionBank.setId(rs.getInt("id"));
								questionBank.setQuestion(rs.getString("question"));
								questionBank.setUserId(rs.getInt("userid"));
								questionBank.setUsertype(rs.getString("usertype"));
								questionBank.setStatus(rs.getInt("status"));
								questionBank.setTag(rs.getString("tag"));
								questionBank.setAnswerList(getAnswerOfQuestion(rs.getInt("id")));
							}
							return questionBank;
						}
					});
		} catch (Exception e) {
			System.err.println(e);
			System.out.println("Exception getiing QuestionBank");
			return null;
		}
	}

	public List<QuestionBank> getStanderdQuetion(int campaignId) {
		try {
			List<Integer> campaignQuestion = CampaignServiceImpl.getCampaignQuestionsId(campaignId);
			System.out.println(campaignQuestion);
			return jdbcTemplate.query("select * from questionbank where userid=1",
					new ResultSetExtractor<List<QuestionBank>>() {

						@Override
						public List<QuestionBank> extractData(ResultSet rs) throws SQLException, DataAccessException {
							List<QuestionBank> questionBankList = new ArrayList<QuestionBank>();
							while (rs.next()) {
								QuestionBank questionBank = new QuestionBank();
								// System.out.println("aaaaaaaa"+!campaignQuestion.contains(rs.getInt("id")));
								if (!campaignQuestion.contains(rs.getInt("id"))) {
									questionBank.setId(rs.getInt("id"));
									questionBank.setQuestion(rs.getString("question"));
									questionBank.setUserId(rs.getInt("userid"));
									questionBank.setUsertype(rs.getString("usertype"));
									questionBank.setStatus(rs.getInt("status"));
									questionBank.setTag(rs.getString("tag"));
									questionBank.setAnswerList(getAnswerOfQuestion(rs.getInt("id")));
									questionBankList.add(questionBank);
								}
							}
							return questionBankList;
						}
					});
		} catch (Exception e) {
			System.err.println(e);
			System.out.println("Exception getiing QuestionBank");
			return null;
		}
	}

	public List<QuestionBank> getClientQuetion(int userId, int campaignId) {
		try {
			List<Integer> campaignQuestion = CampaignServiceImpl.getCampaignQuestionsId(campaignId);
			return jdbcTemplate.query("select * from questionbank where usertype='campaign' AND userid=" + campaignId,
					new ResultSetExtractor<List<QuestionBank>>() {

						@Override
						public List<QuestionBank> extractData(ResultSet rs) throws SQLException, DataAccessException {
							List<QuestionBank> questionBankList = new ArrayList<QuestionBank>();
							while (rs.next()) {
								QuestionBank questionBank = new QuestionBank();
								if (!campaignQuestion.contains(rs.getInt("id"))) {
									questionBank.setId(rs.getInt("id"));
									questionBank.setQuestion(rs.getString("question"));
									questionBank.setUserId(rs.getInt("userid"));
									questionBank.setUsertype(rs.getString("usertype"));
									questionBank.setStatus(rs.getInt("status"));
									questionBank.setTag(rs.getString("tag"));
									questionBank.setAnswerList(getAnswerOfQuestion(rs.getInt("id")));
									questionBankList.add(questionBank);
								}
							}
							return questionBankList;
						}
					});
		} catch (Exception e) {
			System.err.println(e);
			System.out.println("Exception getiing QuestionBank");
			return null;
		}
	}
}
