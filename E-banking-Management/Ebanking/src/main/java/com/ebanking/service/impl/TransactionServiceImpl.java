package com.ebanking.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ebanking.entity.CurrentAccount;
import com.ebanking.entity.Transaction;
import com.ebanking.entity.User;
import com.ebanking.service.TransactionService;
import com.ebanking.repository.TransactionRepository;

@Service("transactionService")
public class TransactionServiceImpl implements TransactionService{

	@Autowired
	private TransactionRepository transactionRepository;
	
	@Override
	public List<Transaction> findAll() {
		return transactionRepository.findAll();
	}

	@Override
	public List<Transaction> findAllDeposit() {
		List<Transaction> allTransactions = findAll();
		List<Transaction> depositTransactions = new ArrayList<>();
		for(Transaction transaction : allTransactions) {
			if(transaction.getType().equals("Deposit")) {
				depositTransactions.add(transaction);
			}
		}
		return depositTransactions;
	}

	@Override
	public List<Transaction> findAllWithdraw() {
		List<Transaction> allTransactions = findAll();
		List<Transaction> withdrawTransactions = new ArrayList<>();
		for(Transaction transaction : allTransactions) {
			if(transaction.getType().equals("Withdraw")) {
				withdrawTransactions.add(transaction);
			}
		}
		return withdrawTransactions;
	}

	@Override
	public List<Transaction> findAllTransfer() {
		List<Transaction> allTransactions = findAll();
		List<Transaction> transferTransactions = new ArrayList<>();
		for(Transaction transaction : allTransactions) {
			if(transaction.getType().equals("Transfer")) {
				transferTransactions.add(transaction);
			}
		}
		return transferTransactions;
	}
	
	@Override
	public Transaction find(long id) {
		return transactionRepository.findOne(id);
	}

	@Override
	public void save(Transaction transaction) {
		transactionRepository.save(transaction);		
	}

	@Override
	public void delete(long id) {
		transactionRepository.delete(id);
	}

	@Override
	public List<Transaction> findByCurrentAccount(Iterable<Transaction> transactions, CurrentAccount currentAccount) {
		List<Transaction> filteredTransaction = new ArrayList<Transaction>();
		for(Transaction transaction: filteredTransaction) {
			if (currentAccount.equals(transaction.getCurrentAccount())) {
				filteredTransaction.add(transactionRepository.findOne(transaction.getId()));
			}
		}
		return null;
	}

	@Override
	public void createDeposit(Transaction transaction, User user, HttpServletRequest request) {
		transaction.setCurrentAccount(user.getCurrentAccounts());
		transaction.setAmount(Integer.parseInt(request.getParameter("amount")));
		transaction.setDate(new Date());
		transaction.setType("Deposit");
		transaction.setDescription(request.getParameter("description"));
		transaction.setReceiver(user);
		transaction.setStatus(0);	
	}
	
	@Override
	public void createWithdraw(Transaction transaction, User user, HttpServletRequest request) {
		transaction.setCurrentAccount(user.getCurrentAccounts());
		transaction.setAmount(Integer.parseInt(request.getParameter("amount")));
		transaction.setDate(new Date());
		transaction.setReceiver(user);
		transaction.setType("Withdraw");
		transaction.setDescription(request.getParameter("description"));
		transaction.setStatus(1);
	}
	
	@Override
	public void createTransfer(Transaction transaction, User user, User receiver, HttpServletRequest request) {
		transaction.setCurrentAccount(user.getCurrentAccounts());
		transaction.setAmount(Integer.parseInt(request.getParameter("amount")));
		transaction.setDate(new Date());
		transaction.setReceiver(receiver);
		transaction.setType("Transfer");
		transaction.setDescription(request.getParameter("description"));
		transaction.setStatus(1);
	}

	@Override
	public List<Transaction> getCurrentUserDeposit(User user) {
		List<Transaction> allTransaction = findAll();
		List<Transaction> transactions = new ArrayList<>();
		for (Transaction transaction : allTransaction) {
			if (transaction.getReceiver().getId() == user.getId() && transaction.getType().equals("Deposit")) {
				transactions.add(transaction);
			}
		}
		return transactions;
	}

	@Override
	public List<Transaction> getCurrentUserWithdraw(User user) {
		List<Transaction> allTransaction = findAll();
		List<Transaction> transactions = new ArrayList<>();
		for (Transaction transaction : allTransaction) {
			if (transaction.getReceiver().getId() == user.getId() && transaction.getType().equals("Withdraw")) {
				transactions.add(transaction);
			}
		}
		return transactions;
	}
	
	@Override
	public List<Transaction> getCurrentUserTranfer(User user) {
		List<Transaction> allTransaction = findAll();
		List<Transaction> transactions = new ArrayList<>();
		for (Transaction transaction : allTransaction) {
			if (transaction.getReceiver().getId() == user.getId() && transaction.getType().equals("Transfer")) {
				transactions.add(transaction);
			}
		}
		return transactions;
	}

	@Override
	public void acceptDepositRecord(Transaction transaction) {
		transaction.setStatus(1);
	}
}
