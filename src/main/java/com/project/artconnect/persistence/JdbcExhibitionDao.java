package com.project.artconnect.persistence;

import com.project.artconnect.dao.ExhibitionDao;
import com.project.artconnect.model.Exhibition;
import com.project.artconnect.util.ConnectionManager;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class JdbcExhibitionDao implements ExhibitionDao {
    @Override
    public List<Exhibition> findAll() {
        List<Exhibition> exhibitions = new ArrayList<>();
        String sql = "SELECT * FROM exhibition";
        try (Connection conn = ConnectionManager.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                exhibitions.add(mapRowToExhibition(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return exhibitions;
    }

    private Exhibition mapRowToExhibition(ResultSet rs) throws SQLException {
        Exhibition evt = new Exhibition();
        evt.setTitle(rs.getString("title"));
        evt.setStartDate(rs.getDate("start_date").toLocalDate());
        evt.setEndDate(rs.getDate("end_date").toLocalDate());
        evt.setDescription(rs.getString("description"));
        evt.setCuratorName(rs.getString("curator_name"));
        evt.setTheme(rs.getString("theme"));
        return evt;
    }

    @Override
    public void save(Exhibition exhibition) {}

    @Override
    public void update(Exhibition exhibition) {}

    @Override
    public void delete(String title) {}
}
