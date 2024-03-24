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
@Table(name = "loan_account")
public class LoanAccount {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name = "accNo")
	private String accNo;
	
	@NotBlank(message = "Please choose one tenor option")
	@Column(name = "tenor")
	private String tenor;
	
	@NotNull(message = "Please fill in the amount of money you want to loan")
	@Column(name = "total_amount")
	private Integer totalAmount;
	
	@Column(name = "remain_amount")
	private Integer remainAmount;
	
	@Column(name = "open_date")
	private Date openDate;
	
	@Column(name = "close_date")
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
	@JoinColumn(name ="loan_user_id")
	private User user;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name ="loan_interest_id")
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
	
	public String getTenor() {
		return tenor;
	}

	public void setTenor(String tenor) {
		this.tenor = tenor;
	}

	public Integer getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(Integer totalAmount) {
		this.totalAmount = totalAmount;
	}

	public Integer getRemainAmount() {
		return remainAmount;
	}

	public void setRemainAmount(Integer remainAmount) {
		this.remainAmount = remainAmount;
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
		return "LoanAccount [id=" + id + ", accNo=" + accNo + ", tenor=" + tenor + ", totalAmount=" + totalAmount
				+ ", remainAmount=" + remainAmount + ", openDate=" + openDate + ", closeDate=" + closeDate
				+ ", description=" + description + ", pinCode=" + pinCode + ", status=" + status + ", user=" + user
				+ ", interestRate=" + interestRate + "]";
	}
}
