package com.cyberplay.controller;

import com.cyberplay.model.categorymodel;
import com.cyberplay.model.postmodel;
import com.cyberplay.model.usermodel;
import com.cyberplay.service.CategoryService;
import com.cyberplay.service.PostService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

/**
 * AdminHomeController loads data for the admin dashboard:
 *  - all categories
 *  - all posts
 *  
 *  Only users with role "admin" may access.
 */
@WebServlet(asyncSupported = true, urlPatterns = {"/admin", "/admin/home"})
public class AdminHomeController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CategoryService categoryService = new CategoryService();
    private PostService postService         = new PostService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1) Verify login & admin role
        HttpSession session = request.getSession(false);
        usermodel user = (session != null)
            ? (usermodel) session.getAttribute("user")
            : null;
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        if (!"admin".equalsIgnoreCase((String) session.getAttribute("role"))) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, 
                "Administrator access required");
            return;
        }

        // 2) Fetch all categories & posts
        List<categorymodel> categories = categoryService.getAllCategories();
        List<postmodel>     posts      = postService.getAllPosts();

        // 3) Expose to JSP
        request.setAttribute("categories", categories);
        request.setAttribute("posts", posts);

        // 4) Forward to admin dashboard view
        request.getRequestDispatcher("/pages/adminpanel.jsp")
               .forward(request, response);
    }
}