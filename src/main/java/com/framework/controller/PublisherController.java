package com.framework.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.framework.model.Publisher;
import com.framework.serviceimplement.PublisherServiceImpl;

@Controller
public class PublisherController {
	@Autowired
	PublisherServiceImpl PublisherServiceImpl;

	@RequestMapping(value = "PublisherManagement", method = RequestMethod.GET)
	public ModelAndView publisherManagement(HttpSession session) {
		List<Publisher> publishers = PublisherServiceImpl.getAllPublisher(Integer.parseInt(session.getAttribute("id").toString()));
		ModelAndView mv = new ModelAndView("publishermanagement");
		mv.addObject("usertype",session.getAttribute("usertype").toString());
		mv.addObject("publishers", publishers);
		return mv;
	}

	@RequestMapping(value = "CreatePublisher", method = RequestMethod.POST)
	public ModelAndView createPublisher(@ModelAttribute Publisher publisher, HttpSession session) {
		try {
			publisher.setClientId(Integer.parseInt(session.getAttribute("id").toString()));
			publisher.setModifiedBy(session.getAttribute("username").toString());
			PublisherServiceImpl.createPublisher(publisher);
			return new ModelAndView("redirect:/PublisherManagement");
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			return null;
		}
	}

	@RequestMapping(value = "UpdatePublisher", method = RequestMethod.POST)
	public ModelAndView updatePublisher(@ModelAttribute Publisher publisher, HttpSession session) {
		try {
			publisher.setClientId(Integer.parseInt(session.getAttribute("id").toString()));
			PublisherServiceImpl.updatePublisher(publisher);
			return new ModelAndView("redirect:/PublisherManagement");
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			return null;
		}

	}

	@RequestMapping(value ="DeletePublisher", method = RequestMethod.POST)
	public ModelAndView deletePublisher(@ModelAttribute Publisher publisher) {
		try {
			PublisherServiceImpl.deletePublisher(publisher);
			return new ModelAndView("redirect:/PublisherManagement");
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			return null;
		}

	}
}
