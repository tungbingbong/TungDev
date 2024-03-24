package com.ebanking.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ebanking.entity.CurrentAccount;
import com.ebanking.entity.LoanAccount;
import com.ebanking.entity.SavingAccount;
import com.ebanking.service.CurrentAccountService;
import com.ebanking.service.LoanAccountService;
import com.ebanking.service.SavingAccountService;

@Controller(value="accountControllerOfAdmin")
public class AccountController {
	
	@Autowired
	private CurrentAccountService currentAccountService;
	
	@Autowired
	private SavingAccountService savingAccountService;
	
	@Autowired
	private LoanAccountService loanAccountService;
	
	// ACCOUNT CONTROLLER
		@RequestMapping(value = "/admin/current-account", method = RequestMethod.GET)
		public ModelAndView adminViewCurrentAccount(ModelMap modelMap) {
			modelMap.put("currentAccount", currentAccountService.findAll());
			ModelAndView mav = new ModelAndView("admin/account/current-account-list");
			return mav;
		}
		
		@RequestMapping(value = "/admin/current-account/activate", method = RequestMethod.POST)
		public String adminActivateAppointment(HttpServletRequest request) {
			long id = Long.parseLong(request.getParameter("id"));
			CurrentAccount currentAccount = currentAccountService.find(id);
			currentAccountService.activateCurrentAccount(currentAccount);
			currentAccountService.save(currentAccount);
			return "redirect:/admin/current-account";
		}
		
		@RequestMapping(value = "/admin/current-account/deactivate", method = RequestMethod.POST)
		public String adminDeactivateAppointment(HttpServletRequest request) {
			long id = Long.parseLong(request.getParameter("id"));
			CurrentAccount currentAccount = currentAccountService.find(id);
			currentAccountService.deactivateCurrentAccount(currentAccount);
			currentAccountService.save(currentAccount);
			return "redirect:/admin/current-account";
		}
		
		@RequestMapping(value = "/admin/current-account/detail/{id}", method = RequestMethod.GET)
		public ModelAndView adminViewCurrentAccountDetail(@PathVariable("id") long id, ModelMap modelMap) {
			CurrentAccount currentAccount = currentAccountService.find(id);
			modelMap.addAttribute("currentAccount", currentAccount);
			ModelAndView mav = new ModelAndView("admin/account/current-account-detail");
			return mav;
		}
		
		@RequestMapping(value = "/admin/current-account/detail/{id}/set-balance", method = RequestMethod.GET)
		public ModelAndView adminSetCurrentAccountBalance(@PathVariable("id") long id, ModelMap modelMap) {
			CurrentAccount currentAccount = currentAccountService.find(id);
			modelMap.addAttribute("currentAccount", currentAccount);
			ModelAndView mav = new ModelAndView("admin/account/current-account-set-balance");
			return mav;
		}
		
		@RequestMapping(value = "/admin/current-account/detail/{id}/set-balance", method = RequestMethod.POST)
		public String adminSetCurrentAccountBalance(@PathVariable("id") long id, HttpServletRequest request) {
			CurrentAccount currentAccount = currentAccountService.find(id);
			currentAccountService.setInitialBalance(currentAccount, request);
			currentAccountService.save(currentAccount);
			return "redirect:/admin/current-account/detail/" + id;
		}

		@RequestMapping(value = "/admin/saving-account", method = RequestMethod.GET)
		public ModelAndView adminViewSavingAccount(ModelMap modelMap) {
			modelMap.put("savingAccount", savingAccountService.findAll());
			ModelAndView mav = new ModelAndView("admin/account/saving-account-list");
			return mav;
		}
		
		@RequestMapping(value = "/admin/saving-account/detail/{id}", method = RequestMethod.GET)
		public ModelAndView adminViewSavingAccountDetail(@PathVariable("id") long id, ModelMap modelMap) {
			SavingAccount savingAccount = savingAccountService.find(id);
			modelMap.addAttribute("savingAccount", savingAccount);
			ModelAndView mav = new ModelAndView("admin/account/saving-account-detail");
			return mav;
		}

		@RequestMapping(value = "/admin/loan-account", method = RequestMethod.GET)
		public ModelAndView adminViewLoanAccount(ModelMap modelMap) {
			modelMap.put("loanAccount", loanAccountService.findAll());
			ModelAndView mav = new ModelAndView("admin/account/loan-account-list");
			return mav;
		}
		
		@RequestMapping(value = "/admin/loan-account/verify", method = RequestMethod.POST)
		public String adminVerifyAppointment(HttpServletRequest request) {
			long id = Long.parseLong(request.getParameter("id"));
			LoanAccount loanAccount = loanAccountService.find(id);
			loanAccountService.acceptLoanAccount(loanAccount);
			loanAccountService.save(loanAccount);
			return "redirect:/admin/loan-account";
		}
		
		@RequestMapping(value = "/admin/loan-account/detail/{id}", method = RequestMethod.GET)
		public ModelAndView adminViewLoanAccountDetail(@PathVariable("id") long id, ModelMap modelMap) {
			LoanAccount loanAccount = loanAccountService.find(id);
			modelMap.addAttribute("loanAccount", loanAccount);
			ModelAndView mav = new ModelAndView("admin/account/loan-account-detail");
			return mav;
		}
}
