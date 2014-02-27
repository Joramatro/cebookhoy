package com.amatic.ch.dao.impl;

import static com.googlecode.objectify.ObjectifyService.ofy;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.amatic.ch.dao.ComentarioDao;
import com.amatic.ch.dto.Comentario;
import com.googlecode.objectify.Key;

@Repository
public class ComentarioDaoImpl implements ComentarioDao {

    @Override
    public Key<Comentario> crearComentario(Comentario comentario) {

	comentario.setPublicado("S");
	return ofy().save().entity(comentario).now();

    }

    @Override
    public List<Comentario> getUltimosComentarios() {

	List<Comentario> ultimosComentarios = ofy().load()
		.type(Comentario.class).filter("publicado !=", "N")
		.order("publicado").order("-fecha").list();

	if (ultimosComentarios.size() > 25) {
	    ultimosComentarios = ultimosComentarios.subList(0, 25);
	}

	return ultimosComentarios;
    }

    @Override
    public void update(Comentario comentario) {
	Comentario comentarioUpd = ofy().load().type(Comentario.class)
		.id(comentario.getId()).safeGet();

	comentarioUpd.setPublicacion(comentario.getPublicacion());

	ofy().save().entity(comentarioUpd);

    }

}