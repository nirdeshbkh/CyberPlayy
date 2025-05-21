// AddCategoryController.java
package com.cyberplay.controller;

import com.cyberplay.model.categorymodel;
import com.cyberplay.model.usermodel;
import com.cyberplay.service.CategoryService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet(asyncSupported = true, urlPatterns = {"/addcategory"})
public class AddCategoryController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // only admins may add
        HttpSession session = request.getSession(false);
        usermodel user = (session != null) ? (usermodel) session.getAttribute("user") : null;
        if (user == null || !"admin".equalsIgnoreCase(user.getRole())) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // show form
        request.getRequestDispatcher("/pages/addcategory.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // admin check again
        HttpSession session = request.getSession(false);
        usermodel user = (session != null) ? (usermodel) session.getAttribute("user") : null;
        if (user == null || !"admin".equalsIgnoreCase(user.getRole())) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }

        // read name
        String name = request.getParameter("name");
        categorymodel cat = new categorymodel();
        cat.setName(name);

        boolean created = categoryService.createCategory(cat);
        if (created) {
            response.sendRedirect(request.getContextPath() + "/categories");
        } else {
            request.setAttribute("errorMessage", "Unable to create category");
            request.getRequestDispatcher("/pages/addcategory.jsp")
                   .forward(request, response);
        }
    }
}

