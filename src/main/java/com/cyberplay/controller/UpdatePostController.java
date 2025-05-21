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
 * UpdatePostController handles displaying the edit form for a post (GET)
 * and processing the update (POST). Only administrators may update.
 */
@WebServlet(asyncSupported = true, urlPatterns = {"/editpost"})
public class UpdatePostController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private PostService postService       = new PostService();
    private CategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 1) verify login + admin
        HttpSession session = request.getSession(false);
        usermodel user = session != null
            ? (usermodel) session.getAttribute("user")
            : null;
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        if (!"admin".equalsIgnoreCase(user.getRole())) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Admin access required");
            return;
        }

        // 2) parse post ID
        String idParam = request.getParameter("id");
        if (idParam == null) {
            response.sendRedirect(request.getContextPath() + "/admin");
            return;
        }
        int postId;
        try {
            postId = Integer.parseInt(idParam);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid post ID");
            return;
        }

        // 3) fetch post and category list
        postmodel post = postService.getPostById(postId);
        if (post == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Post not found");
            return;
        }
        List<categorymodel> categories = categoryService.getAllCategories();

        // 4) expose to JSP
        request.setAttribute("post", post);
        request.setAttribute("categories", categories);
        // forward to edit form JSP
        request.getRequestDispatcher("/pages/EditPost.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 1) verify login + admin
        HttpSession session = request.getSession(false);
        usermodel user = session != null
            ? (usermodel) session.getAttribute("user")
            : null;
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        if (!"admin".equalsIgnoreCase(user.getRole())) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Admin access required");
            return;
        }

        // 2) read form parameters
        int postId = Integer.parseInt(request.getParameter("id"));
        String title   = request.getParameter("title");
        String content = request.getParameter("content");
        int category   = Integer.parseInt(request.getParameter("category"));

        // 3) retrieve existing to keep author username
        postmodel existing = postService.getPostById(postId);
        if (existing == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Post not found");
            return;
        }

        // 4) build updated model
        postmodel updated = new postmodel();
        updated.setId(postId);
        updated.setusername(existing.getusername());
        updated.setTitle(title);
        updated.setContent(content);
        updated.setCategory(category);

        // 5) perform update
        boolean success = postService.updatePost(updated);
        if (success) {
            response.sendRedirect(request.getContextPath() + "/admin");
            
        } else {
            // on failure, re-display form with error
            request.setAttribute("errorMessage", "Failed to update post");
            request.setAttribute("post", updated);
            request.setAttribute("categories", categoryService.getAllCategories());
            
            response.sendRedirect(request.getContextPath() + "/admin");
                  
        }
    }
}
