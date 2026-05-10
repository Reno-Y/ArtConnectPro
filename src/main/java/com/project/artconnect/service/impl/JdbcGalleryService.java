package com.project.artconnect.service.impl;

import com.project.artconnect.dao.GalleryDao;
import com.project.artconnect.model.Gallery;
import com.project.artconnect.model.Exhibition;
import com.project.artconnect.persistence.JdbcGalleryDao;
import com.project.artconnect.service.GalleryService;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

public class JdbcGalleryService implements GalleryService {
    private final GalleryDao galleryDao = new JdbcGalleryDao();

    @Override
    public List<Gallery> getAllGalleries() {
        return galleryDao.findAll();
    }

    @Override
    public Optional<Gallery> getGalleryByName(String name) {
        return galleryDao.findAll().stream().filter(g -> g.getName().equals(name)).findFirst();
    }

    @Override
    public List<Exhibition> getExhibitionsByGallery(Gallery gallery) {
        List<Exhibition> exhibitions = new java.util.ArrayList<>();
        String sql = "SELECT e.*, g.name AS gallery_name FROM exhibition e JOIN gallery g ON e.id_gallery = g.id_gallery WHERE g.name = ?";
        try (java.sql.Connection conn = com.project.artconnect.util.ConnectionManager.getConnection();
             java.sql.PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, gallery.getName());
            try (java.sql.ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Exhibition evt = new Exhibition(
                        rs.getString("title"),
                        rs.getDate("start_date").toLocalDate(),
                        rs.getDate("end_date").toLocalDate(),
                        gallery
                    );
                    evt.setDescription(rs.getString("description"));
                    evt.setCuratorName(rs.getString("curator_name"));
                    evt.setTheme(rs.getString("theme"));
                    exhibitions.add(evt);
                }
            }
        } catch (java.sql.SQLException e) {
            e.printStackTrace();
        }
        return exhibitions;
    }
}
