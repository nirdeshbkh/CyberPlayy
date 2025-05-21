package com.cyberplay.service;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.cyberplay.config.Dbconfig;
import com.cyberplay.model.postmodel;

public class PostService {

    private Connection dbConn;
    private boolean isConnectionError = false;

    public PostService() {
        try {
            dbConn = Dbconfig.getDbConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
            isConnectionError = true;
        }
    }

    public List<postmodel> getPostsByCategory(int category) {
    if (isConnectionError) return null;
    List<postmodel> posts = new ArrayList<>();
    String sql = "SELECT * FROM post WHERE category = ? ORDER BY id DESC";
    try (PreparedStatement stmt = dbConn.prepareStatement(sql)) {
        stmt.setInt(1, category);
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            postmodel post = new postmodel();
            post.setId(rs.getInt("id"));
            post.setusername(rs.getString("username"));
            post.setCategory(rs.getInt("category"));
            post.setTitle(rs.getString("title"));
            post.setContent(rs.getString("content"));
            posts.add(post);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return posts;
  }


    public boolean createPost(postmodel post) {
        if (isConnectionError) return false;

        String sql = "INSERT INTO post (username, category, title, content) VALUES (?, ?, ?, ?)";
        try (PreparedStatement stmt = dbConn.prepareStatement(sql)) {
            stmt.setString(1, post.getusername());
            stmt.setInt(2, post.getCategory());
            stmt.setString(3, post.getTitle());
            stmt.setString(4, post.getContent());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public postmodel getPostById(int id) {
        if (isConnectionError) return null;

        String sql = "SELECT * FROM post WHERE id = ?";
        try (PreparedStatement stmt = dbConn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                postmodel post = new postmodel();
                post.setId(rs.getInt("id"));
                post.setusername(rs.getString("username"));
                post.setCategory(rs.getInt("category"));
                post.setTitle(rs.getString("title"));
                post.setContent(rs.getString("content"));
                return post;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<postmodel> getAllPosts() {
        if (isConnectionError) return null;

        List<postmodel> posts = new ArrayList<>();
        String sql = "SELECT * FROM post ORDER BY id DESC";
        try (PreparedStatement stmt = dbConn.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                postmodel post = new postmodel();
                post.setId(rs.getInt("id"));
                post.setusername(rs.getString("username"));
                post.setCategory(rs.getInt("category"));
                post.setTitle(rs.getString("title"));
                post.setContent(rs.getString("content"));
                posts.add(post);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return posts;
    }

    public boolean updatePost(postmodel post) {
        if (isConnectionError) return false;

        String sql = "UPDATE post SET username = ?, category = ?, title = ?, content = ? WHERE id = ?";
        try (PreparedStatement stmt = dbConn.prepareStatement(sql)) {
            stmt.setString(1, post.getusername());
            stmt.setInt(2, post.getCategory());
            stmt.setString(3, post.getTitle());
            stmt.setString(4, post.getContent());
            stmt.setInt(5, post.getId());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deletePost(int id) {
        if (isConnectionError) return false;

        String sql = "DELETE FROM post WHERE id = ?";
        try (PreparedStatement stmt = dbConn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}


