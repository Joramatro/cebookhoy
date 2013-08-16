package com.amatic.ch.controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.amatic.ch.constants.WebConstants;
import com.amatic.ch.dto.Comentario;
import com.amatic.ch.dto.Publicacion;
import com.amatic.ch.exception.UnknownResourceException;
import com.amatic.ch.service.ComentarioService;
import com.amatic.ch.service.PublicacionService;
import com.amatic.ch.service.UserService;
import com.dyuproject.openid.OpenIdUser;
import com.googlecode.objectify.Key;
import com.googlecode.objectify.Ref;

@Controller
public class EbooksController {

    List<Integer> sessions = new ArrayList<Integer>();

    @Autowired
    private PublicacionService publicacionService;

    @Autowired
    private UserService userService;

    @Autowired
    private ComentarioService comentarioService;

    @Resource(name = "OIdUserBean")
    OpenIdUser oIdUserBean;

    @RequestMapping(value = { "/ebooks/{url}" }, method = RequestMethod.GET)
    public String cargarPublicacion(ModelMap model, @PathVariable String url,
	    HttpServletRequest request, HttpServletResponse response)
	    throws IOException {

	String titulo = url.replaceAll("-", " ");
	Publicacion publicacion = publicacionService.getPublicacion(titulo,
		WebConstants.SessionConstants.EBOOK);
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
		.getUltimasPublicaciones(WebConstants.SessionConstants.EBOOK);

	model.addAttribute("publicaciones", publicaciones);

	return "ebook";
    }

    @RequestMapping(value = { "/ebooks/{url}/nuevoComentario" }, method = { RequestMethod.POST })
    public void guardarComentario(ModelMap model,
	    @RequestParam("url") String url,
	    @RequestParam("nombre") String nombre,
	    @RequestParam("email") String email,
	    @RequestParam("puntos") String puntos,
	    @RequestParam("comentario") String comentario,
	    HttpServletRequest request, HttpServletResponse response)
	    throws IOException, NoSuchAlgorithmException {

	String titulo = url.replaceAll("-", " ");
	Publicacion publicacion = publicacionService.getPublicacion(titulo,
		WebConstants.SessionConstants.EBOOK);
	if (publicacion == null) {
	    String uri = request.getRequestURI();
	    throw new UnknownResourceException("There is no resource for path "
		    + uri);
	    // return "channelNotFound";
	}

	List<Ref<Comentario>> lComentarios = publicacion.getlComentarios();

	Comentario nuevoComentario = new Comentario();
	nuevoComentario.setFecha(new Date());
	nuevoComentario.setMail(email);
	nuevoComentario.setNombre(nombre);
	nuevoComentario.setPuntos(Integer.parseInt(puntos));
	nuevoComentario.setComentario(comentario);
	Key<Comentario> keyNuevoComentario = comentarioService
		.crearComentario(nuevoComentario);

	lComentarios.add(Ref.create(keyNuevoComentario));

	publicacionService.update(publicacion);

	response.sendRedirect("/ebooks/" + url);

    }

    @RequestMapping(value = { "/ebooks" }, method = { RequestMethod.GET })
    public String getPublicaciones(ModelMap model, HttpServletRequest request,
	    HttpServletResponse response) throws IOException {

	HttpSession session = request.getSession();

	List<Publicacion> publicaciones = publicacionService
		.getPublicaciones(WebConstants.SessionConstants.EBOOK);

	List<Comentario> comentarios = comentarioService
		.getUltimosComentarios();

	model.addAttribute("publicaciones", publicaciones);

	model.addAttribute("comentarios", comentarios);

	return "ebooks";
    }

}
