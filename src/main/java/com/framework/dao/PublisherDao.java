package com.framework.dao;

import java.util.List;

import com.framework.model.Publisher;

public interface PublisherDao {
	public int createPublisher(Publisher publisher);
	public int updatePublisher(Publisher publisher);
	public List<Publisher> getAllPublisher(int clientId);
	public int deletePublisher(Publisher publisher);
	public List<Publisher> getAllPublisher();
	public List<Publisher> getCampaignPublisher(int campaignId);
}
