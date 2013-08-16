package com.amatic.ch.controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

import javax.annotation.Resource;
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
import com.amatic.ch.dto.Publicacion;
import com.amatic.ch.dto.User;
import com.amatic.ch.service.PublicacionService;
import com.amatic.ch.service.UserService;
import com.amatic.ch.utils.ChannelUtils;
import com.dyuproject.openid.OpenIdUser;
import com.googlecode.objectify.Key;
import com.googlecode.objectify.Ref;

@Controller
public class EditionController {

    @Autowired
    private PublicacionService publicacionService;

    @Resource(name = "OIdUserBean")
    OpenIdUser oIdUserBean;

    @Autowired
    private UserService userService;

    @RequestMapping(value = { "/edicion" }, method = { RequestMethod.GET,
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
	    @RequestParam("tipo") String tipo, HttpServletRequest request,
	    HttpServletResponse response) throws IOException,
	    NoSuchAlgorithmException {
	HttpSession session = request.getSession();

	User user = (User) session
		.getAttribute(WebConstants.SessionConstants.RC_USER);

	// Saltando Uservalidation
	if (user == null) {
	    user = new User();
	    user.setMail((String) oIdUserBean.getAttribute("email"));
	    user.setName((String) oIdUserBean.getAttribute("nickname"));
	    session.setAttribute(WebConstants.SessionConstants.RC_USER, user);
	    try {
		user = this.userService.findUser(user.getMail());
	    } catch (com.googlecode.objectify.NotFoundException nf) {
		this.userService.create(user, false);
	    }
	}
	user.setNewUser(true);
	// Fin Uservalidation trick

	Publicacion publicacion = new Publicacion();

	publicacion.setKey(ChannelUtils.SHA1(titulo));
	publicacion.setNumVisitas(0);
	publicacion.setTitulo(titulo);
	publicacion.setUser(Ref.create(Key.create(User.class, user.getMail())));
	publicacion.setResumen(resumen);
	publicacion.setDescripcion(descripcion);
	publicacion.setArticulo(articulo);
	publicacion.setKeywords(keywords);
	publicacion.setClase1(clase1);
	publicacion.setClase2(clase2);
	publicacion.setTipo(tipo);

	publicacionService.crearPublicacion(publicacion);
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

}
