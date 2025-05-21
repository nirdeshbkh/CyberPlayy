package com.cyberplay.controller;

import com.cyberplay.model.usermodel;
import com.cyberplay.model.postmodel;
import com.cyberplay.service.PostService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet(asyncSupported = true, urlPatterns = {"/deletepost"})
public class DeletePostController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private PostService postService = new PostService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1) Check login
        HttpSession session = request.getSession(false);
        usermodel user = (session != null) 
            ? (usermodel) session.getAttribute("user") 
            : null;

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // 2) Only admins may delete
        //    Assumes usermodel has a getRole() returning e.g. "admin", or an isAdmin() helper.
        if (!"admin".equalsIgnoreCase(user.getRole())) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Only administrators can delete posts");
            return;
        }

        // 3) Parse post ID
        String idParam = request.getParameter("id");
        if (idParam == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing post ID");
            return;
        }

        int postId;
        try {
            postId = Integer.parseInt(idParam);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid post ID");
            return;
        }

        // 4) Ensure the post exists
        postmodel existing = postService.getPostById(postId);
        if (existing == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Post not found");
            return;
        }

        // 5) Delete
        boolean deleted = postService.deletePost(postId);
        if (deleted) {
            // Redirect back to the posts list (or wherever)
            response.sendRedirect(request.getContextPath() + "/admin" );
        } else {
            // On failure, show an error message
            request.setAttribute("errorMessage", "Failed to delete post. Please try again.");
            request.getRequestDispatcher("/pages/listposts.jsp")
                   .forward(request, response);
        }
    }
}

