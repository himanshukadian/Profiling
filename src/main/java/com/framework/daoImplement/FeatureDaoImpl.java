package com.framework.daoImplement;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.framework.dao.FeatureDao;
import com.framework.dao.UserTypeDao;
import com.framework.model.Feature;
import com.framework.model.UserType;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class FeatureDaoImpl implements FeatureDao{
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	@Autowired
	UserFeatureMappingDaoImpl userFeatureMapping;
	@Autowired
	UserTypeDao userTypeDao;

	@Override
	public List<Feature> getAllFeatures() {
		// TODO Auto-generated method stub
		try {
			return jdbcTemplate.query("select * from feature where pid=0",
					new ResultSetExtractor<List<Feature>>() {

				@Override
				public List<Feature> extractData(ResultSet rs) throws SQLException, DataAccessException {
					List<Feature> list=new ArrayList<Feature>();
					while(rs.next()){
						Feature feature=new Feature();
						feature.setCreatedOn(rs.getString("createdOn"));
						feature.setModifiedOn(rs.getString("modifiedOn"));
						feature.setFeatureName(rs.getString("featurename"));
						feature.setLink(rs.getString("link"));
						feature.setLogo(rs.getString("logo"));
						feature.setId(rs.getInt("id"));
						feature.setPid(rs.getInt("pid"));
						List<Feature> sflist=new ArrayList<Feature>();
						sflist=jdbcTemplate.query("select * from feature where pid="+rs.getInt("id"),
								new ResultSetExtractor<List<Feature>>() {
							public List<Feature> extractData(ResultSet rs2) throws SQLException, DataAccessException {
								List<Feature> list2=new ArrayList<Feature>();
								while(rs2.next()){
									Feature subfeature=new Feature();
									subfeature.setFeatureName(rs.getString("featurename"));
									subfeature.setLink(rs.getString("link"));
									subfeature.setLogo(rs.getString("logo"));
									subfeature.setId(rs.getInt("id"));
									subfeature.setPid(rs.getInt("pid"));
									list2.add(subfeature);
								}
								return list2;
							}			
			  	          });
						feature.setSubfeature(sflist);
						list.add(feature);
					}
					return list;
				}			
          	});
        }
			catch(Exception e) {
				System.out.println(e);
				return null;
			}
	}

	@Override
	public String createFeature(Feature feature, String[] usertypes) {
		try{
			jdbcTemplate.update("INSERT INTO feature(featurename,link,logo,modifiedBy) VALUES(?,?,?,?)",feature.getFeatureName(),feature.getLink(),feature.getLogo(),"Hemu");
		int id= jdbcTemplate.query("select id from feature where featurename='"+feature.getFeatureName()+"'",
					new ResultSetExtractor<Integer>() {

				@Override
				public Integer extractData(ResultSet rs) throws SQLException, DataAccessException {
					Integer id=0;
					while(rs.next()) {
						id=rs.getInt("id");
					}
					return id;
				}			
	          });
		for(int i=0;i<usertypes.length;i++) {
			UserType usertype=userTypeDao.getUserType(usertypes[i]);
			userFeatureMapping.mapuserIdtoFeature(id, usertype.getId());
		}
		return "Feature Added Sucessfully!!";
		}
		catch(Exception ex){
			System.err.println(ex);
			return "Feature Adding failed!!";
		}
	}
	
	public int fwDeleteFeature(Feature feature) {
		try {
		return jdbcTemplate.update("Delete from feature where id="+feature.getId());	}
		catch(Exception ex){
			System.out.println(ex);
			System.out.println("Feature Deletion faild !!");
			return 0;
		}
	}

	@Override
	public int updateFeature(Feature feature) {
		try {
			return jdbcTemplate.update("Update feature set featurename=?,link=? where id=?",feature.getFeatureName(),feature.getLink(),feature.getId());
					}
			catch(Exception ex){
				System.out.println(ex);
				System.out.println("Feature Updation faild !!");
				return 0;
			}
	}
	
	
	
}
