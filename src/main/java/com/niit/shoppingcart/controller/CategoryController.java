package com.niit.shoppingcart.controller;

import java.util.List;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.bookstore.dao.CategoryDAO;
import com.niit.bookstore.model.Category;

@Controller
public class CategoryController {

	private static final Logger log = LoggerFactory.getLogger(CategoryController.class);
	@Autowired
	private Category category;
	@Autowired
	private CategoryDAO categoryDAO;

	@RequestMapping("/admin/viewCat")
	public ModelAndView adminSeeCategory(Model model) {
		log.debug("method starting");
		ModelAndView mv = new ModelAndView("index");
		List<Category> catList = categoryDAO.list();

		model.addAttribute("category", category);
		mv.addObject("active", "adminCategory");
		mv.addObject("showAdmin", "true");
		return mv;
	}

	@RequestMapping("/admin/viewCat/add")
	public ModelAndView adminAddCat()
	{
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("category",category);
		mv.addObject("isAddCat","true");
		mv.addObject("showSignOut","true");
		mv.addObject("showAdmin","true");
		return mv;
	}

	@RequestMapping(value = "/admin/viewCat", method = RequestMethod.POST)
	public ModelAndView addCat(@ModelAttribute("category") @Valid Category category){
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("category", category);
		mv.addObject("isViewCat", "true");
		mv.addObject("showSignOut","true");
		mv.addObject("showAdmin","true");
		
		return mv;
		
	}

}
