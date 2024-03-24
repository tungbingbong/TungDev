package com.ebanking.service.impl;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.ebanking.entity.InterestRate;
import com.ebanking.entity.SavingAccount;
import com.ebanking.entity.User;
import com.ebanking.repository.InterestRateRepository;
import com.ebanking.repository.SavingAccountRepository;
import com.ebanking.service.SavingAccountService;

@Service("savingAccountService")
public class SavingAccountServiceImpl implements SavingAccountService{

	@Autowired
	private SavingAccountRepository savingAccountRepository;
	
	@Autowired
	private InterestRateRepository interestRateRepository;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Override
	public List<SavingAccount> findAll() {
		return savingAccountRepository.findAll();
	}

	@Override
	public SavingAccount find(long id) {
		return savingAccountRepository.findOne(id);
	}

	@Override
	public void save(SavingAccount savingAccount) {
		savingAccountRepository.save(savingAccount);
	}

	@Override
	public void delete(long id) {
		savingAccountRepository.delete(id);
	}
	
	@Override
	public void hash(SavingAccount savingAccount) {
		savingAccount.setPinCode(bCryptPasswordEncoder.encode(savingAccount.getPinCode()));	
	}

	@Override
	public void createNewSavingAccount(SavingAccount savingAccount, User user, HttpServletRequest request) {
		InterestRate interestRate = interestRateRepository.findOne((long)3);
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());
		calendar.add(Calendar.MONTH, Integer.parseInt(savingAccount.getTenor()));
		
		savingAccount.setAccNo((long)(Math.random() * 100000000 * 1000000)+"");
		savingAccount.setTenor(request.getParameter("tenor"));
		savingAccount.setUser(user);
		savingAccount.setOpenDate(new Date());
		savingAccount.setCloseDate(calendar.getTime());
		savingAccount.setInterestRate(interestRate);
		savingAccount.setDescription(request.getParameter("description"));
		savingAccount.setInitialAmount(Integer.parseInt(request.getParameter("initialAmount")));
		savingAccount.setPinCode(request.getParameter("pinCode"));
		savingAccount.setStatus(1);
	}

	@Override
	public void deactiveSavingAccount(SavingAccount savingAccount) {
		savingAccount.setCloseDate(new Date());
		savingAccount.setStatus(0);
	}
}
