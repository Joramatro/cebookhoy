package com.amatic.ch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amatic.ch.dao.ComentarioDao;
import com.amatic.ch.dto.Comentario;
import com.googlecode.objectify.Key;

@Service
public class ComentarioService {

    @Autowired
    private ComentarioDao comentarioDao;

    public Key<Comentario> crearComentario(Comentario comentario) {
	return this.comentarioDao.crearComentario(comentario);
    }

    public List<Comentario> getUltimosComentarios() {
	return this.comentarioDao.getUltimosComentarios();
    }

    public void update(Comentario comentario) {
	this.comentarioDao.update(comentario);
    }

}
