package com.amatic.ch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amatic.ch.dao.PublicacionDao;
import com.amatic.ch.dto.Contacto;
import com.amatic.ch.dto.Email;
import com.amatic.ch.dto.Publicacion;

@Service
public class PublicacionService {

    @Autowired
    private PublicacionDao PublicacionDao;

    public void crearPublicacion(Publicacion publicacion) {
	this.PublicacionDao.crearPublicacion(publicacion);
    }

    public Publicacion getPublicacion(String key, String tipo) {
	return this.PublicacionDao.getPublicacion(key, tipo);
    }

    public List<Publicacion> getUltimasPublicaciones(String tipo) {
	return this.PublicacionDao.getUltimasPublicaciones(tipo);
    }

    public List<Publicacion> getPublicaciones(String tipo) {
	return this.PublicacionDao.getPublicaciones(tipo);
    }

    public void update(Publicacion publicacion) {
	this.PublicacionDao.update(publicacion);
    }

    public void saveEmail(Email email) {
	this.PublicacionDao.saveEmail(email);
    }

    public void saveContacto(Contacto contacto) {
	this.PublicacionDao.saveContacto(contacto);
    }

    public List<Publicacion> getPublicacionesMasVistas(String tipo) {
	return this.PublicacionDao.getPublicacionesMasVistas(tipo);
    }

}
