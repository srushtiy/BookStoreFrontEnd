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
public class PageController {

	private static final Logger log = LoggerFactory.getLogger(PageController.class);

	@Autowired
	private UserDAO userDAO;

	@Autowired
	private Category category;

	@Autowired
	private CategoryDAO categoryDAO;

	@Autowired
	private User user;

	/*
	 * @RequestMapping(value = { "/", "/index", "/home" }) curly bracket useful
	 * for multiple mappings 3 mappings - to one handler - all of the requests
	 * will b redirected here public ModelAndView index() {
	 * 
	 * ModelAndView mv = new ModelAndView("index");
	 * mv.addObject("ifUserClickedIndex", true); return mv; job of spring is to
	 * put this in between the prefix and suffix }
	 */

	@RequestMapping(value = { "/", "/index", "/home" })
	public ModelAndView onLoad(HttpSession session) {
		log.debug("Starting of method onLoad");
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("category", category);
		mv.addObject("categoryList", categoryDAO.list());
		mv.addObject("isHomeClicked", true);
		log.debug("Ending of method");

		return mv;
	}

	@RequestMapping(value = "/loginHere")
	public ModelAndView loginHere() {
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("user", user);
		mv.addObject("isUserClickedLoginHere", "true");
		return mv;
	}

	@RequestMapping(value = "user/register", method = RequestMethod.POST)
	public ModelAndView registerUser(@ModelAttribute User user) {
		userDAO.saveorUpdate(user);
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("displaySuccessRegistered", "true");
		mv.addObject("successMessage", "You have successfully registered");

		return mv;
	}

	@RequestMapping("/registerHere")
	public ModelAndView registerHere() {
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("user", user);
		mv.addObject("isUserClickedRegisterHere", "true");
		return mv;
	}

	@RequestMapping(value = "/about")
	public ModelAndView contact() {

		ModelAndView mv = new ModelAndView("index");
		mv.addObject("ifUserClickedAbout", true);
		mv.addObject("menu", "about");
		return mv; /*
					 * job of spring is to put this in between the prefix and
					 * suffix
					 */
	}
}
