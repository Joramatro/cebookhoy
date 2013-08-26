package com.amatic.ch.dao.impl;

import static com.googlecode.objectify.ObjectifyService.ofy;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.amatic.ch.dao.PublicacionDao;
import com.amatic.ch.dto.Contacto;
import com.amatic.ch.dto.Email;
import com.amatic.ch.dto.Publicacion;

@Repository
public class PublicacionDaoImpl implements PublicacionDao {

    @Override
    public void crearPublicacion(Publicacion publicacion) {
	publicacion.setFechaCreacion(new Date());
	ofy().save().entity(publicacion).now();
    }

    @Override
    public Publicacion getPublicacion(String titulo, String tipo) {

	Publicacion publicacion = ofy().load().type(Publicacion.class)
		.filter("titulo", titulo).filter("tipo", tipo).first().get();

	return publicacion;
    }

    @Override
    public List<Publicacion> getUltimasPublicaciones(String tipo) {

	List<Publicacion> ultimasPublicaciones = ofy().load()
		.type(Publicacion.class).filter("tipo", tipo)
		.order("-fechaCreacion").list();

	if (ultimasPublicaciones.size() > 10) {
	    ultimasPublicaciones = ultimasPublicaciones.subList(0, 10);
	}

	return ultimasPublicaciones;
    }

    @Override
    public List<Publicacion> getPublicaciones(String tipo) {

	List<Publicacion> publicaciones = ofy().load().type(Publicacion.class)
		.filter("tipo", tipo).order("-fechaCreacion").list();

	return publicaciones;
    }

    @Override
    public List<Publicacion> getPublicacionesMasVistas(String tipo) {

	List<Publicacion> publicaciones = ofy().load().type(Publicacion.class)
		.filter("tipo", tipo).order("-numVisitas").list();

	return publicaciones;
    }

    @Override
    public void update(Publicacion publicacion) {
	Publicacion publicacionUpd = ofy().load().type(Publicacion.class)
		.id(publicacion.getId()).safeGet();

	copiarPublicacion(publicacionUpd, publicacion);

	ofy().save().entity(publicacionUpd);

    }

    public void copiarPublicacion(Publicacion updatePublicacion,
	    Publicacion publicacion) {
	updatePublicacion.setlImages(publicacion.getlImages());
	updatePublicacion.setlImagesKeys(publicacion.getlImagesKeys());
	updatePublicacion.setKey(publicacion.getKey());
	updatePublicacion.setNumVisitas(publicacion.getNumVisitas());
	updatePublicacion.setTitulo(publicacion.getTitulo());
	updatePublicacion.setResumen(publicacion.getResumen());
	updatePublicacion.setDescripcion(publicacion.getDescripcion());
	updatePublicacion.setArticulo(publicacion.getArticulo());
	updatePublicacion.setKeywords(publicacion.getKeywords());
	updatePublicacion.setClase1(publicacion.getClase1());
	updatePublicacion.setClase2(publicacion.getClase2());
	updatePublicacion.setTipo(publicacion.getTipo());
	updatePublicacion.setAutor(publicacion.getAutor());
	updatePublicacion.setTitulo2(publicacion.getTitulo2());
	updatePublicacion.setScript(publicacion.getScript());
	updatePublicacion.setScript2(publicacion.getScript2());
    }

    @Override
    public void saveEmail(Email email) {

	ofy().save().entity(email);

    }

    @Override
    public void saveContacto(Contacto contacto) {

	ofy().save().entity(contacto);

    }

}
