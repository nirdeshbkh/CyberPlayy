package com.cyberplay.model;

import java.time.LocalDate;

public class usermodel {

	private int id;
	private String firstName;
	private String lastName;
	private String username;
	private String email;
	private String password;
	private String role;
	//private String confirmPassword;
	

	public usermodel() {
	}

	public usermodel(String username, String pasword) {
		this.username = username;
		this.password = pasword;
	}

	public usermodel(int id, String firstName, String lastName, String username, 
			String email, String password) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.username = username;
		
		this.email = email;
		
		this.password = password;
		
	}

	public usermodel(String firstName, String lastName, String username, String email,
			 String password) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.username = username;
		
		this.email = email;
	
		this.password = password;
		
	}

	public usermodel(int id, String firstName, String lastName,  String email, String username) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.username = username;
	}
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getUserName() {
		return username;
	}

	public void setUserName(String username) {
		this.username = username;
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
	public String getRole() {
	    return role;
	}

	public void setRole(String role) {
	    this.role = role;
	}



	

}