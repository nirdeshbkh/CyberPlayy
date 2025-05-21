package com.cyberplay.controller;

import java.io.IOException;

import com.cyberplay.model.usermodel;
import com.cyberplay.service.LoginService;
import com.cyberplay.util.Cookieutil;
import com.cyberplay.util.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * LoginController is responsible for handling login requests. It interacts with
 * the LoginService to authenticate users.
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/login" })
public class logincontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private final LoginService LoginService;

	/**
	 * Constructor initializes the LoginService.
	 */
	public logincontroller() {
		this.LoginService = new LoginService();
	}

	/**
	 * Handles GET requests to the login page.
	 *
	 * @param request  HttpServletRequest object
	 * @param response HttpServletResponse object
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
	}

	/**
	 * Handles POST requests for user login.
	 *
	 * @param request  HttpServletRequest object
	 * @param response HttpServletResponse object
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");

		usermodel usermodel = new usermodel(username, password);
		Boolean loginStatus = LoginService.loginUser(usermodel);

		if (loginStatus != null && loginStatus) {
			SessionUtil.setAttribute(req, "username", username);
			SessionUtil.setAttribute(req, "user", usermodel);
			
			if (username.equals("admin")) {
				SessionUtil.setAttribute(req, "role", "admin");
				usermodel.setRole("admin");
				Cookieutil.addCookie(resp, "role", "admin", 5 * 30);
				resp.sendRedirect(req.getContextPath() + "/admin");
				System.out.println("Logged in as admin.");// Redirect to /home
			} else {
				Cookieutil.addCookie(resp, "role", "user", 5 * 30);
				resp.sendRedirect(req.getContextPath() + "/pages/home"); // Redirect to /home
				System.out.println("Logged in as user.");
			}
		} else {
			handleLoginFailure(req, resp, loginStatus);
		}
	}

	/**
	 * Handles login failures by setting attributes and forwarding to the login
	 * page.
	 *
	 * @param req         HttpServletRequest object
	 * @param resp        HttpServletResponse object
	 * @param loginStatus Boolean indicating the login status
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
	private void handleLoginFailure(HttpServletRequest req, HttpServletResponse resp, Boolean loginStatus)
			throws ServletException, IOException {
		String errorMessage = null;
		if (loginStatus == null) {
			errorMessage = "Login Status is null.";
		} if(loginStatus == false) {
			errorMessage = "User credential mismatch. Please try again!";
		}
		
		req.setAttribute("error", errorMessage);
		//req.getRequestDispatcher("/pages/login.jsp").forward(req, resp);
		req.getRequestDispatcher("/pages/login.jsp").forward(req, resp);
		System.out.println(errorMessage);
		System.out.println(loginStatus);
	}

}
