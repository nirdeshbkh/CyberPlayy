// DeleteCategoryController.java
package com.cyberplay.controller;

import com.cyberplay.model.usermodel;
import com.cyberplay.service.CategoryService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet(asyncSupported = true, urlPatterns = {"/deletecategory"})
public class DeleteCategoryController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CategoryService categoryService = new CategoryService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // only admins may delete
        HttpSession session = request.getSession(false);
        usermodel user = (session != null) ? (usermodel) session.getAttribute("user") : null;
        if (user == null || !"admin".equalsIgnoreCase(user.getRole())) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }

        String idParam = request.getParameter("id");
        if (idParam == null) {
            response.sendRedirect(request.getContextPath() + "/categories");
            return;
        }

        int id = Integer.parseInt(idParam);
        boolean deleted = categoryService.deleteCategory(id);
        if (deleted) {
            response.sendRedirect(request.getContextPath() + "/categories");
        } else {
            request.setAttribute("errorMessage", "Failed to delete category");
            request.getRequestDispatcher("/pages/listcategories.jsp")
                   .forward(request, response);
        }
    }
}

