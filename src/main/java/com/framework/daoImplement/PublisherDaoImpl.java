package com.framework.daoImplement;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.framework.dao.PublisherDao;
import com.framework.model.Publisher;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class PublisherDaoImpl implements PublisherDao{
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public int createPublisher(Publisher publisher) {
		try {
			return jdbcTemplate.update("INSERT INTO publisher (name,publisherurl,clientid,modifiedBy) values(?,?,?,?)",publisher.getName(),publisher.getPublisherUrl(),publisher.getClientId(),publisher.getModifiedBy());	}
			catch(Exception ex){
				System.out.println(ex);
				System.out.println("Create Publisher failed !!");
				return 0;
			}
	}

	@Override
	public int updatePublisher(Publisher publisher) {
		try {
			return jdbcTemplate.update("UPDATE publisher SET name=?,publisherurl=?  where id=?",publisher.getName(),publisher.getPublisherUrl(),publisher.getId());	}
			catch(Exception ex){
				System.out.println(ex);
				System.out.println("Publisher Deletion faild !!");
				return 0;
			}
	}

	@Override
	public List<Publisher> getAllPublisher(int clientId) {
		try {
			System.out.println("select * from publisher");
			return jdbcTemplate.query("select * from publisher",
					new ResultSetExtractor<List<Publisher>>() {

				@Override
				public List<Publisher> extractData(ResultSet rs) throws SQLException, DataAccessException {
					List<Publisher> publishers=new ArrayList<Publisher>();
					while(rs.next()) {
						Publisher publisher=new Publisher();
						publisher.setId(rs.getInt("id"));
						publisher.setClientId(rs.getInt("clientid"));
						publisher.setName(rs.getString("name"));
						publisher.setPublisherUrl(rs.getString("publisherurl"));
						publisher.setModifiedOn(rs.getString("modifiedOn"));
						publishers.add(publisher);
					}
					return publishers;
				}			
	          }); 
			}
			catch(Exception e) {
				System.out.println(e);
				return null;
			}
	}

	@Override
	public int deletePublisher(Publisher publisher) {
		try {
			return jdbcTemplate.update("Delete from publisher where id="+publisher.getId());	}
			catch(Exception ex){
				System.out.println(ex);
				System.out.println("Publisher Deletion failed !!");
				return 0;
			}
	}

	@Override
	public List<Publisher> getAllPublisher() {
		try {
			System.out.println("select * from publisher");
			return jdbcTemplate.query("select * from publisher",
					new ResultSetExtractor<List<Publisher>>() {

				@Override
				public List<Publisher> extractData(ResultSet rs) throws SQLException, DataAccessException {
					List<Publisher> publishers=new ArrayList<Publisher>();
					while(rs.next()) {
						Publisher publisher=new Publisher();
						publisher.setId(rs.getInt("id"));
						publisher.setClientId(rs.getInt("clientid"));
						publisher.setName(rs.getString("name"));
						publisher.setPublisherUrl(rs.getString("publisherurl"));
						publisher.setModifiedOn(rs.getString("modifiedOn"));
						publishers.add(publisher);
					}
					return publishers;
				}			
	          }); 
			}
			catch(Exception e) {
				System.out.println(e);
				return null;
			}
	}

	@Override
	public List<Publisher> getCampaignPublisher(int campaignId) {
		try {
			System.out.println("select * from publisher INNER JOIN campaign_publisher_mapping ON publisher.id=campaign_publisher_mapping.publisherid where campaign_publisher_mapping.campaignid="+campaignId);
			return jdbcTemplate.query("select * from publisher INNER JOIN campaign_publisher_mapping ON publisher.id=campaign_publisher_mapping.publisherid where campaign_publisher_mapping.campaignid="+campaignId,
					new ResultSetExtractor<List<Publisher>>() {

				@Override
				public List<Publisher> extractData(ResultSet rs) throws SQLException, DataAccessException {
					List<Publisher> publishers=new ArrayList<Publisher>();
					while(rs.next()) {
						Publisher publisher=new Publisher();
						publisher.setId(rs.getInt("id"));
						publisher.setClientId(rs.getInt("clientid"));
						publisher.setName(rs.getString("name"));
						publisher.setPublisherUrl(rs.getString("publisherurl"));
						publisher.setModifiedOn(rs.getString("modifiedOn"));
						publishers.add(publisher);
					}
					return publishers;
				}			
	          }); 
			}
			catch(Exception e) {
				System.out.println(e);
				return null;
			}
	}

}
