package com.niit.shoppingcart.controller;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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

	@RequestMapping("/admin/viewCategory")
	public ModelAndView viewCategory(Model model) {
		log.debug("method starting");
		System.out.println("Category added");
		ModelAndView mv = new ModelAndView("index");
		List<Category> catList = categoryDAO.list();
		Iterator it =catList.iterator();
		while (it.hasNext()){
			Category c=(Category) it.next();
			System.out.println("Item is "+ c.getCatname());
		}
		
		model.addAttribute("category list", catList);
		mv.addObject("isClickedAdminViewCategory", "true");
		mv.addObject("active", "adminCategory");
		mv.addObject("displayAdminAction", "true");
		return mv;
	}
	
	//displays add category form

	@RequestMapping("/admin/viewCategory/addCategory")
	public ModelAndView addCategory()
	{
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("category",category);
		mv.addObject("isAddCategoryClicked","true");
		mv.addObject("displayLogOut","true");
		mv.addObject("displayAdminAction","true");
		return mv;
	}
	
	//details entered by admin are posted to database

	@RequestMapping(value = "/admin/viewCategory/addCategory", method = RequestMethod.POST)
	public ModelAndView addCategory(@ModelAttribute("category") @Valid Category category, BindingResult result,
			Model model, HttpServletRequest request){
		ModelAndView mv = new ModelAndView("index");
		
		if (result.hasErrors()) {
			mv.addObject("isAddCategoryClicked", "true");
			mv.addObject("displayLogout", "true");
			mv.addObject("displayAdminAction", "true");
			return mv;
			}
			
			categoryDAO.saveOrUpdate(category);;
			List<Category> categoryList = categoryDAO.list();
			model.addAttribute("category", categoryList);

			// Get supplier name and supplier row
			int categorySize = categoryList.size();
			this.category = categoryList.get(categorySize - 1);
			String categoryName = this.category.getCatname();

			mv.addObject("categoryName", categoryName);
			mv.addObject("categorySize", categorySize);
			// ====================================================
			mv.addObject("addedCategoryMessage", "true");
			mv.addObject("isClickedAdminViewCategory", "true");
			mv.addObject("active", "adminCategory");
			mv.addObject("displayAdminAction", "true");

		
		return mv;
			
		
	}
	
	@RequestMapping("/admin/viewCategory/updateCategory/{catid}")
	public ModelAndView updateCategory(@PathVariable("catid") String catid){
		ModelAndView mv = new ModelAndView("index");
		category = categoryDAO.get(catid);
		mv.addObject("category",category);
		mv.addObject("isUpdateCategoryClicked", "true");
		mv.addObject("displayLogout","true");
		mv.addObject("displayAdminAction", "true");
		return mv;
		
	}
	
	@RequestMapping(value="/admin/viewCategory/update", method = RequestMethod.POST)
	public ModelAndView updateCategory(@ModelAttribute("category")@Valid Category category, BindingResult result, HttpServletRequest request, Model model){
		ModelAndView mv = new ModelAndView("index");
		
		if (result.hasErrors()){
			mv.addObject("isUpdateCategoryClicked", "true");
			mv.addObject("displayLogout", "true");
			mv.addObject("displayAdminAction", "true");
			return mv;
		}
		
		categoryDAO.saveOrUpdate(category);
		List<Category> categoryList = categoryDAO.list();
		
		String categoryName = category.getCatname();
		mv.addObject("updatedCatName", categoryName);
		mv.addObject("updatesCategoryMessage", "true");
		mv.addObject("isClickedAdminViewCategory","true");
		mv.addObject("displayLogout","true");
		mv.addObject("displayAdminAction","true");
		return mv;

}
}