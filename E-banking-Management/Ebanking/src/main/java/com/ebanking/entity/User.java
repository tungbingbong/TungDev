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
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "user")
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotEmpty(message = "Please enter username")	
	@Column(name = "username")
	private String username;

	@NotBlank(message = "Please enter password")	
	@Column(name = "password")
	private String password;
	
	@Column(name = "firstName")
	private String firstName;
	
	@Column(name = "lastName")
	private String lastName;
	
	@Column(name = "gender")
	private String gender;
	
	@Column(name = "dob")
	private Date dob;
	
	@NotEmpty(message = "Please enter email")
	@Email
	@Column(name = "email")
	private String email;
	
	@NotBlank(message = "Please enter phone number")
	@Column(name = "phone")
	private String phone;
	
	@Column(name = "nationality")
	private String nationality;
	
	@Column(name = "city")
	private String city;
	
	@Column(name = "address")
	private String address;
	
	@NotNull(message = "Please enter salary")
	@Column(name = "salary")
	private Long salary;

	//FK
	@ManyToMany(fetch = FetchType.LAZY, cascade=CascadeType.ALL)
	@JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"), 
								  inverseJoinColumns = @JoinColumn(name = "role_id"))
	private List<Role> roles = new ArrayList<>();
	
	@OneToOne(mappedBy="user")
	private CurrentAccount currentAccounts;
	
	@OneToMany(mappedBy="user")
	private List<SavingAccount> savingAccounts = new ArrayList<>();
	
	@OneToMany(mappedBy="user")
	private List<LoanAccount> loanAccounts = new ArrayList<>();
	
	@OneToMany(mappedBy="user")
	private List<Appointment> appointment = new ArrayList<>();
	
	@OneToMany(mappedBy="receiver")
	private List<Transaction> transaction = new ArrayList<>();
	

	public Long getId() {
		return id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getNationality() {
		return nationality;
	}

	public void setNationality(String nationality) {
		this.nationality = nationality;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Long getSalary() {
		return salary;
	}

	public void setSalary(Long salary) {
		this.salary = salary;
	}

	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

	public CurrentAccount getCurrentAccounts() {
		return currentAccounts;
	}

	public void setCurrentAccounts(CurrentAccount currentAccounts) {
		this.currentAccounts = currentAccounts;
	}

	public List<SavingAccount> getSavingAccounts() {
		return savingAccounts;
	}

	public void setSavingAccounts(List<SavingAccount> savingAccounts) {
		this.savingAccounts = savingAccounts;
	}

	public List<LoanAccount> getLoanAccounts() {
		return loanAccounts;
	}

	public void setLoanAccounts(List<LoanAccount> loanAccounts) {
		this.loanAccounts = loanAccounts;
	}

	public List<Appointment> getAppointment() {
		return appointment;
	}

	public void setAppointment(List<Appointment> appointment) {
		this.appointment = appointment;
	}

	public List<Transaction> getTransaction() {
		return transaction;
	}

	public void setTransaction(List<Transaction> transaction) {
		this.transaction = transaction;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", firstName=" + firstName
				+ ", lastName=" + lastName + ", gender=" + gender + ", dob=" + dob + ", email=" + email + ", phone="
				+ phone + ", nationality=" + nationality + ", city=" + city + ", address=" + address + ", salary="
				+ salary + ", roles=" + roles + ", currentAccounts=" + currentAccounts + ", savingAccounts="
				+ savingAccounts + ", loanAccounts=" + loanAccounts + ", appointment=" + appointment + ", transaction="
				+ transaction + "]";
	}
}
