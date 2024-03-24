package com.ebanking.controller.login;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ebanking.entity.CurrentAccount;
import com.ebanking.entity.LoanAccount;
import com.ebanking.entity.SavingAccount;
import com.ebanking.entity.User;
import com.ebanking.service.CurrentAccountService;
import com.ebanking.service.UserService;

@Controller(value = "loginController")
public class LoginController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CurrentAccountService currentAccountService;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView loginPage() {
		return new ModelAndView("login/login");
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logoutPage(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return new ModelAndView("redirect:/home");
	}
	
	@RequestMapping(value = "/accessDenied", method = RequestMethod.GET)
	public ModelAndView accessDenied() {
		return new ModelAndView("redirect:/login?accessDenied");
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public ModelAndView registerPage(Map<String, Object> model) {
		User user = new User();
		model.put("user", user);
		return new ModelAndView("login/register");
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(@Valid User user, BindingResult bindingResult, HttpServletRequest request) throws ParseException {
		userService.createNewUser(user, request);
		userService.hash(user);		
		userService.save(user);
		userService.bindRole(user);
		
//		User newUser = userService.find(user.getId());
//		CurrentAccount currentAccount = currentAccountService.createNewCurrentAccount(newUser);
//		currentAccountService.save(currentAccount);
		return "redirect:/login";
	}
}
