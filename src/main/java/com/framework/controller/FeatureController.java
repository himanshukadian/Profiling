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
public class FeatureController {

	@Autowired
	FeatureServiceImpl featureService;
	@Autowired
	UserTypeServiceImpl userTypeService;
	//READ
	@RequestMapping(value="fwfeaturemanagement",method=RequestMethod.GET)
	public ModelAndView getFeatureManagement() {
		List<Feature> features=featureService.getAllFeatures();
		List<UserType> usertype=userTypeService.getAllUserType();
		ModelAndView mv=new ModelAndView("fwfeaturemanagement");
		mv.addObject("Features", features);
		mv.addObject("usertype",usertype);
		return mv;
	}
	
	
	
	//CREATE
		@RequestMapping(value="fwaddfeature",method=RequestMethod.POST)
		public ModelAndView addFeature(@ModelAttribute Feature feature,@RequestParam String[] usertypes) {
			System.out.println("Inside  add Feature");
			String servermessage=featureService.createFeature(feature, usertypes);
			ModelAndView mv= new ModelAndView("redirect:/fwfeaturemanagement");
			System.out.println(servermessage);
			mv.addObject("servermessage",servermessage);
			return mv;
		}
		
		//Delete
		@RequestMapping(value="fwDeleteFeature",method=RequestMethod.POST)
		public ModelAndView deleteFeature(@ModelAttribute Feature feature) {
			System.out.println("Inside  Delete Feature");
			String servermessage=featureService.fwDeleteFeature(feature);
			ModelAndView mv= new ModelAndView("redirect:/fwfeaturemanagement");
			System.out.println(servermessage);
			mv.addObject("servermessage",servermessage);
			return mv;
		}
		
		//UPDATE
		@RequestMapping(value="fwUpdateFeature",method=RequestMethod.POST)
		public ModelAndView updateFeature(@ModelAttribute Feature feature) {
			System.out.println("Inside  Update Feature");
			String servermessage=featureService.updateFeature(feature);
			ModelAndView mv= new ModelAndView("redirect:/fwfeaturemanagement");
			System.out.println(servermessage);
			mv.addObject("servermessage",servermessage);
			return mv;
		}

}
