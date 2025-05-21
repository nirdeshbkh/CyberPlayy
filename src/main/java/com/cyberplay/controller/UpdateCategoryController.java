// UpdateCategoryController.java
package com.cyberplay.controller;

import com.cyberplay.model.categorymodel;
import com.cyberplay.model.usermodel;
import com.cyberplay.service.CategoryService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet(asyncSupported = true, urlPatterns = {"/editcategory"})
public class UpdateCategoryController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // only admins may edit
        HttpSession session = request.getSession(false);
        usermodel user = (session != null) ? (usermodel) session.getAttribute("user") : null;
        if (user == null || !"admin".equalsIgnoreCase(user.getRole())) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String idParam = request.getParameter("id");
        if (idParam == null) {
            response.sendRedirect(request.getContextPath() + "/categories");
            return;
        }

        int id = Integer.parseInt(idParam);
        categorymodel cat = categoryService.getCategoryById(id);
        if (cat == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        request.setAttribute("category", cat);
        request.getRequestDispatcher("/pages/editcategory.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // admin check
        HttpSession session = request.getSession(false);
        usermodel user = (session != null) ? (usermodel) session.getAttribute("user") : null;
        if (user == null || !"admin".equalsIgnoreCase(user.getRole())) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }

        String idParam = request.getParameter("id");
        String name    = request.getParameter("name");
        int id = Integer.parseInt(idParam);

        categorymodel cat = new categorymodel();
        cat.setId(id);
        cat.setName(name);

        boolean updated = categoryService.updateCategory(cat);
        if (updated) {
            response.sendRedirect(request.getContextPath() + "/categories");
        } else {
            request.setAttribute("errorMessage", "Failed to update category");
            request.setAttribute("category", cat);
            request.getRequestDispatcher("/pages/editcategory.jsp")
                   .forward(request, response);
        }
    }
}

