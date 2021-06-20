package com.framework.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.framework.model.User;
import com.framework.model.UserType;
import com.framework.serviceimplement.UserServiceImpl;
import com.framework.serviceimplement.UserTypeServiceImpl;

/*################################################################################################################################################################################################ 
 *                                                                      #####################
 *                                                                      #  USER MANAGEMENT  #
 *                                                                      #####################
 * ###############################################################################################################################################################################################
 * */



@Controller
public class UserController {
	
	@Autowired
	UserServiceImpl userService;
	@Autowired
	UserTypeServiceImpl userTypeService;
	//READ
	@RequestMapping(value="fwusermanagement",method=RequestMethod.GET)
	public ModelAndView getUser() {
		
		List<User> users=userService.getAllUser();
		List<UserType> usertype=userTypeService.getCreateUserType();
		ModelAndView mv=new ModelAndView("fwusermanagement");
		mv.addObject("users", users);
		mv.addObject("usertype",usertype);
		return mv;
	}
	
	//CREATE
	@RequestMapping(value="fwadduser",method=RequestMethod.POST)
	//public ModelAndView addUser(@RequestParam("usertype") String usertype,@RequestParam("password") String password,@RequestParam("username") String username,@RequestParam("clientLink") String clientLink,@RequestParam("callBackLink") String callBackLink,@RequestParam("path") String path,@RequestParam("file") MultipartFile file,HttpSession session) {
	public ModelAndView addUser(@ModelAttribute User user,HttpSession session) {
		String servermessage=userService.addUser(user,session.getAttribute("username").toString());
		ModelAndView mv= new ModelAndView("redirect:/fwusermanagement");
		System.out.println(servermessage);
		mv.addObject("servermessage",servermessage);
		return mv;
	}
	
	//UPDATE
	@RequestMapping(value="fwupdateuser",method=RequestMethod.POST)
	public ModelAndView updateUser(@ModelAttribute User user,HttpSession session) {
		String servermessage=userService.updateUser(user,session.getAttribute("username").toString());
		ModelAndView mv= new ModelAndView("redirect:/fwusermanagement");
		System.out.println(servermessage);
		mv.addObject("servermessage",servermessage);
		return mv;
	}
	
	//DELETE
	@RequestMapping(value="fwdeleteuser",method=RequestMethod.POST)
	public ModelAndView deleteUser(@ModelAttribute User user,HttpSession session) {
		String servermessage=userService.deleteUser(user,session.getAttribute("username").toString());
		ModelAndView mv= new ModelAndView("redirect:/fwusermanagement");
		System.out.println(servermessage);
		mv.addObject("servermessage",servermessage);
		return mv;
	}
	public String uploadfile(String name,String path,MultipartFile file) {
		System.out.println("File Path::"+path);
		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();
				//System.out.println("EXtension:::="+path.substring(path.lastIndexOf(".")));
				// Creating the directory to store file
				String rootPath = System.getProperty("catalina.home");
				File dir = new File(rootPath + File.separator + "tmpFiles");
				if (!dir.exists())
					dir.mkdirs();
				// Create the file on server
				File serverFile = new File(dir.getAbsolutePath()
						+ File.separator + name+path.substring(path.lastIndexOf(".")));
				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();
				return name+path.substring(path.lastIndexOf("."));
			} catch (Exception e) {
				System.out.println(e);
				return "failed";
			}
		} else {
			return "empty";
		}
	}
}
