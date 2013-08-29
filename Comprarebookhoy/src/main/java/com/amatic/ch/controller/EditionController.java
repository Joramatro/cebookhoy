package com.amatic.ch.controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import com.amatic.ch.dto.User;
import com.amatic.ch.service.ComentarioService;
import com.amatic.ch.service.PublicacionService;
import com.amatic.ch.service.UserService;
import com.amatic.ch.utils.WebUtils;
import com.googlecode.objectify.Key;
import com.googlecode.objectify.Ref;

@Controller
public class EditionController {

    private static final Logger log = LoggerFactory
	    .getLogger(EditionController.class);

    @Autowired
    private PublicacionService publicacionService;

    @Autowired
    private UserService userService;

    @Autowired
    private ComentarioService comentarioService;

    @RequestMapping(value = { "/edicion/nuevo" }, method = { RequestMethod.GET,
	    RequestMethod.POST })
    public String getEdicion(ModelMap model, HttpServletRequest request,
	    HttpServletResponse response) throws IOException {
	request.getSession();

	return "edicion/nuevaPublicacion";
    }

    @RequestMapping(value = { "/edicion/guardarPublicacion" }, method = { RequestMethod.POST })
    public void guardarPublicacion(ModelMap model,
	    @RequestParam("titulo") String titulo,
	    @RequestParam("descripcion") String descripcion,
	    @RequestParam("resumen") String resumen,
	    @RequestParam("articulo") String articulo,
	    @RequestParam("keywords") String keywords,
	    @RequestParam("clase1") String clase1,
	    @RequestParam("clase2") String clase2,
	    @RequestParam("tipo") String tipo,
	    @RequestParam("autor") String autor,
	    @RequestParam("titulo2") String titulo2,
	    @RequestParam("script") String script,
	    @RequestParam("script2") String script2,
	    @RequestParam("disponible") String disponible,
	    HttpServletRequest request, HttpServletResponse response)
	    throws IOException, NoSuchAlgorithmException {
	HttpSession session = request.getSession();

	User user = (User) session
		.getAttribute(WebConstants.SessionConstants.RC_USER);

	Publicacion publicacion = new Publicacion();
	try {
	    publicacion.setKey(WebUtils.SHA1(WebUtils.cleanTildes(titulo)));
	    publicacion.setNumVisitas(0);
	    publicacion.setTitulo(titulo);
	    publicacion.setUser(Ref.create(Key.create(User.class,
		    user.getMail())));
	    publicacion.setResumen(resumen);
	    publicacion.setDescripcion(descripcion);

	    int i = 1;
	    int punto = 1;
	    articulo = "<p>" + articulo;
	    while (articulo.contains("\n\n")) {
		if (i % 2 != 0) {
		    articulo = articulo.replaceFirst("\n\n",
			    "</p><br><br><h2><span class=\"dropcap color\">"
				    + punto + "</span>");
		    punto++;
		    if (i == 1) {
			articulo = articulo.replaceFirst("<br>", "</p><br>");
		    }
		} else {
		    articulo = articulo.replaceFirst("\n\n", "</h2><br><p>");
		}
		i++;
	    }
	    articulo = articulo.replaceAll("\n", "</p><p>");
	    articulo = articulo.concat("</p>");

	    articulo = articulo.replaceAll("<a>", "<a href=\"/venta/principal/"
		    + publicacion.getUrl() + "\">");
	    i = 1;
	    while (articulo.contains("**")) {
		if (i % 2 != 0) {
		    articulo = articulo.replaceFirst("\\*\\*", "<b>");
		} else {
		    articulo = articulo.replaceFirst("\\*\\*", "<\b>");
		}
	    }

	    publicacion.setArticulo(articulo);
	    publicacion.setKeywords(keywords);
	    publicacion.setClase1(clase1);
	    publicacion.setClase2(clase2);
	    publicacion.setTipo(tipo);
	    publicacion.setAutor(autor);
	    publicacion.setTitulo2(titulo2);
	    publicacion.setScript(script);
	    publicacion.setScript2(script2);
	    publicacion.setDisponible(disponible);

	    publicacionService.crearPublicacion(publicacion);
	} catch (Exception e) {
	    log.error("error en editioncontroller", e);
	}
	//
	// List<Ref<Publicacion>> lChannels = user.getChannels();
	// lChannels.add(Ref.create(Key.create(Channel.class,
	// channel.getId())));
	//
	// user = this.userService.update(user);
	// request.getSession().setAttribute(
	// WebConstants.SessionConstants.RC_USER, user);

	request.getSession().setAttribute("tituloNuevaPublicacion",
		publicacion.getKey());

	request.getSession().setAttribute("tipoNuevaPublicacion",
		publicacion.getTipo());

	return;

    }

    @RequestMapping(value = { "/edicion/cargarPublicacion" }, method = {
	    RequestMethod.GET, RequestMethod.POST })
    public String cargarPublicacion(ModelMap model,
	    @RequestParam("titulo") String titulo,
	    @RequestParam("tipo") String tipo, HttpServletRequest request,
	    HttpServletResponse response) throws IOException,
	    NoSuchAlgorithmException {
	HttpSession session = request.getSession();

	Publicacion publicacion = publicacionService.getPublicacion(
		WebUtils.SHA1(WebUtils.cleanTildes(titulo)), tipo);
	session.setAttribute("publicacion", publicacion);

	model.addAttribute("publicacion", publicacion);

	return "edicion/editarPublicacion";

    }

