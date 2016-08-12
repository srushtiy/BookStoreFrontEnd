/*package com.niit.shoppingcart.controller;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.niit.bookstore.dao.CartDAO;
import com.niit.bookstore.dao.CartDetailDAO;
import com.niit.bookstore.dao.ProductDAO;
import com.niit.bookstore.model.Cart;
import com.niit.bookstore.model.Product;

public class CartController {
	
	private Cart cart;
	private CartDAO cartDAO;
	
	private CartDetailDAO cartdetailDAO;

	private ProductDAO productDAO;

	@RequestMapping(value = "/myCart", method = RequestMethod.GET)
	public String myCart(Model model, HttpSession session) {
		model.addAttribute("cart", new Cart());
		String loggedInUserid = (String) session.getAttribute("loggedInUser");
		model.addAttribute("cartList", cartdetailDAO.getDetailbyUserId(loggedInUserid));
		model.addAttribute("totalAmount", cart.getTotal_price(loggedInUserid));
		model.addAttribute("displayCart", "true");
		return "/home";
	}

	@RequestMapping(value ="/myCart/add/id", method = RequestMethod.GET)
	public String addToCart(@PathVariable("id") String id, HttpSession session){
		
		Product product = productDAO.get(id);
		Cart cart = new Cart();
		cart.setTotal_price(product.getP_price());
		cart.setProduct_quantity(1);
		String loggedInUserID = (String) session.getAttribute("loggedInUserID");
		 
		cart.setUserid(loggedInUserID);
		cart.setStatus("N");
		
		cartDAO.saveOrUpdate(cart);
		return "redirect:/";	
	}

	@RequestMapping("myCart/delete/{id}")
	public String removeCart(@PathVariable("id") String id, ModelMap model) throws Exception
	{
	
	try {
		cartDAO.delete(id);
		model.addAttribute("message", "Succesfully removed");
	} catch (Exception e) {
		model.addAttribute("message",e.getMessage());
	}
	
	return "redirect:/home";
	}
	
	@RequestMapping("myCart/edit/{id}")
	public String editCart(@PathVariable("id") String id, Model model, HttpSession session)
	{
		System.out.println("editCart");
		model.addAttribute("cart", this.cartDAO.getbyuserid(id));
		String loggedInUserid = (String) model.addAttribute("loggedInUserid");
		model.addAttribute("listCarts",this.cartDAO.getbyuserid(loggedInUserid));
		return "cart";
	}
	}*/