package com.niit.shoppingcart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.niit.bookstore.dao.CategoryDAO;
import com.niit.bookstore.dao.ProductDAO;
import com.niit.bookstore.dao.SupplierDAO;
import com.niit.bookstore.model.Category;
import com.niit.bookstore.model.Product;
import com.niit.bookstore.model.Supplier;

@Controller
public class ProductController {
	
	@Autowired(required = true)
	private ProductDAO productDAO;
	
	@Autowired(required = true)
	private CategoryDAO categoryDAO;
	
	@Autowired(required = true)
	private SupplierDAO supplierDAO;
	
	//private String path = "D:\\shoppingcart\\img"
	
	@RequestMapping(value ="/products", method = RequestMethod.GET)
	public String listProduct(Model model){
		model.addAttribute("product", new Product());
		model.addAttribute("supplier", new Supplier());
		model.addAttribute("category", new Category());
		model.addAttribute("productList", this.productDAO.productlist());
		model.addAttribute("catList", this.categoryDAO.list());
		model.addAttribute("supList", this.supplierDAO.supplierlist());
		
		return "product";
	}
	
	/*public String addProduct(@ModelAttribute("product") Product product){
		Category category = categoryDAO.get(product.getCatid());
		Supplier supplier = supplierDAO.get(product.getSupplier().getName());
	}*/
	
	/*product.setCategory(category);
	product.setSupplier(supplier);
	
	public String removeProduct(@ModelAttribute())*/
	

}