    @RequestMapping(value = { "/{tipoedit}/{url}/editar" }, method = {
	    RequestMethod.GET, RequestMethod.POST })
    public String editarPublicacion(ModelMap model,
	    @PathVariable("url") String url,
	    @PathVariable("tipoedit") String tipoedit,
	    HttpServletRequest request, HttpServletResponse response)
	    throws IOException, NoSuchAlgorithmException {
	HttpSession session = request.getSession();
	String tipo = "";
	if (tipoedit.equals(WebConstants.SessionConstants.tipo1)) {
	    tipo = WebConstants.SessionConstants.EBOOK;

	} else if (tipoedit.equals(WebConstants.SessionConstants.tipo2)) {
	    tipo = WebConstants.SessionConstants.ARTICULO;
	}
	String key = WebUtils.SHA1(url.replaceAll("-", " "));
	Publicacion publicacion = publicacionService.getPublicacion(key, tipo);
	session.setAttribute("publicacion", publicacion);

	model.addAttribute("publicacion", publicacion);

	return "edicion/editarPublicacion";

    }

    @RequestMapping(value = { "/edicion/guardarEdicionPublicacion" }, method = {
	    RequestMethod.GET, RequestMethod.POST })
    public void guardarEdicionPublicacion(ModelMap model,
	    @RequestParam("articulo") String articulo,
	    HttpServletRequest request, HttpServletResponse response)
	    throws IOException, NoSuchAlgorithmException {
	HttpSession session = request.getSession();

	Publicacion publicacion = (Publicacion) session
		.getAttribute("publicacion");
	try {
	    // articulo = articulo.replaceAll("\n", "");
	    publicacion.setArticulo(articulo);

	    publicacionService.update(publicacion);
	} catch (Exception e) {
	    log.error("error en editioncontroller", e);
	}

	session.setAttribute("publicacion", null);
	response.sendRedirect("/");

    }

    @RequestMapping(value = { "/edicion/existente" }, method = {
	    RequestMethod.GET, RequestMethod.POST })
    public String getEditarExistentePublicacion(ModelMap model,
	    HttpServletRequest request, HttpServletResponse response)
	    throws IOException {
	request.getSession();

	return "edicion/editarPublicacion";
    }

    @RequestMapping(value = { "/edicion/limpiarComentario" }, method = {
	    RequestMethod.GET, RequestMethod.POST })
    public void getLogEditar(ModelMap model, HttpServletRequest request,
	    HttpServletResponse response) throws IOException,
	    NoSuchAlgorithmException {
	HttpSession session = request.getSession();

	Publicacion publicacion = publicacionService.getPublicacion(
		WebUtils.SHA1("Kindle"), WebConstants.SessionConstants.EBOOK);

	List<Ref<Comentario>> lComentarios = publicacion.getlComentarios();
	lComentarios.remove(1);
	publicacionService.update(publicacion);
    }

    @RequestMapping(value = { "/edicion/actualizarComentarios" }, method = {
	    RequestMethod.GET, RequestMethod.POST })
    public void getActualizar(ModelMap model, HttpServletRequest request,
	    HttpServletResponse response) throws IOException {
	HttpSession session = request.getSession();

	List<Publicacion> publicaciones = publicacionService
		.getPublicaciones(WebConstants.SessionConstants.EBOOK);

	for (Publicacion publicacion : publicaciones) {
	    List<Comentario> comentarios = publicacion.getComentariosDeref();
	    for (Comentario comentario : comentarios) {
		comentario.setPublicacion(publicacion);
		comentarioService.update(comentario);
	    }
	}

	List<Publicacion> publicacionesblog = publicacionService
		.getPublicaciones(WebConstants.SessionConstants.ARTICULO);

	for (Publicacion publicacion : publicacionesblog) {
	    List<Comentario> comentarios = publicacion.getComentariosDeref();
	    for (Comentario comentario : comentarios) {
		comentario.setPublicacion(publicacion);
		comentarioService.update(comentario);
	    }
	}
    }

    @RequestMapping(value = { "/edicion/actualizarPublicaciones" }, method = {
	    RequestMethod.GET, RequestMethod.POST })
    public void getActualizarPublicaciones(ModelMap model,
	    HttpServletRequest request, HttpServletResponse response)
	    throws IOException, NoSuchAlgorithmException {

	List<Publicacion> publicaciones = publicacionService
		.getPublicaciones(WebConstants.SessionConstants.EBOOK);
	for (Publicacion publicacion : publicaciones) {
	    publicacion.setKey(WebUtils.SHA1(WebUtils.cleanTildes(publicacion
		    .getTitulo())));
	    publicacionService.update(publicacion);
	}

	List<Publicacion> publicacionesblog = publicacionService
		.getPublicaciones(WebConstants.SessionConstants.ARTICULO);

	for (Publicacion publicacion : publicacionesblog) {
	    publicacion.setKey(WebUtils.SHA1(WebUtils.cleanTildes(publicacion
		    .getTitulo())));
	    publicacionService.update(publicacion);
	}
    }

}
