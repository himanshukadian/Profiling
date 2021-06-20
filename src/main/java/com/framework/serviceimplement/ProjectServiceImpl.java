package com.framework.serviceimplement;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.framework.daoImplement.ProjectDaoImpl;
import com.framework.model.Project;
import com.framework.service.ProjectService;

@Service
public class ProjectServiceImpl implements ProjectService{
	
	@Autowired
	ProjectDaoImpl projectDaoImpl;
	
	@Override
	public Project getProject() {
		return projectDaoImpl.getProject();
	}

}
