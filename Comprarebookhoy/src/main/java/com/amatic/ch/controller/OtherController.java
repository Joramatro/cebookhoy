package com.amatic.ch.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.amatic.ch.dto.Contacto;
import com.amatic.ch.dto.Email;
import com.amatic.ch.service.ComentarioService;
import com.amatic.ch.service.PublicacionService;
import com.amatic.ch.service.UserService;
import com.dyuproject.openid.OpenIdUser;

@Controller
public class OtherController {

    List<Integer> sessions = new ArrayList<Integer>();

    @Autowired
    private PublicacionService publicacionService;

    @Autowired
    private UserService userService;

    @Autowired
    private ComentarioService comentarioService;

    @Resource(name = "OIdUserBean")
    OpenIdUser oIdUserBean;

    @RequestMapping(value = { "/contacto" }, method = { RequestMethod.GET,
	    RequestMethod.POST })
    public String getContacto(ModelMap model, HttpServletRequest request,
	    HttpServletResponse response) throws IOException {

	return "contacto";
    }

    @RequestMapping(value = { "/sobre" }, method = { RequestMethod.GET,
	    RequestMethod.POST })
    public String getSobre(ModelMap model, HttpServletRequest request,
	    HttpServletResponse response) throws IOException {

	return "sobre";
    }

    @RequestMapping(value = { "/suscribir" }, method = { RequestMethod.POST })
    public void getSubscripcion(ModelMap model, HttpServletRequest request,
	    @RequestParam("email") String email, HttpServletResponse response)
	    throws IOException {
	Email emailObj = new Email(email);
	publicacionService.saveEmail(emailObj);
	return;
    }

    @RequestMapping(value = { "/contactar" }, method = { RequestMethod.POST })
    public void getContacto(ModelMap model, HttpServletRequest request,
	    @RequestParam("email") String email,
	    @RequestParam("name") String name,
	    @RequestParam("message") String message,
	    HttpServletResponse response) throws IOException {
	Contacto contacto = new Contacto();
	contacto.setEmail(email);
	contacto.setMessage(message);
	contacto.setName(name);
	publicacionService.saveContacto(contacto);
	return;
    }

}
