package com.lti.finance.dto;

import java.time.LocalDate;
import java.util.Date;

public class RegisterData {
	private String firstname;
	private String lastname;
	private String username;
	private String DOB;
	private long phoneno;
	private String email;
	private String password;
	private String address;
	private String Bank;
	private long acno;
	private String ifsc;
	private LocalDate regdate;
	private String cardType;
	
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}

	
	public String getDOB() {
		return DOB;
	}
	public void setDOB(String dOB) {
		DOB = dOB;
	}
	public long getPhoneno() {
		return phoneno;
	}
	public void setPhoneno(long phoneno) {
		this.phoneno = phoneno;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getBank() {
		return Bank;
	}
	public void setBank(String bank) {
		Bank = bank;
	}
	
	
	public long getAcno() {
		return acno;
	}
	public void setAcno(long acno) {
		this.acno = acno;
	}
	public String getIfsc() {
		return ifsc;
	}
	public void setIfsc(String ifsc) {
		this.ifsc = ifsc;
	}
	public LocalDate getRegdate() {
		return regdate;
	}
	public void setRegdate(LocalDate regdate) {
		this.regdate = regdate;
	}
	public String getCardType() {
		return cardType;
	}
	public void setCardType(String cardType) {
		this.cardType = cardType;
	}

	
	

}
