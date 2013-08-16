package com.amatic.ch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amatic.ch.dao.PublicacionDao;
import com.amatic.ch.dto.Publicacion;

@Service
public class PublicacionService {

    @Autowired
    private PublicacionDao PublicacionDao;

    public void crearPublicacion(Publicacion publicacion) {
	this.PublicacionDao.crearPublicacion(publicacion);
    }

    public Publicacion getPublicacion(String titulo) {
	return this.PublicacionDao.getPublicacion(titulo);
    }

    public List<Publicacion> getUltimasPublicaciones() {
	return this.PublicacionDao.getUltimasPublicaciones();
    }

    public List<Publicacion> getPublicaciones() {
	return this.PublicacionDao.getPublicaciones();
    }

    public void update(Publicacion publicacion) {
	this.PublicacionDao.update(publicacion);
    }

}
