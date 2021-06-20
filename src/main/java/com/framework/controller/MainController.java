package com.framework.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.framework.model.Feature;
import com.framework.model.Pass;
import com.framework.model.Project;
import com.framework.model.User;
import com.framework.model.UserType;
import com.framework.serviceimplement.FeatureServiceImpl;
import com.framework.serviceimplement.ProjectServiceImpl;
import com.framework.serviceimplement.UserFeatureMappingServiceImpl;
import com.framework.serviceimplement.UserServiceImpl;
import com.framework.serviceimplement.UserTypeServiceImpl;

@Controller
public class MainController {
	
	@Autowired
	UserTypeServiceImpl userTypeService;
	@Autowired
	UserServiceImpl userServiceImpl;
	@Autowired
	ProjectServiceImpl projectServiceImpl;
	@Autowired
	FeatureServiceImpl featureServiceImpl;
	@Autowired
	UserFeatureMappingServiceImpl userFeatureMappingServiceImpl;
	List<UserType> usertype=null;
	Project project=null;
	// SHOWS LOGIN PAGE
	@RequestMapping(value={"/","Login"},method=RequestMethod.GET)
	public ModelAndView logIn(HttpSession session) {
		if(session.getAttribute("username")!=null) {
			return new ModelAndView("redirect:/Main");
		}
		ModelAndView mv= new ModelAndView("Login");
		try {
		usertype=userTypeService.getAllUserType();
	    project=projectServiceImpl.getProject();
		}
		catch(Exception e) {
			System.out.println(e);
		}
		mv.addObject("usertype",usertype);
		mv.addObject("ProjectName",project.getProjectName());
	    return mv;
	}
	
	//GET INTO MAIN PAGE
	@RequestMapping(value="Main",method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView main(@ModelAttribute User user,HttpSession session) {
		List<Feature> features=null;
		try {
			System.out.println("Getting Project name");
			project=projectServiceImpl.getProject();
			System.out.println(project);
			if(session.getAttribute("usertype")==null) {
		    String verifyUser=userServiceImpl.verifyUser(user);
		    System.out.println("status"+verifyUser);
		    if(verifyUser.equals("True")) {
		    	ModelAndView mv=new ModelAndView("index");
			features=userFeatureMappingServiceImpl.getFeaturesOfUserType(user.getUsertype());
			System.out.println("Getting Server User");
			System.out.println(user.getUsername());
			User serveruser=userServiceImpl.getUser(user.getUsername());
			System.out.println(serveruser.getUsername().isEmpty());
			session.setAttribute("usertype", serveruser.getUsertype());
			session.setAttribute("username",serveruser.getUsername());
			session.setAttribute("id",serveruser.getId());
			mv.addObject("ProjectName",project.getProjectName());
			mv.addObject("Features",features);
			return mv;
		    }
		    else {
		//    	List<UserType> usertype=null;
		    	usertype=userTypeService.getAllUserType();
		    	ModelAndView mv=new ModelAndView("Login");
		    	mv.addObject("msg",verifyUser);
		    	mv.addObject("usertype",usertype);
		    	mv.addObject("ProjectName",project.getProjectName());
		    	return mv;
		    }
			}
			else {
				ModelAndView mv=new ModelAndView("index");
				System.out.println("Session:"+session.getAttribute("usertype"));
				project=projectServiceImpl.getProject();
				features=userFeatureMappingServiceImpl.getFeaturesOfUserType(session.getAttribute("usertype").toString());
				mv.addObject("ProjectName",project.getProjectName());
				mv.addObject("Features",features);
				return mv;
			}
			}
			catch(Exception e) {
				System.out.println(e);
				System.err.println(e);
				ModelAndView mv=new ModelAndView("Login");
				mv.addObject("msg","Somthing went wrong please try again later");
				return mv;
			}
	}
	
	//Get Home Page
	@RequestMapping(value="Home")
	public ModelAndView home() {
		Project project=null;
		try {
			project=projectServiceImpl.getProject();
			}
			catch(Exception e) {
				System.out.println(e);
			}
		ModelAndView mv=new ModelAndView("home");
		mv.addObject("ProjectName",project.getProjectName());
		return mv;
	}
	//Logout
	@RequestMapping(value = "/Logout",method = RequestMethod.GET)
	public ModelAndView logout(HttpSession session){
		session.removeAttribute("username");
		session.removeAttribute("usertype");
		session.invalidate();
		usertype=userTypeService.getAllUserType();
		project=projectServiceImpl.getProject();
    	ModelAndView mv=new ModelAndView("Login");
    	mv.addObject("usertype",usertype);
    	mv.addObject("ProjectName",project.getProjectName());
    	mv.addObject("msg","YOU HAVE LOGOUT FROM THE SYSTEM!");
		return mv;
	}
	
	@RequestMapping(value = "/ChangePassword")
	public ModelAndView changeP(HttpSession session){
		ModelAndView mv = new ModelAndView("changepassword");
		return mv;
	}
	
	@RequestMapping(value = "/Change")
	public ModelAndView changePass(@ModelAttribute Pass pass ,HttpSession session){
		ModelAndView mv=new ModelAndView("changepassword");
		if (!pass.getNewpass().equals(pass.getRepass())) {
			mv.addObject("update", "Password does not match!");
		} else {
			mv.addObject("update", userServiceImpl.changepassword(pass,session.getAttribute("username").toString()));
		}
		return mv;
	}
	
	/*@RequestMapping(value = "/Change")
	public ModelAndView changePass(@ModelAttribute Pass pass ,HttpSession session){
		ModelAndView mv=new ModelAndView("changepassword");
		if (!pass.getNewpass().equals(pass.getRepass())) {
			mv.addObject("update", "Password does not match!");
			return mv;
		} else {
			mv.addObject("update", userServiceImpl.changepassword(pass,session.getAttribute("username").toString()));
			return new ModelAndView("redirect:/Logout");
		}
	}*/
}
