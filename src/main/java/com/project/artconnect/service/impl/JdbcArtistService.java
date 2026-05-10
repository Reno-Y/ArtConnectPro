package com.project.artconnect.service.impl;

import com.project.artconnect.dao.ArtistDao;
import com.project.artconnect.model.Artist;
import com.project.artconnect.model.Discipline;
import com.project.artconnect.persistence.JdbcArtistDao;
import com.project.artconnect.service.ArtistService;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

public class JdbcArtistService implements ArtistService {

    private final ArtistDao artistDao = new JdbcArtistDao();

    @Override
    public List<Artist> getAllArtists() {
        return artistDao.findAll();
    }

    @Override
    public Optional<Artist> getArtistByName(String name) {
        return artistDao.findAll().stream().filter(a -> a.getName().equals(name)).findFirst();
    }

    @Override
    public void createArtist(Artist artist) {
        artistDao.save(artist);
    }

    @Override
    public void updateArtist(Artist artist) {
        artistDao.update(artist);
    }

    @Override
    public void deleteArtist(String name) {
        artistDao.delete(name);
    }

    @Override
    public List<Discipline> getAllDisciplines() {
        // Mock ou refactorisation requise pour stocker les disciplines en BDD
        return Collections.emptyList();
    }

    @Override
    public List<Artist> searchArtists(String query, String disciplineName, String city) {
        if (city != null && !city.isEmpty()) {
            return artistDao.findByCity(city);
        }
        return artistDao.findAll();
    }
}

