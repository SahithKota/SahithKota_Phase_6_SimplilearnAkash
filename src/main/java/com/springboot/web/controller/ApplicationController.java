package com.springboot.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.springboot.web.model.Product;
import com.springboot.web.model.User;
import com.springboot.web.service.ProductService;
import com.springboot.web.service.UserService;
import com.springboot.web.service.PurchaseService;

@Controller
public class ApplicationController {

	@Autowired
	UserService userService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	PurchaseService purchaseService;

	@RequestMapping("/welcome")
	public String Welcome(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_WELCOME");
		return "homepage";
	}
	
	@RequestMapping("/contact")
	public String Contact(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_CONTACT");
		return "homepage";
	}

	@RequestMapping("/register")
	public String registration(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_REGISTER");
		return "homepage";
	}

	@PostMapping("/save-user")
	public String registerUser(@ModelAttribute User user, BindingResult bindingResult, HttpServletRequest request) {
		userService.saveMyUser(user);
		request.setAttribute("mode", "MODE_LOGIN");
		return "homepage";
	}
	
	@PostMapping("/save-product")
	public String registerProduct(@ModelAttribute Product product, BindingResult bindingResult, HttpServletRequest request) {
		productService.saveMyProduct(product);
		request.setAttribute("mode", "MODE_LOGIN");
		return "homepage";
	}

	@GetMapping("/show-users")
	public String showAllUsers(HttpServletRequest request) {
		request.setAttribute("users", userService.showAllUsers());
		request.setAttribute("mode", "ALL_USERS");
		return "welcomepage";
	}
	
	@GetMapping("/buy-product")
	public String addTodo(@ModelAttribute User user,@RequestParam int id,@RequestParam String name,@RequestParam String comp,@RequestParam int price, HttpServletRequest request) {
		HttpSession httpSession = request.getSession();
		String username = (String)httpSession.getAttribute("mainuser");
		System.out.println("main user in purchase"+username);
		request.setAttribute("product", productService.editProduct(id));
		request.setAttribute("mode", "MODE_PURCHASE");
		String date =java.time.LocalDate.now().toString();
		purchaseService.addTodo(name,comp,username,date,price);
		return "homepage";
	}
	  @RequestMapping("/search-user") 
	  public String searchUser(@RequestParam String uname, HttpServletRequest request) { 
	  request.setAttribute("users", userService.showUser(uname));
	  request.setAttribute("mode", "ALL_USERS");
	  return "welcomepage"; 
	  }
	 

	@RequestMapping("/delete-user")
	public String deleteUser(@RequestParam int id, HttpServletRequest request) {
		userService.deleteMyUser(id);
		request.setAttribute("users", userService.showAllUsers());
		request.setAttribute("mode", "ALL_USERS");
		return "welcomepage";
	}
	
	@RequestMapping("/delete-product")
	public String deleteProduct(@RequestParam int id, HttpServletRequest request) {
		productService.deleteMyProduct(id);
		request.setAttribute("products", productService.showAllProducts());
		request.setAttribute("mode", "All_ITEMS");
		return "welcomepage";
	}
	
	@RequestMapping("/edit-user")
	public String editUser(@RequestParam int id,HttpServletRequest request) {
		request.setAttribute("user", userService.editUser(id));
		request.setAttribute("mode", "MODE_UPDATE");
		return "welcomepage";
	}
	
	@RequestMapping("/edit-product")
	public String editProduct(@RequestParam int id,HttpServletRequest request) {
		request.setAttribute("product", productService.editProduct(id));
		request.setAttribute("mode", "PRODUCT_UPDATE");
		return "welcomepage";
	}
	
	@RequestMapping("/login")
	public String login(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_LOGIN");
		return "homepage";
	}
	
	@RequestMapping("/adminlogin")
	public String adminlogin(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_ADMINLOGIN");
		return "homepage";
	}
	@RequestMapping ("/login-admin")
	public String loginAdmin(@RequestParam String adname,@RequestParam String adpass, HttpServletRequest request) {
		HttpSession httpSession = request.getSession();
		String adminpass = (String)httpSession.getAttribute("adminpass");
		String orgpass="Pa123$";
		request.setAttribute("mode", "MODE_ADMINLOGIN");
		if(adminpass!=null && adminpass!="null")
		{
			orgpass=adminpass;
		}
		else
		{
			orgpass="Pa123$";
		}
		if(adname.equals("sahith") && adpass.equals(orgpass)) {
			request.setAttribute("mode", "MODE_ADMIN");
			return "welcomepage";
		}
		else {
			request.setAttribute("error", "Invalid Username or Password");
			request.setAttribute("mode", "MODE_ADMINLOGIN");
			return "homepage";
			
		}
	}
	
	@RequestMapping("/show-products")
	public String showProducts(HttpServletRequest request) {
		request.setAttribute("products", productService.showAllProducts());
		request.setAttribute("mode", "All_ITEMS");
		return "welcomepage";
	}
	
	@RequestMapping("/show-purchases")
	public String showPurchases(HttpServletRequest request) {
		request.setAttribute("purchases", purchaseService.showAllPurchases());
		request.setAttribute("mode", "All_PURCHASE");
		return "welcomepage";
	}
	
	@RequestMapping("/password-change")
	public String changePass(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_PASSWORD");
		return "welcomepage";
	}
	
	@RequestMapping ("/change-pass")
	public String adminPass(@RequestParam String adminpass, HttpServletRequest request) {
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("adminpass",adminpass);
		request.setAttribute("mode", "MODE_ADMINLOGIN");
		return "homepage";
	}
	
	@RequestMapping ("/login-user")
	public String loginUser(@ModelAttribute User user, HttpServletRequest request) {
		if(userService.findByUsernameAndPassword(user.getUsername(), user.getPassword())!=null) {
			System.out.println("**************************************************"+productService.showAllProducts());
			request.setAttribute("products", productService.showAllProducts());
			System.out.println("main user"+user.getUsername());
			HttpSession httpSession = request.getSession();
			request.setAttribute("mode", "MODE_HOME");
			httpSession.setAttribute("mainuser",user.getUsername());
			return "homepage";
		}
		else {
			request.setAttribute("error", "Invalid Username or Password");
			request.setAttribute("mode", "MODE_LOGIN");
			return "homepage";
			
		}
	}

}
