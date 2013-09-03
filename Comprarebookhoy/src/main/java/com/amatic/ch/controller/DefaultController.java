package com.amatic.ch.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.amatic.ch.exception.UnknownResourceException;
import com.amatic.ch.fileupload.controller.FileResource;

/**
 * Default controller that exists to return a proper REST response for unmapped
 * requests.
 */
@Controller
public class DefaultController {

    private static final Logger log = LoggerFactory
	    .getLogger(FileResource.class);

    @RequestMapping("/**")
    public void unmappedRequest(HttpServletRequest request) {
	String uri = request.getRequestURI();

	UnknownResourceException urexc = new UnknownResourceException(
		"There is no resource for path " + uri);
	log.error("error Bad Request", urexc);

	throw urexc;
	// return "errors/error";
    }

}