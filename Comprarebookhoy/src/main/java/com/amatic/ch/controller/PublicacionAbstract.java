package com.amatic.ch.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;

import com.amatic.ch.constants.WebConstants;
import com.amatic.ch.dto.Comentario;
import com.amatic.ch.dto.Deref;
import com.amatic.ch.dto.Publicacion;
import com.amatic.ch.exception.UnknownResourceException;
import com.amatic.ch.service.ComentarioService;
import com.amatic.ch.service.PublicacionService;
import com.amatic.ch.utils.Mail;
import com.amatic.ch.utils.WebUtils;
import com.googlecode.objectify.Key;
import com.googlecode.objectify.Ref;

public abstract class PublicacionAbstract {

    @Autowired
    private PublicacionService publicacionService;
    @Autowired
    private ComentarioService comentarioService;

    void guardarComentarioPub(HttpServletRequest request, String url,
	    String nombre, String email, String puntos, String comentario,
	    String web, String nbrComment, String tipo) throws IOException,
	    NoSuchAlgorithmException {
	String key = WebUtils.SHA1(url.replaceAll("-", " "));
	Publicacion publicacion = publicacionService.getPublicacion(key, tipo);
	if (publicacion == null || Integer.parseInt(puntos) < 0
		|| Integer.parseInt(puntos) > 5 || email == null
		|| (email != null && email.trim().equals(""))) {
	    String uri = request.getRequestURI();
	    throw new UnknownResourceException("Error en comentario " + uri);
	    // return "channelNotFound";
	}

	List<Ref<Comentario>> lComentarios = publicacion.getlComentarios();
	Comentario nuevoComentario = new Comentario();
	if (!nbrComment.equals("") && Integer.parseInt(nbrComment) > 0) {
	    Ref<Comentario> refComentReply = lComentarios.get(Integer
		    .parseInt(nbrComment) - 1);
	    Comentario comentReply = Deref.deref(refComentReply);
	    nuevoComentario.setComentarioReply(comentReply.getComentario());
	    nuevoComentario.setComentarioReplyNombre(comentReply.getNombre());
	    nuevoComentario.setComentarioReplyNbr(nbrComment);
	}

	nuevoComentario.setFecha(new Date());
	nuevoComentario.setMail(email);
	nuevoComentario.setNombre(nombre);
	nuevoComentario.setPuntos(Integer.parseInt(puntos));
	nuevoComentario.setComentario(comentario);
	nuevoComentario.setWeb(web);
	nuevoComentario.setGravatar(WebUtils.getGravatar80pxUrl(email));
	nuevoComentario.setIpAddress(WebUtils.getClienAddress(request));
	nuevoComentario.setPublicacion(publicacion);

	Key<Comentario> keyNuevoComentario = comentarioService
		.crearComentario(nuevoComentario);

	lComentarios.add(Ref.create(keyNuevoComentario));

	publicacionService.update(publicacion);
	Mail.sendMail(
		"Comentario de:" + email + "\n Dejado en:"
			+ publicacion.getUrl(), "Nuevo Comentario CEHOY");
    }

    void setPublicaciones(ModelMap model, String tipo) {
	List<Publicacion> publicaciones = publicacionService
		.getPublicaciones(tipo);

	List<String> categorias = new ArrayList<String>();
	for (Publicacion publicacion : publicaciones) {
	    if (!publicacion.getClase1().equals("")
		    && !categorias.contains(publicacion.getClase1())) {
		categorias.add(publicacion.getClase1());
	    }
	    if (!publicacion.getClase2().equals("")
		    && !categorias.contains(publicacion.getClase2())) {
		categorias.add(publicacion.getClase2());
	    }
	}
	Collections.sort(categorias);

	List<Publicacion> publicacionesMVE = publicacionService
		.getPublicacionesMasVistas(WebConstants.SessionConstants.EBOOK);

	List<Publicacion> publicacionesMVA = publicacionService
		.getPublicacionesMasVistas(WebConstants.SessionConstants.ARTICULO);

	List<Comentario> comentarios = comentarioService
		.getUltimosComentarios();

	model.addAttribute("comentarios", comentarios);
	model.addAttribute("publicacionesMVE", publicacionesMVE);
	model.addAttribute("publicacionesMVA", publicacionesMVA);
	model.addAttribute("categorias", categorias);
	model.addAttribute("publicaciones", publicaciones);
    }

    void setPublicacion(String url, HttpServletRequest request, ModelMap model,
	    String tipo) throws NoSuchAlgorithmException,
	    UnsupportedEncodingException {
	String key = WebUtils.SHA1(url.replaceAll("-", " "));
	Publicacion publicacion = publicacionService.getPublicacion(key, tipo);
	if (publicacion == null) {
	    String uri = request.getRequestURI();
	    throw new UnknownResourceException("There is no resource for path "
		    + uri);
	    // return "channelNotFound";
	}
	// incremeanting number viewers
	publicacion.setNumVisitas(publicacion.getNumVisitas() + 1);
	publicacionService.update(publicacion);

	model.addAttribute("publicacion", publicacion);

	List<Publicacion> publicaciones = publicacionService
		.getUltimasPublicaciones(tipo);

	List<Publicacion> publicacionesMVE = publicacionService
		.getPublicacionesMasVistas(WebConstants.SessionConstants.EBOOK);

	List<Publicacion> publicacionesMVA = publicacionService
		.getPublicacionesMasVistas(WebConstants.SessionConstants.ARTICULO);

	List<Comentario> comentarios = comentarioService
		.getUltimosComentarios();

	model.addAttribute("comentarios", comentarios);

	model.addAttribute("publicacionesMVE", publicacionesMVE);

	model.addAttribute("publicacionesMVA", publicacionesMVA);

	model.addAttribute("publicaciones", publicaciones);
    }
}
