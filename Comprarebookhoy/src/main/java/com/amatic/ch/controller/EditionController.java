package com.amatic.ch.controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
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
import com.amatic.ch.exception.UnknownResourceException;
import com.amatic.ch.fileupload.controller.FileResource;
import com.amatic.ch.service.ComentarioService;
import com.amatic.ch.service.PublicacionService;
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
	    @RequestParam("clase3") String clase3,
	    @RequestParam("clase4") String clase4,
	    @RequestParam("tipo") String tipo,
	    @RequestParam("autor") String autor,
	    @RequestParam("googleAutor") String googleAutor,
	    @RequestParam("portada") String portada,
	    @RequestParam("descPortada") String descPortada,
	    @RequestParam("tituloPortada") String tituloPortada,
	    @RequestParam("destacado") String destacado,
	    @RequestParam("numeros") String numeros,
	    @RequestParam("titulo2") String titulo2,
	    @RequestParam("script") String script,
	    @RequestParam("script2") String script2,
	    @RequestParam("disponible") String disponible,
	    HttpServletRequest request, HttpServletResponse response)
	    throws IOException, NoSuchAlgorithmException {
	HttpSession session = request.getSession();

	User user = (User) session
		.getAttribute(WebConstants.SessionConstants.RC_USER);
	if (user == null) {
	    response.sendRedirect("/editar");
	}
	Publicacion publicacion = new Publicacion();
	try {
	    publicacion.setKey(WebUtils.SHA1(WebUtils.cleanTildes(titulo)));
	    publicacion.setNumVisitas(0);
	    publicacion.setTitulo(titulo);
	    publicacion.setUser(Ref.create(Key.create(User.class,
		    user.getMail())));
	    publicacion.setResumen(resumen);
	    publicacion.setDescripcion(descripcion);
	    publicacion.setNumeros(numeros);

	    int i = 1;
	    int punto = 1;
	    articulo = "<p>" + articulo;
	    while (articulo.contains("\n\n")) {
		if (i % 2 != 0) {
		    if (publicacion.getNumeros().equals("S")) {
			articulo = articulo.replaceFirst("\n\n",
				"</p><br><br><h2><span class=\"dropcap color\">"
					+ punto + "</span>");
		    } else {
			articulo = articulo.replaceFirst("\n\n",
				"</p><br><br><h2>");
		    }
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
	    articulo = articulo.replaceAll("<href *",
		    "<a target=\"_blank\" href=");
	    articulo = articulo.replaceAll("</href>", "</a>");

	    i = 1;
	    while (articulo.contains("**")) {
		if (i % 2 != 0) {
		    articulo = articulo.replaceFirst("\\*\\*", "<b>");
		    i++;
		} else {
		    articulo = articulo.replaceFirst("\\*\\*", "</b>");
		    i++;
		}
	    }

	    publicacion.setArticulo(articulo);
	    publicacion.setKeywords(keywords);
	    publicacion.setClase1(clase1);
	    publicacion.setClase2(clase2);
	    publicacion.setClase3(clase3);
	    publicacion.setClase4(clase4);
	    publicacion.setTipo(tipo);
	    publicacion.setAutor(autor);
	    publicacion.setGoogleAutor(googleAutor);
	    publicacion.setPortada(portada);
	    publicacion.setDescPortada(descPortada);
	    publicacion.setTituloPortada(tituloPortada);
	    publicacion.setDestacado(destacado);
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
	User user = (User) session
		.getAttribute(WebConstants.SessionConstants.RC_USER);
	if (user == null) {
	    response.sendRedirect("/editar");
	}
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
	User user = (User) session
		.getAttribute(WebConstants.SessionConstants.RC_USER);
	if (user == null) {
	    response.sendRedirect("/editar");
	}

	String tipo = "";
	if (tipoedit.equals(WebConstants.SessionConstants.tipo1)) {
	    tipo = WebConstants.SessionConstants.EBOOK;

	} else if (tipoedit.equals(WebConstants.SessionConstants.tipo2)) {
	    tipo = WebConstants.SessionConstants.ARTICULO;
	} else if (tipoedit.equals(WebConstants.SessionConstants.tipo3)) {
	    tipo = WebConstants.SessionConstants.ACCESORIO;
	}
	String key = WebUtils.SHA1(url.replaceAll("-", " "));
	Publicacion publicacion = publicacionService.getPublicacion(key, tipo);
	if (publicacion == null) {
	    String uri = request.getRequestURI();
	    throw new UnknownResourceException("No existe el recurso: " + uri);
	}
	session.setAttribute("publicacion", publicacion);

	model.addAttribute("publicacion", publicacion);

	return "edicion/editarPublicacion";

    }

    @RequestMapping(value = { "/edicion/guardarEdicionPublicacion" }, method = { RequestMethod.POST })
    public void guardarEdicionPublicacion(ModelMap model,
	    @RequestParam("articulo") String articulo,
	    @RequestParam("portada") String portada,
	    @RequestParam("destacado") String destacado,
	    @RequestParam("descPortada") String descPortada,
	    @RequestParam("tituloPortada") String tituloPortada,
	    @RequestParam("tipo") String tipo,
	    @RequestParam("titulo") String titulo,
	    @RequestParam("titulo2") String titulo2,
	    @RequestParam("resumen") String resumen,
	    @RequestParam("descripcion") String descripcion,
	    @RequestParam("autor") String autor,
	    @RequestParam("googleAutor") String googleAutor,
	    @RequestParam("clase1") String clase1,
	    @RequestParam("clase2") String clase2,
	    @RequestParam("clase3") String clase3,
	    @RequestParam("clase4") String clase4,
	    @RequestParam("script") String script,
	    @RequestParam("script2") String script2,
	    @RequestParam("disponible") String disponible,
	    HttpServletRequest request, HttpServletResponse response)
	    throws IOException, NoSuchAlgorithmException {
	HttpSession session = request.getSession();
	User user = (User) session
		.getAttribute(WebConstants.SessionConstants.RC_USER);
	if (user == null) {
	    response.sendRedirect("/editar");
	}

	Publicacion publicacion = (Publicacion) session
		.getAttribute("publicacion");
	try {
	    // articulo = articulo.replaceAll("\n", "");
	    publicacion.setArticulo(articulo);
	    publicacion.setPortada(portada);
	    publicacion.setDestacado(destacado);
	    publicacion.setTipo(tipo);
	    publicacion.setTitulo(titulo);
	    publicacion.setKey(WebUtils.SHA1(WebUtils.cleanTildes(titulo)));
	    publicacion.setTitulo2(titulo2);
	    publicacion.setResumen(resumen);
	    publicacion.setDescripcion(descripcion);
	    publicacion.setDescPortada(descPortada);
	    publicacion.setTituloPortada(tituloPortada);
	    publicacion.setAutor(autor);
	    publicacion.setGoogleAutor(googleAutor);
	    publicacion.setClase1(clase1);
	    publicacion.setClase2(clase2);
	    publicacion.setClase3(clase3);
	    publicacion.setClase4(clase4);
	    publicacion.setScript(script);
	    publicacion.setScript2(script2);
	    publicacion.setDisponible(disponible);

	    publicacionService.update(publicacion);
	} catch (Exception e) {
	    log.error("error en editioncontroller", e);
	}

	session.setAttribute("publicacion", null);
	response.sendRedirect("/");

    }

    @RequestMapping(value = { "/edicion/guardarEdicionFotosPub" }, method = {
	    RequestMethod.GET, RequestMethod.POST })
    public void guardarFotosEdicionPublicacion(ModelMap model,
	    @RequestParam("articulo") String articulo,
	    @RequestParam("portada") String portada,
	    @RequestParam("destacado") String destacado,
	    @RequestParam("descPortada") String descPortada,
	    @RequestParam("tituloPortada") String tituloPortada,
	    @RequestParam("tipo") String tipo,
	    @RequestParam("titulo") String titulo,
	    @RequestParam("titulo2") String titulo2,
	    @RequestParam("resumen") String resumen,
	    @RequestParam("descripcion") String descripcion,
	    @RequestParam("autor") String autor,
	    @RequestParam("googleAutor") String googleAutor,
	    @RequestParam("clase1") String clase1,
	    @RequestParam("clase2") String clase2,
	    @RequestParam("clase3") String clase3,
	    @RequestParam("clase4") String clase4,
	    @RequestParam("script") String script,
	    @RequestParam("script2") String script2,
	    @RequestParam("disponible") String disponible,
	    HttpServletRequest request, HttpServletResponse response)
	    throws IOException, NoSuchAlgorithmException {
	HttpSession session = request.getSession();
	User user = (User) session
		.getAttribute(WebConstants.SessionConstants.RC_USER);
	if (user == null) {
	    response.sendRedirect("/editar");
	}
	try {
	    Publicacion publicacion = (Publicacion) session
		    .getAttribute("publicacion");

	    publicacion.setArticulo(articulo);
	    publicacion.setPortada(portada);
	    publicacion.setDestacado(destacado);
	    publicacion.setTipo(tipo);
	    publicacion.setTitulo(titulo);
	    publicacion.setKey(WebUtils.SHA1(WebUtils.cleanTildes(titulo)));
	    publicacion.setTitulo2(titulo2);
	    publicacion.setResumen(resumen);
	    publicacion.setDescripcion(descripcion);
	    publicacion.setDescPortada(descPortada);
	    publicacion.setTituloPortada(tituloPortada);
	    publicacion.setAutor(autor);
	    publicacion.setGoogleAutor(googleAutor);
	    publicacion.setClase1(clase1);
	    publicacion.setClase2(clase2);
	    publicacion.setClase3(clase3);
	    publicacion.setClase4(clase4);
	    publicacion.setScript(script);
	    publicacion.setScript2(script2);
	    publicacion.setDisponible(disponible);

	    // reemplazo tercera imagen
	    List<String> lImagenes = publicacion.getlImages();
	    if (lImagenes.size() >= 3) {
		articulo = articulo
			.replaceAll(
				"<br><a target=\"_blank\" href=\"/venta/principal/"
					+ publicacion.getUrl()
					+ "\"><img src=\""
					+ lImagenes.get(2)
					+ "\" alt=\""
					+ publicacion.getDescripcion()
					+ "\" style=\"width:430px; height:400px; margin-left: 28%;\"/></a><br> ",
				"<img>");
	    }

	    request.getSession().setAttribute("tituloNuevaPublicacion",
		    publicacion.getKey());

	    request.getSession().setAttribute("tipoNuevaPublicacion",
		    publicacion.getTipo());
	    FileResource fr = new FileResource();
	    for (String image : publicacion.getlImagesKeys()) {
		fr.delete(image, request, response);
	    }

	    publicacion.getlImages().clear();
	    publicacion.getlImagesKeys().clear();
	    publicacionService.update(publicacion);
	} catch (Exception e) {
	    log.error("error en editioncontroller", e);
	}

	session.setAttribute("publicacion", null);
	return;

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

	List<Publicacion> publicaciones = publicacionService
		.getPublicaciones(WebConstants.SessionConstants.EBOOK);

	for (Publicacion publicacion : publicaciones) {
	    List<Ref<Comentario>> lComentarios = publicacion.getlComentarios();
	    if (lComentarios == null) {
		lComentarios = new ArrayList<Ref<Comentario>>();
		publicacion.setlComentarios(lComentarios);
	    }
	    List<Comentario> comentarios = publicacion.getComentariosDeref();
	    int i = 0;
	    if (comentarios != null) {
		for (Comentario comentario : comentarios) {
		    if (comentario != null) {
			comentario.setPublicacion(publicacion);
			comentarioService.update(comentario);
		    } else {
			lComentarios.remove(i);
			publicacionService.update(publicacion);
		    }
		}
	    }

	}

	List<Publicacion> publicacionesblog = publicacionService
		.getPublicaciones(WebConstants.SessionConstants.ARTICULO);

	for (Publicacion publicacion : publicacionesblog) {
	    List<Ref<Comentario>> lComentarios = publicacion.getlComentarios();
	    if (lComentarios == null) {
		lComentarios = new ArrayList<Ref<Comentario>>();
		publicacion.setlComentarios(lComentarios);
	    }
	    List<Comentario> comentarios = publicacion.getComentariosDeref();
	    int i = 0;
	    if (comentarios != null) {
		for (Comentario comentario : comentarios) {
		    if (comentario != null) {
			comentario.setPublicacion(publicacion);
			comentarioService.update(comentario);
		    } else {
			lComentarios.remove(i);
			publicacionService.update(publicacion);
		    }
		}
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
	    // if (publicacion.getClase3() == null) {
	    // publicacion.setClase3("");
	    // }
	    // if (publicacion.getClase4() == null) {
	    // publicacion.setClase4("");
	    // }
	    // if (publicacion.getDescPortada() == null) {
	    // publicacion.setDescPortada("");
	    // }
	    // if (publicacion.getDestacado() == null) {
	    // publicacion.setDestacado("N");
	    // }
	    // if (publicacion.getGoogleAutor() == null) {
	    // publicacion
	    // .setGoogleAutor("https://plus.google.com/u/0/108657243775074009859?rel=author");
	    // }
	    // if (publicacion.getlImagesNames() == null) {
	    // publicacion.setlImagesNames(new ArrayList<String>());
	    // }
	    // if (publicacion.getNumeros() == null) {
	    // publicacion.setNumeros("S");
	    // }
	    // if (publicacion.getPortada() == null) {
	    // publicacion.setPortada("N");
	    // }
	    // if (publicacion.getTituloPortada() == null) {
	    // publicacion.setTituloPortada(publicacion.getTitulo());
	    // }
	    // if (publicacion.getDisponible() == null) {
	    // publicacion.setDisponible("S");
	    // }
	    publicacionService.update(publicacion);
	}

	List<Publicacion> publicacionesblog = publicacionService
		.getPublicaciones(WebConstants.SessionConstants.ARTICULO);

	for (Publicacion publicacion : publicacionesblog) {
	    publicacion.setKey(WebUtils.SHA1(WebUtils.cleanTildes(publicacion
		    .getTitulo())));
	    // if (publicacion.getClase3() == null) {
	    // publicacion.setClase3("");
	    // }
	    // if (publicacion.getClase4() == null) {
	    // publicacion.setClase4("");
	    // }
	    // if (publicacion.getDescPortada() == null) {
	    // publicacion.setDescPortada("");
	    // }
	    // if (publicacion.getDestacado() == null) {
	    // publicacion.setDestacado("N");
	    // }
	    // if (publicacion.getGoogleAutor() == null) {
	    // publicacion
	    // .setGoogleAutor("https://plus.google.com/u/0/108657243775074009859?rel=author");
	    // }
	    // if (publicacion.getlImagesNames() == null) {
	    // publicacion.setlImagesNames(new ArrayList<String>());
	    // }
	    // if (publicacion.getNumeros() == null) {
	    // publicacion.setNumeros("S");
	    // }
	    // if (publicacion.getPortada() == null) {
	    // publicacion.setPortada("N");
	    // }
	    // if (publicacion.getTituloPortada() == null) {
	    // publicacion.setTituloPortada(publicacion.getTitulo());
	    // }
	    // if (publicacion.getDisponible() == null) {
	    // publicacion.setDisponible("S");
	    // }
	    publicacionService.update(publicacion);
	}

	List<Publicacion> publicacionesExtras = publicacionService
		.getPublicaciones(WebConstants.SessionConstants.ACCESORIO);

	for (Publicacion publicacion : publicacionesExtras) {
	    publicacion.setKey(WebUtils.SHA1(WebUtils.cleanTildes(publicacion
		    .getTitulo())));
	    // if (publicacion.getClase3() == null) {
	    // publicacion.setClase3("");
	    // }
	    // if (publicacion.getClase4() == null) {
	    // publicacion.setClase4("");
	    // }
	    // if (publicacion.getDescPortada() == null) {
	    // publicacion.setDescPortada("");
	    // }
	    // if (publicacion.getDestacado() == null) {
	    // publicacion.setDestacado("N");
	    // }
	    // if (publicacion.getGoogleAutor() == null) {
	    // publicacion
	    // .setGoogleAutor("https://plus.google.com/u/0/108657243775074009859?rel=author");
	    // }
	    // if (publicacion.getlImagesNames() == null) {
	    // publicacion.setlImagesNames(new ArrayList<String>());
	    // }
	    // if (publicacion.getNumeros() == null) {
	    // publicacion.setNumeros("N");
	    // }
	    // if (publicacion.getPortada() == null) {
	    // publicacion.setPortada("N");
	    // }
	    // if (publicacion.getTituloPortada() == null) {
	    // publicacion.setTituloPortada("");
	    // }
	    // if (publicacion.getDisponible() == null) {
	    // publicacion.setDisponible("N");
	    // }
	    publicacionService.update(publicacion);
	}
    }

    @RequestMapping(value = { "/edicion/pubUrlTitulo" }, method = { RequestMethod.GET })
    public String getPubUrlTitulo(ModelMap model, HttpServletRequest request,
	    HttpServletResponse response) throws IOException {
	List<Publicacion> publicacionesEbook = publicacionService
		.getPublicaciones(WebConstants.SessionConstants.EBOOK);

	List<Publicacion> publicacionesBlog = publicacionService
		.getPublicaciones(WebConstants.SessionConstants.ARTICULO);

	List<Publicacion> publicacionesExtra = publicacionService
		.getPublicaciones(WebConstants.SessionConstants.ACCESORIO);

	model.addAttribute("publicacionesEbook", publicacionesEbook);

	model.addAttribute("publicacionesBlog", publicacionesBlog);

	model.addAttribute("publicacionesExtra", publicacionesExtra);

	return "edicion/pubUrlTitulo";
    }

    @RequestMapping(value = { "/{tipoedit}/{url}/infoFotos" }, method = { RequestMethod.GET })
    public String verNombreFotos(ModelMap model,
	    @PathVariable("url") String url,
	    @PathVariable("tipoedit") String tipoedit,
	    HttpServletRequest request, HttpServletResponse response)
	    throws IOException, NoSuchAlgorithmException {
	HttpSession session = request.getSession();
	User user = (User) session
		.getAttribute(WebConstants.SessionConstants.RC_USER);
	if (user == null) {
	    response.sendRedirect("/editar");
	}

	String tipo = "";
	if (tipoedit.equals(WebConstants.SessionConstants.tipo1)) {
	    tipo = WebConstants.SessionConstants.EBOOK;
	} else if (tipoedit.equals(WebConstants.SessionConstants.tipo2)) {
	    tipo = WebConstants.SessionConstants.ARTICULO;
	} else if (tipoedit.equals(WebConstants.SessionConstants.tipo3)) {
	    tipo = WebConstants.SessionConstants.ACCESORIO;
	}

	String key = WebUtils.SHA1(url.replaceAll("-", " "));
	Publicacion publicacion = publicacionService.getPublicacion(key, tipo);

	model.addAttribute("pubNombresFotos", publicacion.getlImagesNames());
	model.addAttribute("pubUrlsFotos", publicacion.getlImages());
	model.addAttribute("pubKeysFotos", publicacion.getlImagesKeys());

	return "edicion/pubNombresFotos";

    }

}
