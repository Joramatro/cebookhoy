package com.amatic.ch.dao;

import java.util.List;

import com.amatic.ch.dto.Contacto;
import com.amatic.ch.dto.Email;
import com.amatic.ch.dto.Publicacion;

public interface PublicacionDao {

    public void crearPublicacion(Publicacion publicacion);

    public Publicacion getPublicacion(String key, String tipo);

    public List<Publicacion> getUltimasPublicaciones(String tipo);

    public List<Publicacion> getPublicaciones(String tipo);

    public void update(Publicacion publicacion);

    public void saveEmail(Email email);

    void saveContacto(Contacto contacto);

    public List<Publicacion> getPublicacionesMasVistas(String tipo);

}
