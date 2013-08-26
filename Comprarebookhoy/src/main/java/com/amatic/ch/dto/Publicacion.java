package com.amatic.ch.dto;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.googlecode.objectify.Ref;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;
import com.googlecode.objectify.annotation.Load;

@Entity
public class Publicacion implements Serializable {

    /**
     * 
     */
    private static final long serialVersionUID = 6590618419604151092L;

    @Id
    public Long id;

    @Index
    String key;

    @Index
    Integer numVisitas;
    @Index
    String titulo;
    @Load
    Ref<User> user;
    @Index
    List<String> lImages = new ArrayList<String>();
    @Index
    private Date fechaCreacion;
    @Index
    List<String> lImagesKeys = new ArrayList<String>();
    @Index
    String descripcion;
    String resumen;
    String articulo;
    @Index
    String keywords;
    @Index
    String clase1;
    @Index
    String clase2;
    @Index
    String tipo;
    @Index
    String autor;
    @Index
    String titulo2;
    @Index
    String script;
    @Index
    String script2;
    @Load
    List<Ref<Comentario>> lComentarios = new ArrayList<Ref<Comentario>>();

    public String getAutor() {
	return autor;
    }

    public void setAutor(String autor) {
	this.autor = autor;
    }

    public String getTipo() {
	return tipo;
    }

    public void setTipo(String tipo) {
	this.tipo = tipo;
    }

    public List<Ref<Comentario>> getlComentarios() {
	return lComentarios;
    }

    public void setlComentarios(List<Ref<Comentario>> lComentarios) {
	this.lComentarios = lComentarios;
    }

    public String getClase1() {
	return clase1;
    }

    public void setClase1(String clase1) {
	this.clase1 = clase1;
    }

    public String getClase2() {
	return clase2;
    }

    public void setClase2(String clase2) {
	this.clase2 = clase2;
    }

    public Integer getNumVisitas() {
	return numVisitas;
    }

    public void setNumVisitas(Integer numVisitas) {
	this.numVisitas = numVisitas;
    }

    public String getTitulo() {
	return titulo;
    }

    public void setTitulo(String titulo) {
	this.titulo = titulo;
    }

    public Date getFechaCreacion() {
	return fechaCreacion;
    }

    public void setFechaCreacion(Date fechaCreacion) {
	this.fechaCreacion = fechaCreacion;
    }

    public String getDescripcion() {
	return descripcion;
    }

    public void setDescripcion(String descripcion) {
	this.descripcion = descripcion;
    }

    public String getResumen() {
	return resumen;
    }

    public void setResumen(String resumen) {
	this.resumen = resumen;
    }

    public String getArticulo() {
	return articulo;
    }

    public void setArticulo(String articulo) {
	this.articulo = articulo;
    }

    public String getKeywords() {
	return keywords;
    }

    public void setKeywords(String keywords) {
	this.keywords = keywords;
    }

    public Long getId() {
	return id;
    }

    public String getKey() {
	return key;
    }

    public List<String> getlImages() {
	return lImages;
    }

    public List<String> getlImagesKeys() {
	return lImagesKeys;
    }

    public Ref<User> getUser() {
	return user;
    }

    public User getUserDeref() {
	return Deref.deref(user);
    }

    public void setId(Long id) {
	this.id = id;
    }

    public void setKey(String key) {
	this.key = key;
    }

    public void setlImages(List<String> lImages) {
	this.lImages = lImages;
    }

    public void setlImagesKeys(List<String> lImagesKeys) {
	this.lImagesKeys = lImagesKeys;
    }

    public void setUser(Ref<User> user) {
	this.user = user;
    }

    public String getUrl() {
	String url = this.titulo.replaceAll(" ", "-");
	if (url.endsWith("-")) {
	    url = url.substring(0, url.length() - 1);
	}
	return url;
    }

    public List<Comentario> getComentariosDeref() {
	return Deref.deref(lComentarios);
    }

    public int getSumaPuntos() {
	List<Comentario> lComentarios = this.getComentariosDeref();
	int sumaPuntos = 0;
	for (Comentario comentario : lComentarios) {
	    sumaPuntos += comentario.getPuntos();
	}
	return sumaPuntos;
    }

    public int getVotantes() {
	List<Comentario> lComentarios = this.getComentariosDeref();
	int votantes = 0;
	for (Comentario comentario : lComentarios) {
	    if (comentario.getPuntos() > 0) {
		votantes++;
	    }
	}
	return votantes;
    }

    public int getNumComentarios() {
	return lComentarios.size();
    }

    public String getTitulo2() {
	return titulo2;
    }

    public void setTitulo2(String titulo2) {
	this.titulo2 = titulo2;
    }

    public String getScript() {
	return script;
    }

    public void setScript(String script) {
	this.script = script;
    }

    public String getScript2() {
	return script2;
    }

    public void setScript2(String script2) {
	this.script2 = script2;
    }

}
