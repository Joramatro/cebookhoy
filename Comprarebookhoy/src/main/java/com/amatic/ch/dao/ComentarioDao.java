package com.amatic.ch.dao;

import java.util.List;

import com.amatic.ch.dto.Comentario;
import com.googlecode.objectify.Key;

public interface ComentarioDao {

    public Key<Comentario> crearComentario(Comentario comentario);

    public List<Comentario> getUltimosComentarios();

    void update(Comentario comentario);

}
