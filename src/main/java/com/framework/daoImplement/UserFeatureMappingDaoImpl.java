package com.framework.daoImplement;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import com.framework.dao.UserFeatureMappingDao;
import com.framework.model.Feature;
import com.framework.model.UserType;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class UserFeatureMappingDaoImpl implements UserFeatureMappingDao{
	
	@Autowired
	FeatureDaoImpl featureDaoImpl;
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public List<Integer> getFeaturesId(UserType userType) {
		try {
			return jdbcTemplate.query("select * from user_to_feature_mapping where usertype_id='"+userType.getId()+"'",
					new ResultSetExtractor<List<Integer>>() {

				@Override
				public List<Integer> extractData(ResultSet rs) throws SQLException, DataAccessException {
					List<Integer> featuresid=new ArrayList<Integer>();
					while(rs.next()) {
						featuresid.add(rs.getInt("feature_id"));
					}
					return featuresid;
				}			
	          }); 
			}
			catch(Exception e) {
				System.out.println(e);
				return null;
			}
	}

	@Override
	public List<Feature> getFeatureOfUserType(UserType userType) {
		try {
			return jdbcTemplate.query("select feature.id,feature.pid,feature.featurename,feature.link,feature.logo from user_to_feature_mapping RIGHT JOIN feature ON user_to_feature_mapping.feature_id=feature.id where user_to_feature_mapping.usertype_id="+userType.getId()+" AND feature.pid=0;",
					new ResultSetExtractor<List<Feature>>() {

				@Override
				public List<Feature> extractData(ResultSet rs) throws SQLException, DataAccessException {
					List<Feature> features=new ArrayList<Feature>();
					while(rs.next()) {
						Feature feature=new Feature();
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
						
						features.add(feature);
					}
					return features;
				}			
	          }); 
			}
			catch(Exception e) {
				System.out.println(e);
				return null;
			}
	}
	
	public int mapuserIdtoFeature (int featureId,int userId) {
		System.out.println("Feature Id="+featureId);
		try {
		return jdbcTemplate.update("INSERT INTO user_to_feature_mapping(feature_id,usertype_id,modifiedBy) VALUES(?,?,?)",featureId,userId,"Hemu");
		
		}
		catch(Exception ex) {
			System.err.println(ex);
			return 0;
		}
	}

}
