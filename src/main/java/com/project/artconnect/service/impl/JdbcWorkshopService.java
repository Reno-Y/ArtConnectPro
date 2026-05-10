package com.project.artconnect.service.impl;

import com.project.artconnect.dao.WorkshopDao;
import com.project.artconnect.model.Workshop;
import com.project.artconnect.model.Booking;
import com.project.artconnect.model.CommunityMember;
import com.project.artconnect.persistence.JdbcWorkshopDao;
import com.project.artconnect.service.WorkshopService;
import java.util.List;
import java.util.Optional;

public class JdbcWorkshopService implements WorkshopService {
    private final WorkshopDao workshopDao = new JdbcWorkshopDao();

    @Override
    public List<Workshop> getAllWorkshops() {
        return workshopDao.findAll();
    }

    @Override
    public Optional<Workshop> getWorkshopByTitle(String title) {
        return workshopDao.findAll().stream()
            .filter(w -> w.getTitle().equals(title))
            .findFirst();
    }

    @Override
    public void bookWorkshop(Workshop workshop, CommunityMember member) {
        // TODO: Implement workshop booking via JDBC if needed
    }

    @Override
    public List<Booking> getBookingsByMember(CommunityMember member) {
        // TODO: Implement retrieval of bookings for a member
        return List.of();
    }
}
