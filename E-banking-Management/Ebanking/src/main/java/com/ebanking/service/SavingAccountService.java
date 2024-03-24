package com.ebanking.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.ebanking.entity.SavingAccount;
import com.ebanking.entity.User;

public interface SavingAccountService {
	public List<SavingAccount> findAll();
	
	public SavingAccount find(long id);
	
	public void save(SavingAccount savingAccount);

	public void delete(long id);
	
	public void hash(SavingAccount savingAccount);
	
	public void createNewSavingAccount(SavingAccount savingAccount, User user, HttpServletRequest request);
	
	public void deactiveSavingAccount(SavingAccount savingAccount);
}
