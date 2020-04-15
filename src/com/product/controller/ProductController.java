package com.product.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.product.model.Item;
import com.product.model.Order;
import com.product.model.Product;
import com.product.model.User;
import com.product.service.ProductService;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;
	
	@RequestMapping("/addproduct")
	public String addProduct() {
		return "addProduct";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/cart")
	public ModelAndView cart(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		List<Item> cart = (List<Item>) session.getAttribute("cart");
		modelAndView.addObject("cart", cart);
		modelAndView.setViewName("cartItems");
		return modelAndView;
	}
	
	@RequestMapping("/updateproductview")
	public ModelAndView updateProductView(@RequestParam("productId") int id) {
		ModelAndView modelAndView = new ModelAndView();
		Product product = productService.getProduct(id);
		modelAndView.addObject("product", product);
		modelAndView.setViewName("updateProduct");
		return modelAndView;
	}
	
	@RequestMapping(value = "/viewproducts")
	public ModelAndView viewProducts() {
		List<Product> productList = productService.viewProducts();
		ModelAndView modelAndView = new ModelAndView();

		if (productList.size()>0) {
			modelAndView.addObject("productList", productList);
			modelAndView.setViewName("viewProducts");
		} else {
			modelAndView.addObject("msg", "<span style='color:red'>There are no products available.</span>");
			modelAndView.setViewName("viewProducts");
		}
		return modelAndView;
	}
	
	@RequestMapping(value = "/saveproduct", method = RequestMethod.POST)
	public ModelAndView saveProduct(@ModelAttribute("registerform") Product product){
		Boolean success = productService.addProduct(product);
		ModelAndView modelAndView = new ModelAndView();

		if (success) {
			modelAndView.addObject("msg",
					"<span style='color:green'>Product Added Successfully </span>");
			modelAndView.setViewName("addProduct");
		} else {
			modelAndView.addObject("msg", "<span style='color:red'>Error occurred while adding the product! Please try Again</span>");
			modelAndView.setViewName("addProduct");
		}
		return modelAndView;
	}
	
	@RequestMapping(value = "/updateproduct", method = RequestMethod.POST)
	public ModelAndView updateProduct(@ModelAttribute("registerform") Product product) {
		Boolean success = productService.updateProduct(product);
		List<Product> productList = productService.viewProducts();
		ModelAndView modelAndView = new ModelAndView();

		if (success) {
			modelAndView.addObject("msg",
					"<span style='color:green'>Product Updated Successfully </span>");
			modelAndView.addObject("productList", productList);
			modelAndView.setViewName("viewProducts");
		} else {
			modelAndView.addObject("msg", "<span style='color:red'>Error occurred while adding the product! Please try Again</span>");
			modelAndView.setViewName("updateProduct");

		}
		return modelAndView;
	}
	
	@RequestMapping(value = "/deleteproduct")
	public ModelAndView deleteProduct(@RequestParam("productId") int id) {
		Boolean success = productService.deleteProduct(id);
		List<Product> productList = productService.viewProducts();
		ModelAndView modelAndView = new ModelAndView();
		if (success) {
			modelAndView.addObject("msg",
					"<span style='color:green'>Product Deleted Successfully </span>");
			modelAndView.addObject("productList", productList);
			modelAndView.setViewName("viewProducts");
		} else {
			modelAndView.addObject("msg", "<span style='color:red'>Error occurred while deleting the product! Please try Again</span>");
			modelAndView.setViewName("viewProducts");
		}
		return modelAndView;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/addcart")
	public ModelAndView addItems(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		List<Product> productList = productService.viewProducts();
		String id = request.getParameter("productId");
		String quantity = request.getParameter("quantity");
		Product product = productService.getProduct(Integer.parseInt(id));
		HttpSession session = request.getSession();
		Item item = null;
		if (session.getAttribute("cart") == null) {
			List<Item> cart = new ArrayList<Item>();
			item = new Item();
			item.setName(product.getName());
			item.setCategory(product.getCategory());
			item.setDescription(product.getDescription());
			item.setCost(product.getCost());
			item.setQuantity(Integer.parseInt(quantity));
			cart.add(item);
			session.setAttribute("cart", cart);
		} else {
			List<Item> cart = (List<Item>) session.getAttribute("cart");
			int index = isExisting(product.getName(), cart);
			if (index == -1) {
				item = new Item();
				item.setName(product.getName());
				item.setCategory(product.getCategory());
				item.setDescription(product.getDescription());
				item.setCost(product.getCost());
				item.setQuantity(Integer.parseInt(quantity));
				cart.add(item);
			}
			session.setAttribute("cart", cart);
		}
		modelAndView.addObject("productList", productList);
		modelAndView.setViewName("viewProducts");
		return modelAndView;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/removecart")
	public ModelAndView removeItems(HttpServletRequest request, @RequestParam("itemName") String itemName) {
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		List<Item> cart = (List<Item>) session.getAttribute("cart");
		int index = isExisting(itemName, cart);
		cart.remove(index);
		modelAndView.addObject("cart", cart);
		modelAndView.setViewName("cartItems");
		return modelAndView;
	}
	
	private int isExisting(String name, List<Item> cart) {
		for (int i = 0; i < cart.size(); i++) {
			if (String.valueOf(cart.get(i).getName()).equalsIgnoreCase(name)) {
				return i;
			}
		}
		return -1;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/confirmorder")
	public ModelAndView saveOrder(HttpServletRequest request){
		HttpSession session = request.getSession();
		Order order = new Order();
		int amount = Integer.parseInt(request.getParameter("amount"));
		List<Item> cart = (List<Item>) session.getAttribute("cart");
		User user = (User) session.getAttribute("userValid");
		order.setUserId(user.getUserId());
		order.setItems(cart);
		order.setAmount(amount);
		Boolean success = productService.addOrder(order);
		ModelAndView modelAndView = new ModelAndView();

		if (success) {
			modelAndView.addObject("msg",
					"<span style='color:green'>Order Created Successfully </span>");
			modelAndView.setViewName("confirmorder");
			session.removeAttribute("cart");
		} else {
			modelAndView.addObject("msg", "<span style='color:red'>Error occurred while creating the order! Please try Again</span>");
			modelAndView.setViewName("confirmorder");
		}
		return modelAndView;
	}
	
}
