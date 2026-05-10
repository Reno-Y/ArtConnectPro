package com.project.artconnect.persistence;

import com.project.artconnect.dao.WorkshopDao;
import com.project.artconnect.model.Workshop;
import com.project.artconnect.util.ConnectionManager;
import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class JdbcWorkshopDao implements WorkshopDao {
    @Override
    public java.util.Optional<Workshop> findById(Long id) {
        String sql = "SELECT * FROM workshop WHERE id_workshop = ?";
        try (Connection conn = ConnectionManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setLong(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return java.util.Optional.of(mapRowToWorkshop(rs));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return java.util.Optional.empty();
    }

    @Override
    public List<Workshop> findAll() {
        List<Workshop> workshops = new ArrayList<>();
        String sql = "SELECT * FROM workshop";
        try (Connection conn = ConnectionManager.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                workshops.add(mapRowToWorkshop(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return workshops;
    }

    private Workshop mapRowToWorkshop(ResultSet rs) throws SQLException {
        Workshop w = new Workshop();
        w.setTitle(rs.getString("title"));
        w.setDate(rs.getTimestamp("date") != null ? rs.getTimestamp("date").toLocalDateTime() : LocalDateTime.now());
        w.setDurationMinutes(rs.getInt("duration_minutes"));
        w.setMaxParticipants(rs.getInt("max_participants"));
        w.setPrice(rs.getDouble("price"));
        w.setLocation(rs.getString("location"));
        w.setDescription(rs.getString("description"));
        w.setLevel(rs.getString("level"));
        return w;
    }
}
