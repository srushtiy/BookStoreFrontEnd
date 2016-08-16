package com.niit.shoppingcart.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.bookstore.dao.SupplierDAO;
import com.niit.bookstore.model.Supplier;

@Controller
public class SupplierController {

	@Autowired
	private Supplier supplier;

	@Autowired
	private SupplierDAO supplierDAO;

	@RequestMapping("/admin/viewSupplier")
	public ModelAndView viewSupplier(Model model) {
		ModelAndView mv = new ModelAndView("index");

		List<Supplier> supplierList = supplierDAO.supplierlist();

		model.addAttribute("supplier List", supplierList);
		mv.addObject("isClickedAdminViewSupplier", "true");
		mv.addObject("active", "adminSupplier");
		mv.addObject("displayAdminAction", "true");
		return mv;
	}

	// fetching Add Supplier form
	@RequestMapping("/admin/viewSupplier/addSupplier")
	public ModelAndView addSupplier() {
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("supplier", supplier);
		mv.addObject("isAddSupplierClicked", "true");
		mv.addObject("displayLogout", "true");
		mv.addObject("displayAdminAction", "true");
		return mv;
	}
	
	
	
	//shows supplier list

	@RequestMapping("/admin/viewSupplier/showSupplier")
	public ModelAndView showSupplier() {
		System.out.println("show supplier");
		ModelAndView mv = new ModelAndView("index");
		List<Supplier> supplierList = supplierDAO.supplierlist();
		mv.addObject("suppliers", supplierList);
		
		String supplierName = supplier.getSupname();
		mv.addObject("updatedSupName", supplierName);
		mv.addObject("updatesSupplierMessage", "true");
		mv.addObject("isClickedAdminViewSupplier","true");
		mv.addObject("displayLogout","true");
		mv.addObject("displayAdminAction","true");
		return mv;
	}

	

	// Posting to database after add supplier form is filled
	@RequestMapping(value = "/admin/viewSupplier", method = RequestMethod.POST)
	public ModelAndView addSupplier(@ModelAttribute("supplier") @Valid Supplier supplier, BindingResult result,
			Model model, HttpServletRequest request) {
	
		ModelAndView mv = new ModelAndView("index");

		if (result.hasErrors()) {
			mv.addObject("isAddSupplierClicked", "true");
			mv.addObject("displayLogout", "true");
			mv.addObject("displayAdminAction", "true");
			return mv;
		}
		/*
		 * MultipartFile supplier_image = supplier.getSupplierImg(); String
		 * rootDirectory =
		 * request.getSession().getServletContext().getRealPath("/"); if
		 * supplier_image != null && !supplier_image.isEmpty()){ try{
		 * if(!Files.exists(Paths.get(rootDirectory
		 * +"\\resources\\images\\""")){
		 * Files.createDirectories(Paths.get((rootDirectory +
		 * "\\resources\\images\\supplier\\")) } supplier_image.transferTo(new
		 * File(Paths.get(rootDirectory +
		 * "\\resources\\images\\" + supplier.getSupid() + ".png")
		 * .toString())); } catch (Exception e) { e.printStackTrace(); throw new
		 * RuntimeException("Supplier Image Saving Failed", e);
		 */
		supplierDAO.saveorUpdate(supplier);
		List<Supplier> supplierList = supplierDAO.supplierlist();
		model.addAttribute("suppliers", supplierList);

		// Get supplier name and supplier row
		int supplierSize = supplierList.size();
		this.supplier = supplierList.get(supplierSize - 1);
		String supplierName = this.supplier.getSupname();

		mv.addObject("supplierName", supplierName);
		mv.addObject("supplierSize", supplierSize);
		// ====================================================
		mv.addObject("addedSupplierMessage", "true");
		mv.addObject("isClickedAdminViewSupplier", "true");
		mv.addObject("active", "adminSupplier");
		mv.addObject("displayAdminAction", "true");
		return mv;
	}
	
	@RequestMapping("/admin/viewSupplier/updateSupplier/{supid}")
	public ModelAndView updateSupplier(@PathVariable("supid") String supid){
		ModelAndView mv = new ModelAndView("index");
		supplier = supplierDAO.get(supid);
		mv.addObject("supplier",supplier);
		mv.addObject("isUpdateSupplierClicked", "true");
		mv.addObject("displayLogout","true");
		mv.addObject("displayAdminAction", "true");
		return mv;
		
	}
	
	@RequestMapping(value="/admin/viewSupplier/updateSupplier", method = RequestMethod.POST)
	public ModelAndView updateSupplier(@ModelAttribute("supplier")@Valid Supplier supplier, BindingResult result, HttpServletRequest request, Model model){
		ModelAndView mv = new ModelAndView("index");
		
		if (result.hasErrors()){
			mv.addObject("isUpdateSupplierClicked", "true");
			mv.addObject("displayLogout", "true");
			mv.addObject("displayAdminAction", "true");
			return mv;
		}
		
		/* MultipartFile supplierImage = supplier.getSupimg();
		 * String rootDirectory = request.getSession().getServletContext().getRealPath("/");

		if (supplierImage != null && !supplierImage.isEmpty()) {
			try {
				if (!Files.exists(Paths.get(rootDirectory + "\\resources\\images\\supplier\\"))) {
					Files.createDirectories(Paths.get(rootDirectory + "\\resources\\images\\supplier\\"));
				}
				supplierImage.transferTo(new File(
						Paths.get(rootDirectory + "\\resources\\images\\supplier\\" + supplier.getSupplierId() + ".png")
								.toString()));

			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("Supplier Image updating failed", e);
			}

		}
	*/
		supplierDAO.saveorUpdate(supplier);
		List<Supplier> supplierList = supplierDAO.supplierlist();
		
		String supplierName = supplier.getSupname();
		mv.addObject("updatedSupName", supplierName);
		mv.addObject("updatesSupplierMessage", "true");
		mv.addObject("isClickedAdminViewSupplier","true");
		mv.addObject("displayLogout","true");
		mv.addObject("displayAdminAction","true");
		return mv;
	}
}
