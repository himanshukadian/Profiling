package com.framework.serviceimplement;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.framework.dao.PublisherDao;
import com.framework.model.Publisher;
import com.framework.service.PublisherService;

@Service
public class PublisherServiceImpl implements PublisherService{
	@Autowired
	PublisherDao questionBankDao;

	@Override
	public int createPublisher(Publisher publisher) {
		try {
			return questionBankDao.createPublisher(publisher);
		}
		catch(Exception ex){
			System.out.println(ex.getMessage());
			return 0;
		}
	}

	@Override
	public int updatePublisher(Publisher publisher) {
		try {
			return questionBankDao.updatePublisher(publisher);
		}
		catch(Exception ex){
			System.out.println(ex.getMessage());
			return 0;
		}
	}

	@Override
	public List<Publisher> getAllPublisher(int clientId) {
		try {
			return questionBankDao.getAllPublisher(clientId);
		}
		catch(Exception ex){
			System.out.println(ex.getMessage());
			return null;
		}
	}

	@Override
	public int deletePublisher(Publisher publisher) {
		try {
			return questionBankDao.deletePublisher(publisher);
		}
		catch(Exception ex){
			System.out.println(ex.getMessage());
			return 0;
		}
	}

	@Override
	public List<Publisher> getAllPublisher() {
		try {
			return questionBankDao.getAllPublisher();
		}
		catch(Exception ex){
			System.out.println(ex.getMessage());
			return null;
		}
	}

	public List<Publisher> getCampaignPublisher(int campaignId) {
		try {
			return questionBankDao.getCampaignPublisher(campaignId);
		}
		catch(Exception ex){
			System.out.println(ex.getMessage());
			return null;
		}
	}

}
