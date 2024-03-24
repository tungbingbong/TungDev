package com.ebanking.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotBlank;

@Entity
@Table(name = "current_account")
public class CurrentAccount {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name = "acc_no")
	private String accNo;
	
	@Column(name = "card_no")
	private String cardNo;
	
	@Column(name = "balance")
	private Integer balance;
	
	@Column(name = "open_date")
	private Date openDate;
	
	@NotBlank(message="Please fill in the new PINCODE")
	@Column(name = "pincode")
	private String pinCode;
	
	@Column(name = "status")
	private Integer status;
	
	//FK
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name ="current_user_id")
	private User user;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name ="current_interest_id")
	private InterestRate interestRate;
	
	@OneToMany(mappedBy="currentAccount")
	private List<Transaction> transactions = new ArrayList<>();

	public Long getId() {
		return id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public InterestRate getInterestRate() {
		return interestRate;
	}

	public void setInterestRate(InterestRate interestRate) {
		this.interestRate = interestRate;
	}

	public String getAccNo() {
		return accNo;
	}

	public void setAccNo(String accNo) {
		this.accNo = accNo;
	}

	public String getCardNo() {
		return cardNo;
	}

	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}

	public Integer getBalance() {
		return balance;
	}

	public void setBalance(Integer balance) {
		this.balance = balance;
	}

	public Date getOpenDate() {
		return openDate;
	}

	public void setOpenDate(Date openDate) {
		this.openDate = openDate;
	}
	
	public String getPinCode() {
		return pinCode;
	}

	public void setPinCode(String pinCode) {
		this.pinCode = pinCode;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public List<Transaction> getTransactions() {
		return transactions;
	}

	public void setTransactions(List<Transaction> transactions) {
		this.transactions = transactions;
	}

	@Override
	public String toString() {
		return "CurrentAccount [id=" + id + ", accNo=" + accNo + ", cardNo=" + cardNo + ", balance=" + balance
				+ ", openDate=" + openDate + ", pinCode=" + pinCode + ", status=" + status + ", user=" + user
				+ ", interestRate=" + interestRate + ", transactions=" + transactions + "]";
	}
}
