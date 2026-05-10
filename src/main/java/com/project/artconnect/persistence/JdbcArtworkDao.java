package com.project.artconnect.persistence;

import com.project.artconnect.dao.ArtworkDao;
import com.project.artconnect.model.Artwork;
import com.project.artconnect.util.ConnectionManager;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * JDBC implementation for ArtworkDao.
 */
public class JdbcArtworkDao implements ArtworkDao {

    @Override
    public List<Artwork> findAll() {
        List<Artwork> artworks = new ArrayList<>();
        String sql = "SELECT * FROM artwork";
        try (Connection conn = ConnectionManager.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                artworks.add(mapRowToArtwork(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return artworks;
    }

    @Override
    public void save(Artwork artwork) {
        String sql = "INSERT INTO artwork (title, creation_year, type, price, artist_name, status) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = ConnectionManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, artwork.getTitle());
            pstmt.setObject(2, artwork.getCreationYear());
            pstmt.setString(3, artwork.getType());
            pstmt.setDouble(4, artwork.getPrice());
            pstmt.setString(5, artwork.getArtist() != null ? artwork.getArtist().getName() : null);
            pstmt.setString(6, artwork.getStatus() != null ? artwork.getStatus().name() : Artwork.Status.FOR_SALE.name());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(Artwork artwork) {
        String sql = "UPDATE artwork SET creation_year = ?, type = ?, price = ?, artist_name = ?, status = ? WHERE title = ?";
        try (Connection conn = ConnectionManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setObject(1, artwork.getCreationYear());
            pstmt.setString(2, artwork.getType());
            pstmt.setDouble(3, artwork.getPrice());
            pstmt.setString(4, artwork.getArtist() != null ? artwork.getArtist().getName() : null);
            pstmt.setString(5, artwork.getStatus() != null ? artwork.getStatus().name() : Artwork.Status.FOR_SALE.name());
            pstmt.setString(6, artwork.getTitle());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(String title) {
        String sql = "DELETE FROM artwork WHERE title = ?";
        try (Connection conn = ConnectionManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, title);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Artwork> findByArtistName(String artistName) {
        List<Artwork> artworks = new ArrayList<>();
        // Jointure pour rechercher par le nom de l'artiste
        String sql = "SELECT a.*, ar.name AS artist_name FROM artwork a JOIN artist ar ON a.id_artist = ar.id_artist WHERE ar.name = ?";
        try (Connection conn = ConnectionManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, artistName);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    artworks.add(mapRowToArtwork(rs));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return artworks;
    }

    private Artwork mapRowToArtwork(ResultSet rs) throws SQLException {
        Artwork artwork = new Artwork();
        artwork.setTitle(rs.getString("title"));
        artwork.setCreationYear((Integer) rs.getObject("creation_year"));
        artwork.setType(rs.getString("type"));
        artwork.setPrice(rs.getDouble("price"));
        String statusStr = rs.getString("status");
        if (statusStr != null) {
            try {
                artwork.setStatus(Artwork.Status.valueOf(statusStr));
            } catch (IllegalArgumentException e) {
                artwork.setStatus(Artwork.Status.FOR_SALE);
            }
        }

        // Mapping basic info (medium, dimensions, description) si utilisé
        try { artwork.setMedium(rs.getString("medium")); } catch(SQLException ignored) {}
        try { artwork.setDimensions(rs.getString("dimensions")); } catch(SQLException ignored) {}
        try { artwork.setDescription(rs.getString("description")); } catch(SQLException ignored) {}

        return artwork;
    }
}
