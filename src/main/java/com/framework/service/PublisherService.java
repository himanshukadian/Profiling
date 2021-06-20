package com.framework.service;

import java.util.List;

import com.framework.model.Publisher;

public interface PublisherService {
	public int createPublisher(Publisher publisher);
	public int updatePublisher(Publisher publisher);
	public List<Publisher> getAllPublisher(int clientId);
	public List<Publisher> getAllPublisher();
	public int deletePublisher(Publisher publisher);
}
