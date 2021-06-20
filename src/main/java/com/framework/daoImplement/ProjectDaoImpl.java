package com.framework.daoImplement;

import java.sql.ResultSet;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import com.framework.dao.ProjectDao;
import com.framework.model.Project;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class ProjectDaoImpl implements ProjectDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public Project getProject() {
		System.out.println("select * from project_management");
		try {
		return jdbcTemplate.query("select * from project_management",
				new ResultSetExtractor<Project>() {

			@Override
			public Project extractData(ResultSet rs) throws SQLException, DataAccessException {
				Project project=new Project();
				while(rs.next()) {
				project.setDataBaseUrl(rs.getString("database_url"));
				project.setLogoPath(rs.getString("logo_path"));
				project.setUsername(rs.getString("username"));
				project.setPassword(rs.getString("password"));
				project.setProjectName(rs.getString("project_name"));
				}
				return project;
			}			
          }); 
		}
		catch(Exception e) {
			System.out.println(e);
			return null;
		}
	}

}
