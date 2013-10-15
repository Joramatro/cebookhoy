package com.amatic.ch.controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.amatic.ch.constants.WebConstants;

@Controller
public class BlogController extends PublicacionAbstract {

    List<Integer> sessions = new ArrayList<Integer>();

    @RequestMapping(value = { "/blog/{url}" }, method = RequestMethod.GET)
    public String cargarPublicacion(ModelMap model, @PathVariable String url,
	    HttpServletRequest request, HttpServletResponse response)
	    throws IOException, NoSuchAlgorithmException {

	setPublicacion(url, request, model,
		WebConstants.SessionConstants.ARTICULO);

	return "articulo";
    }

    @RequestMapping(value = { "/blog/{url}/nuevoComentario" }, method = { RequestMethod.POST })
    public void guardarComentario(ModelMap model,
	    @RequestParam("url") String url,
	    @RequestParam("nombre") String nombre,
	    @RequestParam("email") String email,
	    @RequestParam("puntos") String puntos,
	    @RequestParam("comentario") String comentario,
	    @RequestParam("web") String web,
	    @RequestParam("nbrComment") String nbrComment,
	    HttpServletRequest request, HttpServletResponse response)
	    throws IOException, NoSuchAlgorithmException {

	guardarComentarioPub(request, url, nombre, email, puntos, comentario,
		web, nbrComment, WebConstants.SessionConstants.ARTICULO);

	response.sendRedirect("/blog/" + url);

    }

    @RequestMapping(value = { "/blog" }, method = { RequestMethod.GET })
    public String getPublicaciones(ModelMap model, HttpServletRequest request,
	    HttpServletResponse response) throws IOException {

	setPublicaciones(model, WebConstants.SessionConstants.ARTICULO);

	return "blog";
    }

}
