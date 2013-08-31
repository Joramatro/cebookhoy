package com.amatic.ch.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.amatic.ch.constants.WebConstants;
import com.amatic.ch.dto.Publicacion;
import com.amatic.ch.dto.SampleContent;
import com.amatic.ch.service.PublicacionService;
import com.sun.syndication.feed.rss.Category;

@Controller
public class RssController {

    @Autowired
    private PublicacionService publicacionService;

    @RequestMapping(value = "/rssfeed", method = RequestMethod.GET)
    public ModelAndView getFeedInRss() throws UnsupportedEncodingException {

	List<SampleContent> items = new ArrayList<SampleContent>();

	List<Publicacion> publicacionesEbooks = publicacionService
		.getUltimasPublicaciones(WebConstants.SessionConstants.EBOOK);

	List<Publicacion> publicacionesBlog = publicacionService
		.getUltimasPublicaciones(WebConstants.SessionConstants.ARTICULO);

	for (Publicacion publicacionEbook : publicacionesEbooks) {
	    SampleContent content = new SampleContent();
	    content.setTitle(publicacionEbook.getTitulo());
	    content.setAuthor(publicacionEbook.getAutor());
	    content.setUrl("http://www.comprarebookhoy.com/ebooks/"
		    + publicacionEbook.getUrl());
	    content.setSummary(Jsoup.parse(publicacionEbook.getArticulo())
		    .text());
	    Category category = new Category();
	    category.setValue(publicacionEbook.getClase1());
	    content.getCategories().add(category);
	    if (publicacionEbook.getClase2() != null
		    && !publicacionEbook.getClase2().equals("")) {
		Category category2 = new Category();
		category2.setValue(publicacionEbook.getClase2());
		content.getCategories().add(category2);
	    }
	    content.setDescription(publicacionEbook.getDescripcion());
	    content.setComments("http://www.comprarebookhoy.com/ebooks/"
		    + publicacionEbook.getUrl() + "/#comments");
	    content.setCreatedDate(publicacionEbook.getFechaCreacion());
	    items.add(content);
	}
	for (Publicacion publicacionArticulo : publicacionesBlog) {
	    SampleContent content = new SampleContent();
	    content.setTitle(publicacionArticulo.getTitulo());
	    content.setAuthor(publicacionArticulo.getAutor());
	    content.setUrl("http://www.comprarebookhoy.com/blog/"
		    + publicacionArticulo.getUrl());
	    content.setSummary(Jsoup.parse(publicacionArticulo.getArticulo())
		    .text());
	    Category category = new Category();
	    category.setValue(publicacionArticulo.getClase1());
	    content.getCategories().add(category);
	    if (publicacionArticulo.getClase2() != null
		    && !publicacionArticulo.getClase2().equals("")) {
		Category category2 = new Category();
		category2.setValue(publicacionArticulo.getClase2());
		content.getCategories().add(category2);
	    }
	    content.setDescription(publicacionArticulo.getDescripcion());
	    content.setComments("http://www.comprarebookhoy.com/blog/"
		    + publicacionArticulo.getUrl() + "/#comments");
	    content.setCreatedDate(publicacionArticulo.getFechaCreacion());
	    items.add(content);
	}

	ModelAndView mav = new ModelAndView();
	mav.setViewName("rssViewer");
	mav.addObject("feedContent", items);

	return mav;

    }
}
