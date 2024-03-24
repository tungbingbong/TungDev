package com.ebanking.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.ebanking.entity.Transaction;
import com.ebanking.entity.User;
import com.ebanking.entity.CurrentAccount;

public interface TransactionService {
	public List<Transaction> findAll();
	
	public List<Transaction> findAllDeposit();
	
	public List<Transaction> findAllWithdraw();
	
	public List<Transaction> findAllTransfer();
	
	public Transaction find(long id);
	
	public void save(Transaction transaction);

	public void delete(long id);
	
	public List<Transaction> findByCurrentAccount(Iterable<Transaction> transactions, CurrentAccount currentAccount);
	
	public void createDeposit(Transaction transaction, User user, HttpServletRequest request);
	
	public void createWithdraw(Transaction transaction, User user, HttpServletRequest request);
	
	public void createTransfer(Transaction transaction, User user, User receiver, HttpServletRequest request);
	
	public List<Transaction> getCurrentUserDeposit(User user);
	
	public List<Transaction> getCurrentUserWithdraw(User user);
	
	public List<Transaction> getCurrentUserTranfer(User user);
	
	public void acceptDepositRecord(Transaction transaction);
}
