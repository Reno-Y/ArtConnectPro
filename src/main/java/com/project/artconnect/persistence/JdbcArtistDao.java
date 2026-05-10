package com.project.artconnect.persistence;

import com.project.artconnect.dao.ArtistDao;
import com.project.artconnect.model.Artist;
import com.project.artconnect.util.ConnectionManager;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * JDBC implementation for ArtistDao.
 */
public class JdbcArtistDao implements ArtistDao {

    @Override
    public List<Artist> findAll() {
        List<Artist> artists = new ArrayList<>();
        String sql = "SELECT * FROM artist";
        try (Connection conn = ConnectionManager.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                artists.add(mapRowToArtist(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return artists;
    }

    @Override
    public void save(Artist artist) {
        String sql = "INSERT INTO artist (name, bio, birth_year, contact_email, city, is_active) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = ConnectionManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, artist.getName());
            pstmt.setString(2, artist.getBio());
            pstmt.setObject(3, artist.getBirthYear());
            pstmt.setString(4, artist.getContactEmail());
            pstmt.setString(5, artist.getCity());
            pstmt.setBoolean(6, artist.isActive());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(Artist artist) {
        String sql = "UPDATE artist SET bio = ?, birth_year = ?, contact_email = ?, city = ?, is_active = ? WHERE name = ?";
        try (Connection conn = ConnectionManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, artist.getBio());
            pstmt.setObject(2, artist.getBirthYear());
            pstmt.setString(3, artist.getContactEmail());
            pstmt.setString(4, artist.getCity());
            pstmt.setBoolean(5, artist.isActive());
            pstmt.setString(6, artist.getName());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(String artistName) {
        String sql = "DELETE FROM artist WHERE name = ?";
        try (Connection conn = ConnectionManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, artistName);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Artist> findByCity(String city) {
        List<Artist> artists = new ArrayList<>();
        String sql = "SELECT * FROM artist WHERE city = ?";
        try (Connection conn = ConnectionManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, city);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    artists.add(mapRowToArtist(rs));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return artists;
    }

    private Artist mapRowToArtist(ResultSet rs) throws SQLException {
        Artist artist = new Artist();
        artist.setName(rs.getString("name"));
        artist.setBio(rs.getString("bio"));
        artist.setBirthYear((Integer) rs.getObject("birth_year"));
        artist.setContactEmail(rs.getString("contact_email"));
        artist.setCity(rs.getString("city"));
        artist.setActive(rs.getBoolean("is_active"));
        return artist;
    }
}
