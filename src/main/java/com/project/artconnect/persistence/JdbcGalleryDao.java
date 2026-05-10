package com.project.artconnect.persistence;

import com.project.artconnect.dao.GalleryDao;
import com.project.artconnect.model.Gallery;
import com.project.artconnect.util.ConnectionManager;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class JdbcGalleryDao implements GalleryDao {
    @Override
    public List<Gallery> findAll() {
        List<Gallery> galleries = new ArrayList<>();
        String sql = "SELECT * FROM gallery";
        try (Connection conn = ConnectionManager.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Gallery g = new Gallery();
                g.setName(rs.getString("name"));
                g.setAddress(rs.getString("address"));
                g.setRating(rs.getDouble("rating"));
                galleries.add(g);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return galleries;
    }

    @Override
    public java.util.Optional<Gallery> findById(Long id) {
        String sql = "SELECT * FROM gallery WHERE id_gallery = ?";
        try (Connection conn = ConnectionManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setLong(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    Gallery g = new Gallery();
                    g.setName(rs.getString("name"));
                    g.setAddress(rs.getString("address"));
                    g.setRating(rs.getDouble("rating"));
                    return java.util.Optional.of(g);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return java.util.Optional.empty();
    }
}
