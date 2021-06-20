package com.framework.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.framework.model.Feature;
import com.framework.model.UserType;
import com.framework.serviceimplement.FeatureServiceImpl;
import com.framework.serviceimplement.UserTypeServiceImpl;

@Controller
public class UserTypeController {
	@Autowired
	FeatureServiceImpl featureService;
	@Autowired
	UserTypeServiceImpl userTypeService;
	@RequestMapping(value="fwusertypemanagement",method=RequestMethod.GET)
	public ModelAndView getFeatureManagement() {
		List<Feature> features=featureService.getAllFeatures();
		List<UserType> usertype=userTypeService.getAllUserType();
		ModelAndView mv=new ModelAndView("fwusertypemanagement");
		mv.addObject("Features", features);
		mv.addObject("usertype",usertype);
		return mv;
	}
	
	
	@RequestMapping(value="fwaddusertype",method=RequestMethod.POST)
	public ModelAndView addUserType(@ModelAttribute UserType usertype,@RequestParam(required=false,name="features") Integer[] features) {
		System.out.println("Inside  add User Type");
		//System.out.println("feature size()"+features.length);
		String servermessage=userTypeService.addUserType(usertype, features);
		ModelAndView mv= new ModelAndView("redirect:/fwusertypemanagement");
		System.out.println(servermessage);
	    mv.addObject("servermessage",servermessage);
		return mv;
	}
	@RequestMapping(value="fwDeleteUsertype",method=RequestMethod.POST)
	public ModelAndView deleteUserType(@ModelAttribute UserType usertype) {
		System.out.println("Inside  Delete UserType");
		String servermessage=userTypeService.deleteUsertype(usertype);
		ModelAndView mv= new ModelAndView("redirect:/fwusertypemanagement");
		System.out.println(servermessage);
	    mv.addObject("servermessage",servermessage);
		return mv;
	}
	@RequestMapping(value="fwUpdateUserType",method=RequestMethod.POST)
	public ModelAndView updateUserType(@ModelAttribute UserType usertype) {
		System.out.println("Inside  Update UserType");
		String servermessage=userTypeService.updateUserType(usertype);
		ModelAndView mv= new ModelAndView("redirect:/fwusertypemanagement");
		System.out.println(servermessage);
	    mv.addObject("servermessage",servermessage);
		return mv;
	}

}
