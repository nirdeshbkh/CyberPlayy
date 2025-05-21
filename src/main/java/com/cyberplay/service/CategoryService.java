package com.cyberplay.service;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.cyberplay.config.Dbconfig;
import com.cyberplay.model.categorymodel;

public class CategoryService {
    private Connection dbConn;
    private boolean isConnectionError = false;

    public CategoryService() {
        try {
            dbConn = Dbconfig.getDbConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
            isConnectionError = true;
        }
    }

    // CREATE
    public boolean createCategory(categorymodel cat) {
        if (isConnectionError) return false;
        String sql = "INSERT INTO category (name) VALUES (?)";
        try (PreparedStatement stmt = dbConn.prepareStatement(sql)) {
            stmt.setString(1, cat.getName());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // READ (single)
    public categorymodel getCategoryById(int id) {
        if (isConnectionError) return null;
        String sql = "SELECT * FROM category WHERE id = ?";
        try (PreparedStatement stmt = dbConn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                categorymodel cat = new categorymodel();
                cat.setId(rs.getInt("id"));
                cat.setName(rs.getString("name"));
                return cat;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // READ (all)
    public List<categorymodel> getAllCategories() {
        if (isConnectionError) return null;
        List<categorymodel> list = new ArrayList<>();
        String sql = "SELECT * FROM category ORDER BY name";
        try (PreparedStatement stmt = dbConn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                categorymodel cat = new categorymodel();
                cat.setId(rs.getInt("id"));
                cat.setName(rs.getString("name"));
                list.add(cat);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // UPDATE
    public boolean updateCategory(categorymodel cat) {
        if (isConnectionError) return false;
        String sql = "UPDATE category SET name = ? WHERE id = ?";
        try (PreparedStatement stmt = dbConn.prepareStatement(sql)) {
            stmt.setString(1, cat.getName());
            stmt.setInt(2, cat.getId());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // DELETE
    public boolean deleteCategory(int id) {
        if (isConnectionError) return false;
        String sql = "DELETE FROM category WHERE id = ?";
        try (PreparedStatement stmt = dbConn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}

