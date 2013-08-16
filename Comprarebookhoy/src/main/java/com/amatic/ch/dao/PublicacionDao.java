package com.amatic.ch.dao;

import java.util.List;

import com.amatic.ch.dto.Publicacion;

public interface PublicacionDao {

    public void crearPublicacion(Publicacion publicacion);

    public Publicacion getPublicacion(String titulo);

    public List<Publicacion> getUltimasPublicaciones();

    public List<Publicacion> getPublicaciones();

    public void update(Publicacion publicacion);

}
