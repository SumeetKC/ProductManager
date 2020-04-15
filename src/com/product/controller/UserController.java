package com.product.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.product.model.Order;
import com.product.model.User;
import com.product.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/doLogin", method = RequestMethod.POST)
	public ModelAndView loginInit(@ModelAttribute("loginForm") User user, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		User userValid = userService.isUserValid(user);
		if(userValid != null)
		{
			if (userValid.getUserId() == user.getUserId() && userValid.getPassword().equalsIgnoreCase(user.getPassword())) {
				session.setAttribute("userValid", userValid);
				modelAndView.setViewName("redirect:/welcome");

			} else {
				modelAndView.addObject("msg", "<span style='color:red'>Login Failed Please try again. Please Enter Correct User Id or Password.</span>");
				modelAndView.setViewName("forward:/");
			}
		}
		else {
			modelAndView.addObject("msg", "<span style='color:red'>Login Failed Please try again. Please Enter Correct User Id or Password.</span>");
			modelAndView.setViewName("forward:/");
		}
		return modelAndView;
	}

	@RequestMapping("/welcome")
	public String sendWelcomeHome() {
		return "welcome";
	}

	@RequestMapping("/")
	public String indexLogin() {
		return "indexLogin";
	}
	
	@RequestMapping(value = "/doLogin", method = RequestMethod.GET)
	public String redirectToLogin() {
		return "redirect:/";
	}

	@RequestMapping(value = "/doLogout")
	public ModelAndView processLogout(HttpSession session) {
		session.invalidate();
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("msg", "<span style='color:green'>Logout Action Completed Successfully</span>");
		modelAndView.setViewName("indexLogin");
		return modelAndView;
	}
	

	@RequestMapping(value = "/registerform")
	public ModelAndView viewRegisterForm() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("registerform");
		return modelAndView;
	}

	@RequestMapping(value = "/signupprocess", method = RequestMethod.POST)
	public ModelAndView signUpUser(@ModelAttribute("registerform") User user) {
		Boolean success = userService.addUser(user);
		ModelAndView modelAndView = new ModelAndView();

		if (success) {
			modelAndView.addObject("msg",
					"<span style='color:green'>Registration Successful After Approval You Can Login</span>");
			modelAndView.setViewName("indexLogin");
		} else {
			modelAndView.addObject("msg", "<span style='color:red'>Registration failed ! Please try Again</span>");
			modelAndView.setViewName("registerform");

		}
		return modelAndView;
	}

	@RequestMapping(value = "/listusers")
	public ModelAndView showUserList() {
		ModelAndView modelAndView = new ModelAndView();
		List<User> userlist = userService.getAllUsers();
		modelAndView.addObject("userList", userlist);
		modelAndView.setViewName("userlist");
		return modelAndView;
	}

	@RequestMapping(value = "/saveforgotpass")
	public ModelAndView saveForgotPassword(@RequestParam("userId") String userId,
			@RequestParam("password") String password) {
		ModelAndView modelAndView = new ModelAndView();
		User user = new User();
		user.setUserId(Integer.parseInt(userId));
		user.setPassword(password);
		User result = userService.saveForgotPassword(user);
		if (result != null) {
			modelAndView.setViewName("forward:/");
			modelAndView.addObject("message", "Password Updated Successfully! Please Login..");
		} else {
			modelAndView.setViewName("forgotPassChange");
			modelAndView.addObject("message", "Updation Failed! Please enter the correct User ID");
		}
		return modelAndView;
	}
	
	@RequestMapping(value = "/changepass")
	public ModelAndView changePass(@RequestParam("userid") int id) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("userId", id);
		modelAndView.setViewName("forgotPassChange");
		return modelAndView;
	}

	@RequestMapping(value = "/generatePass")
	public String forgotPassChangeView() {
		return "forgotPassChange";
	}
	
	@RequestMapping(value = "/vieworders")
	public ModelAndView viewOrders(@RequestParam("userid") int id) {
		ModelAndView modelAndView = new ModelAndView();
		List<Order> orders = userService.viewOrders(id);
		if (orders != null && orders.size()>0) {
			modelAndView.setViewName("vieworders");
			modelAndView.addObject("orders", orders);
		} else {
			modelAndView.setViewName("vieworders");
			modelAndView.addObject("message", "There are no orders to display.");
		}
		return modelAndView;
	}


}
