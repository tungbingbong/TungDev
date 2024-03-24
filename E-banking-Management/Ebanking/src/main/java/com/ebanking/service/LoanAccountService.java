package com.ebanking.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.ebanking.entity.LoanAccount;
import com.ebanking.entity.User;

public interface LoanAccountService {
	public List<LoanAccount> findAll();
	
	public LoanAccount find(long id);
	
	public void save(LoanAccount loanAccount);

	public void delete(long id);
	
	public void createNewLoanAccount(LoanAccount loanAccount, User user, HttpServletRequest request);
	
	public void acceptLoanAccount(LoanAccount loanAccount);
}
