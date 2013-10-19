package com.amatic.ch.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.akismet.Akismet;

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
	    String web, String nbrComment, String tipo,
	    HttpServletResponse response) throws IOException,
	    NoSuchAlgorithmException {
	Akismet akismet = new Akismet("49f8a3bfb431",
		"http://www.comprarebookhoy.com");
	boolean isSpam = akismet.commentCheck(request.getRemoteAddr(),
		request.getHeader("User-agent"), request.getHeader("referer"),
		"", // permalink
		"comment", // comment type
		nombre, // author
		email, // email
		web, comentario, // Text to check
		request.getParameterMap());

	if (isSpam) {
	    Mail.sendMail(
		    "Comentario Spam Akimet con ip "
			    + WebUtils.getClienAddress(request) + " y email: "
			    + email + "\n Dejado en:" + url + "\n Tipo:" + tipo
			    + "\n Comentario:" + comentario + "\n Web:" + web
			    + "\n Puntos:" + puntos + "\n Nombre:" + nombre
			    + "\n\n requestHeader:"
			    + request.getHeader("referer")
			    + "\n\n requestParameterMap:"
			    + request.getParameterMap()
			    + "\n\n requestHeaderNames:"
			    + request.getHeaderNames(),
		    "Spam Akimet comentario en CEHOY");
	    response.sendRedirect("/");
	} else {
	    String key = WebUtils.SHA1(url.replaceAll("-", " "));
	    Publicacion publicacion = publicacionService.getPublicacion(key,
		    tipo);
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
		nuevoComentario.setComentarioReplyNombre(comentReply
			.getNombre());
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
		    "Comentario con ip " + WebUtils.getClienAddress(request)
			    + " y email: " + email + "\n Dejado en:" + url
			    + "\n Tipo:" + tipo + "\n Comentario:" + comentario
			    + "\n Web:" + web + "\n Puntos:" + puntos
			    + "\n Nombre:" + nombre, "Nuevo Comentario CEHOY");
	}
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

	List<String> categoriasPrecio = new ArrayList<String>();
	for (Publicacion publicacion : publicaciones) {
	    if (!publicacion.getClase3().equals("")
		    && !categoriasPrecio.contains(publicacion.getClase3())) {
		categoriasPrecio.add(publicacion.getClase3());
	    }
	    if (!publicacion.getClase4().equals("")
		    && !categoriasPrecio.contains(publicacion.getClase4())) {
		categoriasPrecio.add(publicacion.getClase4());
	    }

	    if (!publicacion.getClase3().equals("")) {
		publicacion.setClase5(publicacion.getClase1()
			+ publicacion.getClase3());
		if (!publicacion.getClase2().equals("")) {
		    publicacion.setClase6(publicacion.getClase2()
			    + publicacion.getClase3());
		}
	    }
	}
	Collections.sort(categoriasPrecio);

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
	model.addAttribute("categoriasPrecio", categoriasPrecio);
	model.addAttribute("publicaciones", publicaciones);

    }

    void setPublicacion(String url, HttpServletRequest request, ModelMap model,
	    String tipo) throws NoSuchAlgorithmException,
	    UnsupportedEncodingException {
	String key = WebUtils.SHA1(url.replaceAll("-", " "));
	Publicacion publicacion = publicacionService.getPublicacion(key, tipo);
	if (publicacion == null) {
	    String uri = request.getRequestURI();
	    throw new UnknownResourceException("No existe la publicacion: "
		    + uri);
	    // return "channelNotFound";
	}
	// incremeanting number viewers
	publicacion.setNumVisitas(publicacion.getNumVisitas() + 1);
	publicacionService.update(publicacion);

	model.addAttribute("publicacion", publicacion);

	List<Publicacion> publicaciones = publicacionService
		.getUltimasPublicaciones(tipo);

	List<Publicacion> publicacionesInteresantes = new ArrayList<Publicacion>();
	for (Publicacion publicacionNoRep : publicaciones) {
	    if (!publicacion.getKey().equals(publicacionNoRep.getKey())) {
		publicacionesInteresantes.add(publicacionNoRep);
	    }
	}

	List<Publicacion> publicacionesMVE = publicacionService
		.getPublicacionesMasVistas(WebConstants.SessionConstants.EBOOK);

	List<Publicacion> publicacionesMVA = publicacionService
		.getPublicacionesMasVistas(WebConstants.SessionConstants.ARTICULO);

	List<Comentario> comentarios = comentarioService
		.getUltimosComentarios();

	model.addAttribute("comentarios", comentarios);

	model.addAttribute("publicacionesMVE", publicacionesMVE);

	model.addAttribute("publicacionesMVA", publicacionesMVA);

	model.addAttribute("publicaciones", publicacionesInteresantes);
    }
}
