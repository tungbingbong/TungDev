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

@Entity
@Table(name = "transaction")
public class Transaction {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "type")
	private String type;

	@NotNull(message = "Please enter specific amount")
	@Column(name = "amount")
	private Integer amount;

	@Column(name = "date")
	private Date date;

	@Column(name = "description")
	private String description;
	
	@Column(name = "status")
	private Integer status;

	//FK
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "current_id")
	private CurrentAccount currentAccount;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name ="receiver_id")
	private User receiver;

	public Long getId() {
		return id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}
	
	public CurrentAccount getCurrentAccount() {
		return currentAccount;
	}

	public void setCurrentAccount(CurrentAccount currentAccount) {
		this.currentAccount = currentAccount;
	}

	public User getReceiver() {
		return receiver;
	}

	public void setReceiver(User receiver) {
		this.receiver = receiver;
	}

	@Override
	public String toString() {
		return "Transaction [id=" + id + ", type=" + type + ", amount=" + amount + ", date="
				+ date + ", description=" + description + ", status=" + status + ", currentAccount=" + currentAccount
				+ ", receiver=" + receiver + "]";
	}
}
