package com.ebanking.controller.admin;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ebanking.service.AppointmentService;
import com.ebanking.service.CurrentAccountService;
import com.ebanking.service.LoanAccountService;
import com.ebanking.service.SavingAccountService;
import com.ebanking.service.TransactionService;
import com.ebanking.service.UserService;
import com.ebanking.entity.Appointment;
import com.ebanking.entity.CurrentAccount;
import com.ebanking.entity.LoanAccount;
import com.ebanking.entity.SavingAccount;
import com.ebanking.entity.Transaction;
import com.ebanking.entity.User;

@Controller(value="adminController")
public class AdminController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private CurrentAccountService currentAccountService;
	
	@Autowired
	private SavingAccountService savingAccountService;
	
	@Autowired
	private LoanAccountService loanAccountService;
	
	@Autowired
	private TransactionService transactionService;
	
	@Autowired
	private AppointmentService appointmentService;
	
// HOME CONTROLLER
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public ModelAndView adminHomePage(ModelMap modelMap) {
		//Get all customer
		List<User> allUsers = userService.findAll();
		modelMap.addAttribute("allUsers", allUsers.size());
		
		//Get all account
		List<CurrentAccount> allCurrentAccount = currentAccountService.findAll();
		List<SavingAccount> allSavingAccount = savingAccountService.findAll();
		List<LoanAccount> allLoanAccount = loanAccountService.findAll();
		int allAccounts = allCurrentAccount.size() + allSavingAccount.size() + allLoanAccount.size();
		modelMap.addAttribute("allAccounts", allAccounts);
		
		//Get all transaction
		List<Transaction> allTransaction = transactionService.findAll();
		modelMap.addAttribute("allTransactions", allTransaction.size());
		
		//Get all appointment
		List<Appointment> allAppointments = appointmentService.findAll();
		modelMap.addAttribute("allAppointments", allAppointments.size());
		ModelAndView mav = new ModelAndView("admin/home");
		return mav;
	}
	
// CUSTOMER CONTROLLER
	@RequestMapping(value = "/admin/customer", method = RequestMethod.GET)
	public ModelAndView adminViewCustomer(ModelMap modelMap) {
		modelMap.put("user", userService.findAll());
		modelMap.addAttribute("accountNo", userService.countAccount(userService.findAll()));
		ModelAndView mav = new ModelAndView("admin/customer/customer-list");
		return mav;
	}
	
	@RequestMapping(value = "/admin/customer/create", method = RequestMethod.GET)
	public ModelAndView adminCreateCustomer(ModelMap modelMap) {
		ModelAndView mav = new ModelAndView("admin/customer/create-customer");
		return mav;
	}
	
	@RequestMapping(value = "/admin/customer/create", method = RequestMethod.POST)
	public String adminCreateCustomer(HttpServletRequest request) throws ParseException {
		SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyy");
		User user = new User();	
		user.setFirstName(request.getParameter("firstName").trim());
		user.setLastName(request.getParameter("lastName").trim());
		user.setGender(request.getParameter("gender").trim());
		user.setDob(format.parse(request.getParameter("dob")));
		user.setPhone(request.getParameter("phone").trim());
		user.setEmail(request.getParameter("email").trim());
		user.setNationality(request.getParameter("nationality").trim());
		user.setCity(request.getParameter("city").trim());
		user.setAddress(request.getParameter("address").trim());
		user.setSalary(Long.parseLong(request.getParameter("salary").trim()));
		user.setUsername(request.getParameter("username").trim());
		user.setPassword(request.getParameter("password").trim());
		
		userService.hash(user);		
		userService.save(user);
		userService.bindRole(user);
		return "redirect:/admin/customer";	
	}
	
	@RequestMapping(value = "/admin/customer/edit/{id}", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView adminEditCustomer(@PathVariable("id") long id, ModelMap modelMap, Map<String, Object> model) {
		User user = userService.find(id);
		modelMap.addAttribute("user", user);
		model.put("user", user);
		ModelAndView mav = new ModelAndView("admin/customer/edit-customer");
		return mav;
	}
	// TODO
	@RequestMapping(value = "/admin/customer/edit/{id}", method = RequestMethod.POST)
	public String adminEditCustomer(@PathVariable("id") Long id, @Valid User user, BindingResult result, HttpServletRequest request) throws ParseException {
		user = userService.find(id);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		user.setFirstName(request.getParameter("firstName"));
		user.setLastName(request.getParameter("lastName"));
		user.setUsername(request.getParameter("username"));
		user.setGender(request.getParameter("gender"));
		//user.setDob(format.parse(request.getParameter("dob")));
		user.setNationality(request.getParameter("nationality"));
		user.setCity(request.getParameter("city"));
		user.setAddress(request.getParameter("address"));
		//user.setSalary(Long.parseLong(request.getParameter("salary")));
		user.setEmail(request.getParameter("email"));
		user.setPhone(request.getParameter("phone"));
		userService.save(user);
		return "redirect:/admin/customer";
	}

	@RequestMapping(value = "/admin/customer/delete/{id}", method = RequestMethod.GET)
	public String adminDeleteCustomer(@PathVariable("id") Long id) {
		userService.delete(id);
		return "redirect:/admin/customer";
	}
	
	@RequestMapping(value = "/admin/customer/detail/{id}", method = RequestMethod.GET)
	public ModelAndView adminViewCustomerDetail(@PathVariable("id") long id, ModelMap modelMap) {
		User user = userService.find(id);
		modelMap.addAttribute("user", user);
		ModelAndView mav = new ModelAndView("admin/customer/customer-detail");
		return mav;
	}
}
