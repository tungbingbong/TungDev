package com.ebanking.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ebanking.entity.User;
import com.ebanking.service.UserService;

@Controller(value="profileControllerOfAdmin")
public class ProfileController {
	
	@Autowired
	private UserService userService;
	
	// PROFILE CONTROLLER
	@RequestMapping(value = "/admin/profile", method = RequestMethod.GET)
	public ModelAndView adminProfile(ModelMap modelMap) {
		User user = userService.getCurrentUser();

		ModelAndView mav = new ModelAndView("admin/profile/profile");
		modelMap.addAttribute("user", user);
		return mav;
	}

	@RequestMapping(value = "/admin/profile/edit", method = RequestMethod.GET)
	public ModelAndView adminEditProfile(ModelMap modelMap) {
		User user = userService.getCurrentUser();
		ModelAndView mav = new ModelAndView("admin/profile/edit-profile");
		modelMap.addAttribute("user", user);
		return mav;
	}

	@RequestMapping(value = "/admin/profile/edit", method = RequestMethod.POST)
	public String adminEditProfile(HttpServletRequest request) {
		User user = userService.getCurrentUser();
		user.setEmail(request.getParameter("email").trim());
		user.setPhone(request.getParameter("phone").trim());
		userService.save(user);
		return "redirect:/admin/profile";
	}

	@RequestMapping(value = "/admin/profile/change-password", method = RequestMethod.GET)
	public ModelAndView adminChangePassword(ModelMap modelMap) {
		User user = userService.getCurrentUser();

		ModelAndView mav = new ModelAndView("admin/profile/change-password");
		modelMap.addAttribute("user", user);
		return mav;
	}
	
	@RequestMapping(value = "/admin/profile/change-password", method = RequestMethod.POST)
	public String adminChangePassword(@Valid User user, BindingResult bindingResult, HttpServletRequest request){
		user = userService.getCurrentUser();
		user.setPassword(request.getParameter("password"));
//		if( bindingResult.hasErrors()) {
//			System.out.println("Error!" + bindingResult.getFieldError());
//			System.out.println("User" + user.toString());
//			return "admin/profile/change-password";
//		}
		userService.hash(user);	
		userService.save(user);
		return "redirect:/admin/profile";
	}
}
