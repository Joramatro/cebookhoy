package com.amatic.ch.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.amatic.ch.constants.WebConstants;
import com.amatic.ch.dto.Publicacion;
import com.amatic.ch.service.PublicacionService;

@Controller
public class SitemapController {

    @Autowired
    private PublicacionService publicacionService;

    @RequestMapping(value = "/sitemap.xml", method = RequestMethod.GET)
    public String getMainScreen(ModelMap model, HttpServletRequest request,
	    HttpServletResponse response) {
	List<Publicacion> publicacionesBlog = publicacionService
		.getPublicaciones(WebConstants.SessionConstants.ARTICULO);

	List<Publicacion> publicacionesEbooks = publicacionService
		.getPublicaciones(WebConstants.SessionConstants.EBOOK);

	model.addAttribute("publicacionesEbooks", publicacionesEbooks);

	model.addAttribute("publicacionesBlog", publicacionesBlog);

	return "sitemap";

    }
}
