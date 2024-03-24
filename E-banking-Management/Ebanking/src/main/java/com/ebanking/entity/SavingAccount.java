package com.ebanking.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;

@Entity
@Table(name = "saving_account")
public class SavingAccount {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name = "accNo")
	private String accNo;
	
	@NotNull(message = "Please enter amount of money you want to save")
	@Column(name = "initialAmount")
	private Integer initialAmount;
	
	@NotBlank(message = "Please enter the tenor")
	@Column(name = "tenor")
	private String tenor;
	
	@Column(name = "openDate")
	private Date openDate;
	
	@Column(name = "closeDate")
	private Date closeDate;
	
	@Column(name = "description")
	private String description;
	
	@NotBlank(message = "Please enter the pincode")
	@Column(name = "pincode")
	private String pinCode;
	
	@Column(name = "status")
	private Integer status;

	//FK
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name ="saving_user_id")
	private User user;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name ="saving_interest_id")
	private InterestRate interestRate;
	

	public Long getId() {
		return id;
	}

	public String getAccNo() {
		return accNo;
	}


	public void setAccNo(String accNo) {
		this.accNo = accNo;
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
	
	public Integer getInitialAmount() {
		return initialAmount;
	}

	public void setInitialAmount(Integer initialAmount) {
		this.initialAmount = initialAmount;
	}

	public String getTenor() {
		return tenor;
	}

	public void setTenor(String tenor) {
		this.tenor = tenor;
	}

	public Date getOpenDate() {
		return openDate;
	}

	public void setOpenDate(Date openDate) {
		this.openDate = openDate;
	}

	public Date getCloseDate() {
		return closeDate;
	}

	public void setCloseDate(Date closeDate) {
		this.closeDate = closeDate;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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

	@Override
	public String toString() {
		return "SavingAccount [id=" + id + ", accNo=" + accNo + ", initialAmount=" + initialAmount + ", tenor=" + tenor
				+ ", openDate=" + openDate + ", closeDate=" + closeDate + ", description=" + description + ", pinCode="
				+ pinCode + ", status=" + status + ", user=" + user + ", interestRate=" + interestRate + "]";
	}	
}
