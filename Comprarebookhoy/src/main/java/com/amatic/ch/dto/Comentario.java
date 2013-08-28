package com.amatic.ch.dto;

import java.io.Serializable;
import java.util.Date;

import com.googlecode.objectify.annotation.Embed;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;

@Entity
public class Comentario implements Serializable {

    /**
     * 
     */
    private static final long serialVersionUID = -8979385747050569290L;

    @Id
    Long id;

    private int puntos;
    private String comentario;

    private Date fecha;

    private String mail;

    private String nombre;

    private String web;

    private String ipAddress;

    private String gravatar;
    @Embed
    private Publicacion publicacion;
    private String comentarioReply;

    private String comentarioReplyNombre;

    private String comentarioReplyNbr;

    public String getWeb() {
	return web;
    }

    public String getIpAddress() {
	return ipAddress;
    }

    public void setIpAddress(String ipAddress) {
	this.ipAddress = ipAddress;
    }

    public void setWeb(String web) {
	this.web = web;
    }

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

    public String getGravatar() {
	return gravatar;
    }

    public void setGravatar(String gravatar) {
	this.gravatar = gravatar;
    }

    public Publicacion getPublicacion() {
	return publicacion;
    }

    public void setPublicacion(Publicacion publicacion) {
	this.publicacion = publicacion;
    }

    public String getComentarioReply() {
	return comentarioReply;
    }

    public void setComentarioReply(String comentarioReply) {
	this.comentarioReply = comentarioReply;
    }

    public String getComentarioReplyNombre() {
	return comentarioReplyNombre;
    }

    public void setComentarioReplyNombre(String comentarioReplyNombre) {
	this.comentarioReplyNombre = comentarioReplyNombre;
    }

    public String getComentarioReplyNbr() {
	return comentarioReplyNbr;
    }

    public void setComentarioReplyNbr(String comentarioReplyNbr) {
	this.comentarioReplyNbr = comentarioReplyNbr;
    }

}
