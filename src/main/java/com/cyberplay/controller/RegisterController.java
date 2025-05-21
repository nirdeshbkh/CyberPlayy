package com.cyberplay.controller;

import java.io.IOException;
import java.time.LocalDate;

import com.cyberplay.model.usermodel;
import com.cyberplay.service.RegisterService;
import com.cyberplay.util.PasswordUtil;
import com.cyberplay.util.ValidationUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

/**
 * RegisterController handles user registration requests and processes form
 * submissions. It also manages file uploads and account creation.
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/register" })

public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private final RegisterService registerService = new RegisterService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/pages/signup.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			// Validate and extract student model
			String validationMessage = validateRegistrationForm(req);
			if (validationMessage != null) {
				System.out.println(validationMessage);
				handleError(req, resp, validationMessage);
				return;
			}

			usermodel usermodel = extractusermodel(req);
			Boolean isAdded = registerService.adduser(usermodel);

			if (isAdded == null) {
				handleError(req, resp, "Our server is under maintenance. Please try again later!");
			} else if (isAdded) {
				handleSuccess(req, resp, "Your account is successfully created!", "/WEB-INF/pages/login.jsp");

			} else {
				handleError(req, resp, "Could not register your account. Please try again later!");
			}
		} catch (Exception e) {
			handleError(req, resp, "An unexpected error occurred. Please try again later!");
			e.printStackTrace(); // Log the exception
		}
	}

	private String validateRegistrationForm(HttpServletRequest req) {
		String firstName = req.getParameter("firstName");
		String lastName = req.getParameter("lastName");
		String username = req.getParameter("username");

		String email = req.getParameter("email");

		String password = req.getParameter("password");
		String confirmPassword = req.getParameter("confirmPassword");

		// Check for null or empty fields first
		if (ValidationUtil.isNullOrEmpty(firstName))
			return "First name is required.";
		if (ValidationUtil.isNullOrEmpty(lastName))
			return "Last name is required.";
		if (ValidationUtil.isNullOrEmpty(username))
			return "Username is required.";

		if (ValidationUtil.isNullOrEmpty(email))
			return "Email is required.";

		if (ValidationUtil.isNullOrEmpty(password))
			return "Password is required.";
		if (ValidationUtil.isNullOrEmpty(confirmPassword))
			return "Please retype the password.";

		// Validate fields
		if (!ValidationUtil.isAlphanumericStartingWithLetter(username))
			return "Username must start with a letter and contain only letters and numbers.";

		if (!ValidationUtil.isValidEmail(email))
			return "Invalid email format.";

		if (!ValidationUtil.isValidPassword(password))
			return "Password must be at least 8 characters long, with 1 uppercase letter, 1 number, and 1 symbol.";
		if (!ValidationUtil.doPasswordsMatch(password, confirmPassword))
			return "Passwords do not match.";

		// Check if the date of birth is at least 16 years before today
		
		
		System.out.println(firstName);
		System.out.println(lastName);
		System.out.println(username);
		System.out.println(email);
		System.out.println(password);

		return null; // All validations passed
	}

	private usermodel extractusermodel(HttpServletRequest req) throws Exception {
		String firstName = req.getParameter("firstName");
		String lastName = req.getParameter("lastName");
		String username = req.getParameter("username");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		//String confirmPassword = req.getParameter("confirmPassword");

		// Assuming password validation is already done in validateRegistrationForm
		password = PasswordUtil.encrypt(username, password);

		return new usermodel(firstName, lastName, username, email, password);
	}

	private void handleSuccess(HttpServletRequest req, HttpServletResponse resp, String message, String redirectPage)
			throws ServletException, IOException {
		req.setAttribute("success", message);
		req.getRequestDispatcher("/pages/login.jsp").forward(req, resp);
	}

	private void handleError(HttpServletRequest req, HttpServletResponse resp, String message)
			throws ServletException, IOException {
		req.setAttribute("error", message);
		req.setAttribute("firstName", req.getParameter("firstName"));
		req.setAttribute("lastName", req.getParameter("lastName"));
		req.setAttribute("username", req.getParameter("username"));

		req.setAttribute("email", req.getParameter("email"));
		req.setAttribute("confirmPassword", req.getParameter("confirmPassword"));
		req.getRequestDispatcher("/pages/signup.jsp").forward(req, resp);

	}
}