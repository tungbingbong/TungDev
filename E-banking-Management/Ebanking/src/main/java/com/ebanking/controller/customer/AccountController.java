package com.ebanking.controller.customer;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ebanking.dto.MyUser;
import com.ebanking.entity.CurrentAccount;
import com.ebanking.entity.InterestRate;
import com.ebanking.entity.LoanAccount;
import com.ebanking.entity.SavingAccount;
import com.ebanking.entity.User;
import com.ebanking.service.CurrentAccountService;
import com.ebanking.service.LoanAccountService;
import com.ebanking.service.SavingAccountService;
import com.ebanking.service.UserService;

@Controller(value = "accountControllerOfCustomer")
public class AccountController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private CurrentAccountService currentAccountService;
	
	@Autowired
	private SavingAccountService savingAccountService;
	
	@Autowired
	private LoanAccountService loanAccountService;

	// ACCOUNT CONTROLLER
	//CURRENT-ACCOUNT
	@RequestMapping(value = "/customer/current-account", method = RequestMethod.GET)
	public ModelAndView customerViewCurrentAccount(ModelMap modelMap) {
		User user = userService.getCurrentUser();
		CurrentAccount currentAccount = user.getCurrentAccounts();
		
		modelMap.put("currentAccount", currentAccount);
		ModelAndView mav = new ModelAndView("customer/account/current-account");
		return mav;
	}
	
	@RequestMapping(value = "/customer/current-account/change-pincode", method = RequestMethod.GET)
	public ModelAndView customerChangePINCODE(ModelMap modelMap) {
		User user = userService.getCurrentUser();
		CurrentAccount currentAccount = user.getCurrentAccounts();
		modelMap.put("currentAccount", currentAccount);
		ModelAndView mav = new ModelAndView("customer/account/change-pincode");
		return mav;
	}
	
	@RequestMapping(value = "/customer/current-account/change-pincode", method = RequestMethod.POST)
	public String customerChangePINCODE(@Valid CurrentAccount currentAccount, BindingResult bindingResult, 
			HttpServletRequest request) {
		currentAccount = userService.getCurrentUser().getCurrentAccounts();
		currentAccountService.changePinCode(currentAccount, request);
		if( bindingResult.hasErrors()) {
			return "customer/account/change-pincode";
		}
		currentAccountService.save(currentAccount);
		return "redirect:/customer/current-account";
	}

	//SAVING-ACCOUNT
	@RequestMapping(value = "/customer/saving-account", method = RequestMethod.GET)
	public ModelAndView customerViewSavingAccount(ModelMap modelMap) {
		User user = userService.getCurrentUser();
		List<SavingAccount> allSavingAccounts = user.getSavingAccounts();
		
		List<SavingAccount> savingAccounts = new ArrayList<>();
		for(SavingAccount savingAccount : allSavingAccounts) {
			if (savingAccount.getStatus() == 1) {
				savingAccounts.add(savingAccount);
			}
		}
		modelMap.put("savingAccounts", savingAccounts);
		ModelAndView mav = new ModelAndView("customer/account/saving-account-list");
		return mav;
	}

	@RequestMapping(value = "/customer/saving-account/create", method = RequestMethod.GET)
	public ModelAndView customerCreateSavingAccount(Map<String, Object> model) {
		SavingAccount savingAccount = new SavingAccount();
		model.put("savingAccount", savingAccount);
		ModelAndView mav = new ModelAndView("customer/account/create-saving-account");
		return mav;
	}
	
	@RequestMapping(value = "/customer/saving-account/create", method = RequestMethod.POST)
	public String customerCreateSavingAccount(@Valid SavingAccount savingAccount, BindingResult bindingResult, 
			HttpServletRequest request) {
		User user = userService.getCurrentUser();
		if( bindingResult.hasErrors()) {
			return "customer/account/create-saving-account";
		}
		savingAccountService.createNewSavingAccount(savingAccount, user, request);
		//savingAccountService.hash(savingAccount);
		savingAccountService.save(savingAccount);		
		return "redirect:/customer/saving-account";
	}

	/* 
	 * @effects:
	 * The Saving Account will not be delete
	 * Change status from 1 to 0
	 * Return back money to customer 
	 */	
	@RequestMapping(value = "/customer/saving-account/delete", method = RequestMethod.POST)
	public String customerDeleteSavingAccount(HttpServletRequest request) {
		long id = Long.parseLong(request.getParameter("id"));
		SavingAccount savingAccount = savingAccountService.find(id);
		savingAccountService.deactiveSavingAccount(savingAccount);
		savingAccountService.save(savingAccount);
		//TODO: do + money to account
		return "redirect:/customer/saving-account";
	}

	//LOAN-ACCOUNT
	@RequestMapping(value = "/customer/loan-account", method = RequestMethod.GET)
	public ModelAndView customerViewLoanAccount(ModelMap modelMap) {
		User user = userService.getCurrentUser();
		List<LoanAccount> loanAccounts = user.getLoanAccounts();
		modelMap.put("loanAccounts", loanAccounts);
		ModelAndView mav = new ModelAndView("customer/account/loan-account-list");
		return mav;
	}

	@RequestMapping(value = "/customer/loan-account/create", method = RequestMethod.GET)
	public ModelAndView customerCreateLoanAccount(Map<String, Object> model) {
		LoanAccount loanAccount = new LoanAccount();
		model.put("loanAccount", loanAccount);
		ModelAndView mav = new ModelAndView("customer/account/create-loan-account");
		return mav;
	}
	
	@RequestMapping(value = "/customer/loan-account/create", method = RequestMethod.POST)
	public String customerCreateLoanAccount(@Valid LoanAccount loanAccount, BindingResult bindingResult, 
			HttpServletRequest request) {
		User user = userService.getCurrentUser();
		if( bindingResult.hasErrors()) {
			return "customer/account/create-loan-account";
		}
		loanAccountService.createNewLoanAccount(loanAccount, user, request);
		loanAccountService.save(loanAccount);		
		return "redirect:/customer/loan-account";
	}
	
	@RequestMapping(value = "/customer/loan-account/pay", method = RequestMethod.GET)
	public ModelAndView customerPayLoanAccount(Map<String, Object> model) {
		LoanAccount loanAccount = new LoanAccount();
		model.put("loanAccount", loanAccount);
		ModelAndView mav = new ModelAndView("customer/account/create-loan-account");
		return mav;
	}

}
