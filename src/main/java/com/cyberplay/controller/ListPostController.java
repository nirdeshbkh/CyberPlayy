package com.cyberplay.controller;

import com.cyberplay.model.postmodel;
import com.cyberplay.model.categorymodel;
import com.cyberplay.service.PostService;
import com.cyberplay.service.CategoryService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet(asyncSupported = true, urlPatterns = {"/listpost"})
public class ListPostController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private PostService postService       = new PostService();
    private CategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 1) read the category parameter
    	System.out.println("failrue");
        String categoryParam = request.getParameter("category");
        if (categoryParam == null) {
            response.sendRedirect(request.getContextPath() + "/");
            return;
        }

        int categoryId;
        try {
            categoryId = Integer.parseInt(categoryParam);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid category");
            return;
        }

        // 2) fetch category details
        categorymodel category = categoryService.getCategoryById(categoryId);
        if (category == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Category not found");
            return;
        }

        // 3) fetch posts for that category
        List<postmodel> posts = postService.getPostsByCategory(categoryId);

        // 4) pass to JSP
        request.setAttribute("category", category);
        request.setAttribute("posts", posts);
        request.getRequestDispatcher("/pages/listpost.jsp")
               .forward(request, response);
       
    }
}
