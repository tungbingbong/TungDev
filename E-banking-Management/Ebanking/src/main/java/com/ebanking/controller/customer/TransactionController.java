package com.ebanking.controller.customer;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ebanking.entity.CurrentAccount;
import com.ebanking.entity.Transaction;
import com.ebanking.entity.User;
import com.ebanking.service.CurrentAccountService;
import com.ebanking.service.TransactionService;
import com.ebanking.service.UserService;

@Controller(value = "transactionControllerOfCustomer")
public class TransactionController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CurrentAccountService currentAccountService;
	
	@Autowired
	private TransactionService transactionService;
	
	// TRANSACTION CONTROLLER	
	@RequestMapping(value = "/customer/transaction", method = RequestMethod.GET)
	public ModelAndView customerViewTransaction() {
		ModelAndView mav = new ModelAndView("customer/transaction/transaction-list");
		return mav;
	}

	//DEPOSIT
	@RequestMapping(value = "/customer/transaction/deposit/history", method = RequestMethod.GET)
	public ModelAndView customerViewDeposit(ModelMap modelMap) {
		User user = userService.getCurrentUser();		
		List<Transaction> transactions = transactionService.getCurrentUserDeposit(user);
			modelMap.put("transaction", transactions);
		ModelAndView mav = new ModelAndView("customer/transaction/deposit-list");
		return mav;
	}

	@RequestMapping(value = "/customer/transaction/deposit", method = RequestMethod.GET)
	public ModelAndView customerCreateDeposit(ModelMap modelMap, Map<String, Object> model) {
		User user = userService.getCurrentUser();

		CurrentAccount currentAccount = user.getCurrentAccounts();
		if (currentAccount != null) {
			modelMap.addAttribute("totalAmount", currentAccount.getBalance());
		} else {
			modelMap.addAttribute("totalAmount", 0);
		}
		
		List<Transaction> transactions = transactionService.getCurrentUserDeposit(user);
		modelMap.addAttribute("depositTime", transactions.size());

		Transaction transaction = new Transaction();
		model.put("transaction", transaction);
		ModelAndView mav = new ModelAndView("customer/transaction/create-deposit");
		return mav;
	}

	@RequestMapping(value = "/customer/transaction/deposit", method = RequestMethod.POST)
	public String customerCreateDeposit(@Valid Transaction transaction, BindingResult bindingResult,
			HttpServletRequest request) {
		User user = userService.getCurrentUser();
		if( bindingResult.hasErrors()) {
			return "customer/transaction/create-deposit";
		}
		transactionService.createDeposit(transaction, user, request);
		currentAccountService.deposit(transaction.getAmount(), user, request);
		//TODO: auto create an appointment and remove calculate in currentAccount.balance directly
		transactionService.save(transaction);
		return "redirect:/customer/transaction/deposit/history";
	}
	
	//WIDTHDRAW
	@RequestMapping(value = "/customer/transaction/withdraw/history", method = RequestMethod.GET)
	public ModelAndView customerViewWithdraw(ModelMap modelMap) {
		User user = userService.getCurrentUser();

		List<Transaction> transactions = transactionService.getCurrentUserWithdraw(user);
		modelMap.put("transaction", transactions);
		ModelAndView mav = new ModelAndView("customer/transaction/withdraw-list");
		return mav;
	}

	@RequestMapping(value = "/customer/transaction/withdraw", method = RequestMethod.GET)
	public ModelAndView customerCreateWithdraw(ModelMap modelMap, Map<String, Object> model) {
		User user = userService.getCurrentUser();

		CurrentAccount currentAccount = user.getCurrentAccounts();
		if (currentAccount != null) {
			modelMap.addAttribute("totalAmount", currentAccount.getBalance());
		} else {
			modelMap.addAttribute("totalAmount", 0);
		}
		
		List<Transaction> transactions = transactionService.getCurrentUserWithdraw(user);
		modelMap.addAttribute("withdrawTime", transactions.size());

		ModelAndView mav = new ModelAndView("customer/transaction/create-withdraw");
		Transaction transaction = new Transaction();
		model.put("transaction", transaction);
		return mav;
	}

	@RequestMapping(value = "/customer/transaction/withdraw", method = RequestMethod.POST)
	public String customerCreateWithdraw(@Valid Transaction transaction, BindingResult bindingResult,
			HttpServletRequest request) {
		User user = userService.getCurrentUser();
		if( bindingResult.hasErrors()) {
			return "customer/transaction/create-withdraw";
		}
		transactionService.createWithdraw(transaction, user, request);
		currentAccountService.withdraw(transaction.getAmount(), request);
		transactionService.save(transaction);
		return "redirect:/customer/transaction/withdraw/history";
	}

	//TRANSFER
	@RequestMapping(value = "/customer/transaction/transfer/history", method = RequestMethod.GET)
	public ModelAndView customerViewTransfer(ModelMap modelMap) {
		User user = userService.getCurrentUser();

		List<Transaction> transactions = transactionService.getCurrentUserTranfer(user);
		modelMap.put("transaction", transactions);
		ModelAndView mav = new ModelAndView("customer/transaction/transfer-list");
		return mav;
	}
	
	@RequestMapping(value = "/customer/transaction/transfer", method = RequestMethod.GET)
	public ModelAndView customerViewTransfer(ModelMap modelMap, Map<String, Object> model) {
		User user = userService.getCurrentUser();
		
		CurrentAccount currentAccount = user.getCurrentAccounts();
		if (currentAccount != null) {
			modelMap.addAttribute("totalAmount", currentAccount.getBalance());
		} else {
			modelMap.addAttribute("totalAmount", 0);
		}
		
		List<Transaction> transactions = transactionService.getCurrentUserTranfer(user);
		modelMap.addAttribute("transferTime", transactions.size());
		
		ModelAndView mav = new ModelAndView("customer/transaction/create-transfer");
		return mav;
	}
	
	@RequestMapping(value = "/customer/transaction/transfer", method = RequestMethod.POST)
	public String customerTransferSameBank(HttpServletRequest request) {
		String accNo = request.getParameter("accNo");
		long id = 0;
		List<CurrentAccount> cAs = currentAccountService.findAll();
		for(CurrentAccount cA : cAs) {
			if (cA.getAccNo().equals(accNo)) {
				id = cA.getId();
				break;
			}
		}
		User receiver = userService.find(id);
		System.out.println(receiver==null);
		User user = userService.getCurrentUser();
		Transaction transaction = new Transaction();
		transactionService.createTransfer(transaction, user, receiver, request);
		currentAccountService.transfer(user, receiver, transaction, request);
		transactionService.save(transaction);
		return "redirect:/customer/transaction/transfer/history";
	}

	@RequestMapping(value = "/customer/transaction/transfer/other-bank", method = RequestMethod.GET)
	public String customerTransferOtherBank() {
		return "";
	}
}
