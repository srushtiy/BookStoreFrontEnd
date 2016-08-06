package com.niit.shoppingcart.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.bookstore.dao.CategoryDAO;
import com.niit.bookstore.dao.UserDAO;
import com.niit.bookstore.model.Category;
import com.niit.bookstore.model.User;

@Controller
public class HomeController {
	Logger log = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	User user1;

	@Autowired
	private CategoryDAO categoryDAO;

	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private Category category;
	
	// category list
	@RequestMapping("/")
	public ModelAndView onLoad(HttpSession session){
		log.debug("Starting of method onLoad");
		ModelAndView mv = new ModelAndView("/home");
		session.setAttribute("category", category);
		session.setAttribute("categoryList", categoryDAO.list());
		log.debug("Ending of the method onLoad");
		return mv;
		}
	
	@RequestMapping(value = "user/register", method = RequestMethod.POST)
	public ModelAndView registerUser(@ModelAttribute User userDetails) {
		userDAO.saveorUpdate(userDetails);
		ModelAndView mv  = new ModelAndView("/home");
		mv.addObject("successMessage", "You are successfully register");
		return mv;
	}
	
	@RequestMapping("/registerHere")
	public ModelAndView registerHere() {
		ModelAndView mv = new ModelAndView("/home");
		mv.addObject("userDetails", user1);
		mv.addObject("isUserClickedRegisterHere", "true");
		return mv;
	}
	
	@RequestMapping("/loginHere")
	public ModelAndView loginHere() {
		ModelAndView mv = new ModelAndView("/home");
		mv.addObject("user1", new User());
		mv.addObject("isUserClickedLoginHere", "true");
		return mv;
	}
	

}
