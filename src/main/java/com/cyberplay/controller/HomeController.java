package com.cyberplay.controller;

import com.cyberplay.model.categorymodel;
import com.cyberplay.service.CategoryService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * HomeController now fetches and exposes all categories to the index view.
 */
@WebServlet(asyncSupported = true, urlPatterns = {"/home", "/"})
public class HomeController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private CategoryService categoryService = new CategoryService();
    List<categorymodel> allCats = categoryService.getAllCategories();
   

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // fetch all categories
    	
        List<categorymodel> categories = categoryService.getAllCategories();
        // make them available to the JSP
        request.setAttribute("categories", categories);

        // forward to the home/index view
        request.getRequestDispatcher("/pages/index.jsp")
               .forward(request, response);
    }
}
