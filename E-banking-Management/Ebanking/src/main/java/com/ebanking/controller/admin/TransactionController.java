package com.ebanking.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ebanking.entity.Appointment;
import com.ebanking.entity.CurrentAccount;
import com.ebanking.entity.Transaction;
import com.ebanking.service.AppointmentService;
import com.ebanking.service.TransactionService;

@Controller(value="transactionControllerOfAdmin")
public class TransactionController {
	
	@Autowired
	private TransactionService transactionService;
	
	// TRANSACTION CONTROLLER
		@RequestMapping(value = "/admin/transaction/deposit", method = RequestMethod.GET)
		public ModelAndView adminViewDeposit(ModelMap modelMap) {
			modelMap.put("deposit", transactionService.findAllDeposit());
			ModelAndView mav = new ModelAndView("admin/transaction/deposit-list");
			return mav;
		}
		
		@RequestMapping(value = "/admin/transaction/deposit/detail/{id}", method = RequestMethod.GET)
		public ModelAndView adminViewDepositDetail(@PathVariable("id") long id, ModelMap modelMap) {
			Transaction transaction = transactionService.find(id);
			modelMap.addAttribute("transaction", transaction);
			ModelAndView mav = new ModelAndView("admin/transaction/deposit-detail");
			return mav;
		}
		
		@RequestMapping(value = "/admin/transaction/deposit/verify", method = RequestMethod.POST)
		public String adminVerifyDeposit(HttpServletRequest request) {
			long id = Long.parseLong(request.getParameter("id"));
			Transaction transaction = transactionService.find(id);
			transactionService.acceptDepositRecord(transaction);
			transactionService.save(transaction);
			return "redirect:/admin/transaction/deposit";
		}
		
		@RequestMapping(value = "/admin/transaction/withdraw", method = RequestMethod.GET)
		public ModelAndView adminViewWithdraw(ModelMap modelMap) {
			modelMap.put("withdraw", transactionService.findAllWithdraw());
			ModelAndView mav = new ModelAndView("admin/transaction/withdraw-list");
			return mav;
		}
		
		@RequestMapping(value = "/admin/transaction/withdraw/detail/{id}", method = RequestMethod.GET)
		public ModelAndView adminViewWithdrawDetail(@PathVariable("id") long id, ModelMap modelMap) {
			Transaction transaction = transactionService.find(id);
			modelMap.addAttribute("transaction", transaction);
			ModelAndView mav = new ModelAndView("admin/transaction/withdraw-detail");
			return mav;
		}
		
		@RequestMapping(value = "/admin/transaction/transfer", method = RequestMethod.GET)
		public ModelAndView adminViewTransfer(ModelMap modelMap) {
			modelMap.put("transfer", transactionService.findAllTransfer());
			ModelAndView mav = new ModelAndView("admin/transaction/transfer-list");
			return mav;
		}
}
