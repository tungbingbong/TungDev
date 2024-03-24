package com.ebanking.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;

@Entity
@Table(name = "interest_rate")
public class InterestRate {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotBlank(message = "Please enter specific type")
	@Column(name = "type")
	private String type;
	
	@NotNull(message = "Please enter interest rate")
	@Column(name = "interestRate")
	private Double interestRate;
	
	// FK
	@OneToMany(mappedBy="interestRate")
	private List<LoanAccount> loanAccount = new ArrayList<>();
	
	@OneToMany(mappedBy="interestRate")
	private List<SavingAccount> savingAccount = new ArrayList<>();
	
	@OneToMany(mappedBy="interestRate")
	private List<CurrentAccount> currentAccount = new ArrayList<>();

	public Long getId() {
		return id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Double getInterestRate() {
		return interestRate;
	}

	public void setInterestRate(Double interestRate) {
		this.interestRate = interestRate;
	}
	
	public List<LoanAccount> getLoanAccount() {
		return loanAccount;
	}

	public void setLoanAccount(List<LoanAccount> loanAccount) {
		this.loanAccount = loanAccount;
	}

	public List<SavingAccount> getSavingAccount() {
		return savingAccount;
	}

	public void setSavingAccount(List<SavingAccount> savingAccount) {
		this.savingAccount = savingAccount;
	}

	public List<CurrentAccount> getCurrentAccount() {
		return currentAccount;
	}

	public void setCurrentAccount(List<CurrentAccount> currentAccount) {
		this.currentAccount = currentAccount;
	}
	
	
}
