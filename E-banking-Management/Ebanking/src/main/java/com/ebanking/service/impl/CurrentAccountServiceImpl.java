package com.ebanking.service.impl;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.ebanking.dto.MyUser;
import com.ebanking.entity.CurrentAccount;
import com.ebanking.entity.InterestRate;
import com.ebanking.entity.Transaction;
import com.ebanking.entity.User;
import com.ebanking.repository.CurrentAccountRepository;
import com.ebanking.repository.InterestRateRepository;
import com.ebanking.service.CurrentAccountService;
import com.ebanking.service.TransactionService;
import com.ebanking.service.UserService;

@Service("currentAccountService")
public class CurrentAccountServiceImpl implements CurrentAccountService {

	@Autowired
	private CurrentAccountRepository currentAccountRepository;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private InterestRateRepository interestRateRepository;
	
	@Autowired
	private TransactionService transactionService;
	
	@Override
	public List<CurrentAccount> findAll() {
		return currentAccountRepository.findAll();
	}

	@Override
	public CurrentAccount find(long id) {
		return currentAccountRepository.findOne(id);
	}

	@Override
	public void save(CurrentAccount currentAccount) {
		currentAccountRepository.save(currentAccount);
	}

	@Override
	public void delete(long id) {
		currentAccountRepository.delete(id);
	}

	@Override
	public void deposit(int amount, User user, HttpServletRequest request) {
		user = userService.getCurrentUser();
		
		CurrentAccount currentAccount = user.getCurrentAccounts();
		int newBalance = currentAccount.getBalance() + amount;
		currentAccount.setBalance(newBalance);
		currentAccountRepository.save(currentAccount);
	}

	@Override
	public void withdraw(int amount, HttpServletRequest request) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		MyUser myUser = (MyUser)authentication.getPrincipal();
		long userId = myUser.getUserId();
		User user = userService.find(userId);
		
		CurrentAccount currentAccount = user.getCurrentAccounts();
		int newBalance = currentAccount.getBalance() - amount;
		currentAccount.setBalance(newBalance);
		currentAccountRepository.save(currentAccount);
	}
	
	@Override
	public void transfer(User user, User receiver, Transaction transaction, HttpServletRequest request) {
		CurrentAccount currentAccountR = receiver.getCurrentAccounts();
		int oldBalance = currentAccountR.getBalance();
		currentAccountR.setBalance(oldBalance + transaction.getAmount());
		currentAccountRepository.save(currentAccountR);
		
		CurrentAccount currentAccountU = user.getCurrentAccounts();
		int oB = currentAccountU.getBalance();
		currentAccountU.setBalance(oB - transaction.getAmount());
		currentAccountRepository.save(currentAccountU);	
	}
	
	@Override
	public CurrentAccount createNewCurrentAccount(User user) {
		InterestRate interestRate = interestRateRepository.findOne((long)1);
		CurrentAccount currentAccount = new CurrentAccount();
		currentAccount.setAccNo((long)(Math.random() * 1000000 * 1000000)+"");
		currentAccount.setCardNo((long)(Math.random() * 1000000000 * 10000000)+"");
		currentAccount.setUser(user);
		currentAccount.setInterestRate(interestRate);
		currentAccount.setStatus(1);
		currentAccount.setBalance(0);
		currentAccount.setOpenDate(new Date());		
		return currentAccount;
	}

	@Override
	public void setInitialBalance(CurrentAccount currentAccount, HttpServletRequest request) {
		currentAccount.setBalance(Integer.parseInt(request.getParameter("balance")));
	}
	
	@Override
	public void changePinCode(CurrentAccount currentAccount, HttpServletRequest request) {
		currentAccount.setPinCode(request.getParameter("pinCode"));
	}

	@Override
	public void activateCurrentAccount(CurrentAccount currentAccount) {
		currentAccount.setStatus(1);
	}

	@Override
	public void deactivateCurrentAccount(CurrentAccount currentAccount) {
		currentAccount.setStatus(0);
	}

	@Override
	public void receiveTransfer(User receiver, Transaction transaction, HttpServletRequest request) {
		CurrentAccount currentAccount = receiver.getCurrentAccounts();
		int oldBalance = currentAccount.getBalance();
		currentAccount.setBalance(oldBalance + transaction.getAmount());
		currentAccountRepository.save(currentAccount);
	}
}
