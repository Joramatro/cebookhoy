package com.amatic.ch.dto;

import java.io.Serializable;
import java.util.Date;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;

@Entity
public class Comentario implements Serializable {

    /**
     * 
     */
    private static final long serialVersionUID = -8979385747050569290L;

    @Id
    Long id;
    @Index
    private int puntos;
    @Index
    private String comentario;
    @Index
    private Date fecha;
    @Index
    private String mail;
    @Index
    private String nombre;

    public Long getId() {
	return id;
    }

    public void setId(Long id) {
	this.id = id;
    }

    public int getPuntos() {
	return puntos;
    }

    public void setPuntos(int puntos) {
	this.puntos = puntos;
    }

    public String getComentario() {
	return comentario;
    }

    public void setComentario(String comentario) {
	this.comentario = comentario;
    }

    public String getMail() {
	return mail;
    }

    public void setMail(String mail) {
	this.mail = mail;
    }

    public String getNombre() {
	return nombre;
    }

    public void setNombre(String nombre) {
	this.nombre = nombre;
    }

    public Date getFecha() {
	return fecha;
    }

    public void setFecha(Date fecha) {
	this.fecha = fecha;
    }

}
