package com.ebanking.controller.customer;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ebanking.dto.MyUser;
import com.ebanking.entity.User;
import com.ebanking.service.UserService;

@Controller(value="profileControllerOfCustomer")
public class ProfileController {
	
	@Autowired
	private UserService userService;
	
	// PROFILE CONTROLLER
		@RequestMapping(value = "/customer/profile", method = RequestMethod.GET)
		public ModelAndView customerProfile(ModelMap modelMap) {
			User user = userService.getCurrentUser();
			ModelAndView mav = new ModelAndView("customer/profile/profile");
			modelMap.addAttribute("user", user);
			return mav;
		}
		
		@RequestMapping(value = "/customer/profile/edit", method = RequestMethod.GET)
		public ModelAndView customerEditProfile(ModelMap modelMap, Map<String, Object> model) {
			User user = userService.getCurrentUser();
			User newUser = new User();
			model.put("user", newUser);
			ModelAndView mav = new ModelAndView("customer/profile/edit-profile");
			modelMap.addAttribute("user", user);
			return mav;
		}
		
		@RequestMapping(value = "/customer/profile/edit", method = RequestMethod.POST)
		public String customerEditProfile(@Valid User user, BindingResult bindingResult, HttpServletRequest request){
			user = userService.getCurrentUser();
			userService.editProfile(user, request);
			userService.save(user);
			return "redirect:/customer/profile";
		}
		
		@RequestMapping(value = "/customer/profile/change-password", method = RequestMethod.GET)
		public ModelAndView customerChangePassword(ModelMap modelMap, Map<String, Object> model) {
			User user = userService.getCurrentUser();
			User newUser = new User();
			model.put("user", newUser);
			ModelAndView mav = new ModelAndView("customer/profile/change-password");
			modelMap.addAttribute("user", user);
			return mav;
		}
		
		@RequestMapping(value = "/customer/profile/change-password", method = RequestMethod.POST)
		public String customerChangePassword(@Valid User user, BindingResult bindingResult, HttpServletRequest request){
			user = userService.getCurrentUser();
			user.setPassword(request.getParameter("password"));
			userService.hash(user);	
			userService.save(user);
			return "redirect:/customer/profile";
		}
}
