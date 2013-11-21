package com.amatic.ch.aop;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;

import com.amatic.ch.dto.Publicacion;
import com.amatic.ch.service.PublicacionService;

@Aspect
public class HeaderAspect {

    @Autowired
    private PublicacionService publicacionService;

    @Pointcut(value = "execution(* com.amatic.ch.controller.OtherController.*(..)) && args(model, request, response)")
    public void otherMethods(ModelMap model, HttpServletRequest request,
	    HttpServletResponse response) {
    }

    @Pointcut(value = "execution(* com.amatic.ch.controller.BlogController.*(..)) && args(model, request, response)")
    public void blogMethods(ModelMap model, HttpServletRequest request,
	    HttpServletResponse response) {
    }

    @Pointcut(value = "execution(* com.amatic.ch.controller.BlogController.*(..)) && args(model, url, request, response)")
    public void blogMethodsUrl(ModelMap model, @PathVariable String url,
	    HttpServletRequest request, HttpServletResponse response) {
    }

    @After("otherMethods(model,request,response)")
    public void getPublicacionesHeaderOther(ModelMap model,
	    HttpServletRequest request, HttpServletResponse response)
	    throws Throwable {

	List<Publicacion> publicacionesDestacadas = publicacionService
		.getPublicacionesDestacadas();

	model.addAttribute("publicacionesDestacadas", publicacionesDestacadas);

    }

    @After("blogMethods(model,request,response)")
    public void getPublicacionesHeaderBlog(ModelMap model,
	    HttpServletRequest request, HttpServletResponse response)
	    throws Throwable {

	List<Publicacion> publicacionesDestacadas = publicacionService
		.getPublicacionesDestacadas();

	model.addAttribute("publicacionesDestacadas", publicacionesDestacadas);

    }

    @After("blogMethodsUrl(model,url,request,response)")
    public void getPublicacionesHeaderBlogUrl(ModelMap model,
	    @PathVariable String url, HttpServletRequest request,
	    HttpServletResponse response) throws Throwable {

	List<Publicacion> publicacionesDestacadas = publicacionService
		.getPublicacionesDestacadas();

	model.addAttribute("publicacionesDestacadas", publicacionesDestacadas);

    }

}
