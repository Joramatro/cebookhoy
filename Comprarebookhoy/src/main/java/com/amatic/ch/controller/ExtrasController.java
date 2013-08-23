package com.amatic.ch.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.amatic.ch.constants.WebConstants;
import com.amatic.ch.dto.Publicacion;
import com.amatic.ch.service.ComentarioService;
import com.amatic.ch.service.PublicacionService;
import com.amatic.ch.service.UserService;
import com.dyuproject.openid.OpenIdUser;

@Controller
public class ExtrasController {

    List<Integer> sessions = new ArrayList<Integer>();

    @Autowired
    private PublicacionService publicacionService;

    @Autowired
    private UserService userService;

    @Autowired
    private ComentarioService comentarioService;

    @Resource(name = "OIdUserBean")
    OpenIdUser oIdUserBean;

    @RequestMapping(value = { "/extras" }, method = { RequestMethod.GET })
    public String getAccesorios(ModelMap model, HttpServletRequest request,
	    HttpServletResponse response) throws IOException {

	HttpSession session = request.getSession();

	List<Publicacion> publicaciones = publicacionService
		.getPublicaciones(WebConstants.SessionConstants.ACCESORIO);

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

	model.addAttribute("categorias", categorias);

	model.addAttribute("publicaciones", publicaciones);

	return "extras";
    }

}
