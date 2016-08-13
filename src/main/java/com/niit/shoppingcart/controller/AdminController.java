package com.niit.shoppingcart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.niit.bookstore.dao.CategoryDAO;
import com.niit.bookstore.dao.ProductDAO;
import com.niit.bookstore.dao.SupplierDAO;
import com.niit.bookstore.model.Category;
import com.niit.bookstore.model.Product;
import com.niit.bookstore.model.Supplier;

@Controller
public class AdminController {
	
	@Autowired
	private Product product;

	@Autowired
	private Supplier supplier;

	@Autowired
	private Category category;
	
	@Autowired
	private SupplierDAO supplierDAO;
	
	@Autowired
	private CategoryDAO categoryDAO;
	
	
	@Autowired
	private ProductDAO productDAO;
	
	@RequestMapping("/admin")
	public ModelAndView admin(){
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("isAdmin", true);
		
		return mv;
	}
	
	@RequestMapping("/admin/manageCategories")
	public ModelAndView categories() {
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("category", category);
		mv.addObject("isAdminClickedCategories", "true");
		mv.addObject("categoryList", categoryDAO.list());
		return mv;
	}

	@RequestMapping("/admin/manageProducts")
	public ModelAndView suppliers() {
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("product", product);
		mv.addObject("isAdminClickedProducts", "true");
		mv.addObject("productList", productDAO.productlist());
		return mv;
	}

	@RequestMapping("/admin/manageSuppliers")
	public ModelAndView products() {
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("supplier", supplier);
		mv.addObject("isAdminClickedSuppliers", "true");
		mv.addObject("supplierList", supplierDAO.supplierlist());
		return mv;
	}
}