package com.amatic.ch.controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.amatic.ch.constants.WebConstants;
import com.amatic.ch.dto.Comentario;
import com.amatic.ch.dto.Publicacion;
import com.amatic.ch.dto.User;
import com.amatic.ch.service.PublicacionService;
import com.amatic.ch.service.UserService;
import com.amatic.ch.utils.ChannelUtils;
import com.google.appengine.labs.repackaged.com.google.common.base.Throwables;
import com.googlecode.objectify.Key;
import com.googlecode.objectify.Ref;

@Controller
public class EditionController {

    Logger logger = Logger.getLogger(EditionController.class.getName());

    @Autowired
    private PublicacionService publicacionService;

    @Autowired
    private UserService userService;

    @RequestMapping(value = { "/edicion/nuevo" }, method = { RequestMethod.GET,
	    RequestMethod.POST })
    public String getEdicion(ModelMap model, HttpServletRequest request,
	    HttpServletResponse response) throws IOException {
	request.getSession();

	return "edicion/nuevaPublicacion";
    }

    @RequestMapping(value = { "/edicion/guardarPublicacion" }, method = {
	    RequestMethod.GET, RequestMethod.POST })
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
	    HttpServletRequest request, HttpServletResponse response)
	    throws IOException, NoSuchAlgorithmException {
	HttpSession session = request.getSession();

	User user = (User) session
		.getAttribute(WebConstants.SessionConstants.RC_USER);

	Publicacion publicacion = new Publicacion();
	try {
	    publicacion.setKey(ChannelUtils.SHA1(titulo));
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

	    articulo = articulo
		    .replaceAll("<a>", "<a href=\"" + script + "\">");
	    articulo = articulo
		    .replaceAll(
			    "</a>",
			    "</a><img src=\""
				    + script2
				    + "\" width=\"1\" height=\"1\" border=\"0\" alt=\"\" style=\"border:none !important; margin:0px !important;\" />");

	    publicacion.setArticulo(articulo);
	    publicacion.setKeywords(keywords);
	    publicacion.setClase1(clase1);
	    publicacion.setClase2(clase2);
	    publicacion.setTipo(tipo);
	    publicacion.setAutor(autor);
	    publicacion.setTitulo2(titulo2);
	    publicacion.setScript(script);
	    publicacion.setScript2(script2);

	    publicacionService.crearPublicacion(publicacion);
	} catch (Exception e) {
	    logger.warning(Throwables.getStackTraceAsString(e));
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
		publicacion.getTitulo());

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

	Publicacion publicacion = publicacionService.getPublicacion(titulo,
		tipo);
	session.setAttribute("publicacion", publicacion);

	model.addAttribute("publicacion", publicacion);

	return "edicion/editarPublicacion";

    }

    @RequestMapping(value = { "/edicion/guardarEdicionPublicacion" }, method = {
	    RequestMethod.GET, RequestMethod.POST })
    public void guardarEdicionPublicacion(ModelMap model,
	    @RequestParam("articulo") String articulo,
	    @RequestParam("resumen") String resumen,
	    HttpServletRequest request, HttpServletResponse response)
	    throws IOException, NoSuchAlgorithmException {
	HttpSession session = request.getSession();

	Publicacion publicacion = (Publicacion) session
		.getAttribute("publicacion");
	try {
	    // articulo = articulo.replaceAll("\n", "");
	    publicacion.setArticulo(articulo);
	    publicacion.setResumen(resumen);

	    publicacionService.update(publicacion);
	} catch (Exception e) {
	    logger.warning(Throwables.getStackTraceAsString(e));
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
	    HttpServletResponse response) throws IOException {
	HttpSession session = request.getSession();

	Publicacion publicacion = publicacionService.getPublicacion("Kindle",
		WebConstants.SessionConstants.EBOOK);

	List<Ref<Comentario>> lComentarios = publicacion.getlComentarios();
	lComentarios.remove(1);
	publicacionService.update(publicacion);
    }

}
