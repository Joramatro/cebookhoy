package com.amatic.ch.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.amatic.ch.constants.WebConstants;

@Controller
public class ExtrasController extends PublicacionAbstract {

    List<Integer> sessions = new ArrayList<Integer>();

    @RequestMapping(value = { "/extras" }, method = { RequestMethod.GET })
    public String getAccesorios(ModelMap model, HttpServletRequest request,
	    HttpServletResponse response) throws IOException {

	setPublicaciones(model, WebConstants.SessionConstants.ACCESORIO);

	return "extras";
    }

}
