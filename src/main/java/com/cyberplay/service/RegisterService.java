package com.cyberplay.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.cyberplay.config.Dbconfig;
import com.cyberplay.model.usermodel;

/**
 * RegisterService handles the registration of new students. It manages database
 * interactions for student registration.
 */
public class RegisterService {

	private Connection dbConn;

	/**
	 * Constructor initializes the database connection.
	 */
	public RegisterService() {
		try {
			this.dbConn = Dbconfig.getDbConnection();
		} catch (SQLException | ClassNotFoundException ex) {
			System.err.println("Database connection error: " + ex.getMessage());
			ex.printStackTrace();
		}
	}

	/**
	 * Registers a new student in the database.
	 *
	 * @param studentModel the student details to be registered
	 * @return Boolean indicating the success of the operation
	 */
	public Boolean adduser(usermodel usermodel) {
		if (dbConn == null) {
			System.err.println("Database connection is not available.");
			return null;
		}

	
		String insertQuery = "INSERT INTO user ( UserName, UserEmail, UserPassword,First_Name, Last_Name) "
				+ "VALUES (?, ?, ?, ?, ?)";

	try {
				PreparedStatement insertStmt = dbConn.prepareStatement(insertQuery); 

			// Fetch program ID
		
			// Insert student details
			insertStmt.setString(1, usermodel.getUserName());
			insertStmt.setString(2, usermodel.getEmail());
			insertStmt.setString(3, usermodel.getPassword());
	
			insertStmt.setString(4, usermodel.getFirstName());
			
			insertStmt.setString(5, usermodel.getLastName());

	
			return insertStmt.executeUpdate() > 0;
	}
		  catch (SQLException e) {
			System.err.println("Error during user registration: " + e.getMessage());
			e.printStackTrace();
			return null;
		}
	}
}