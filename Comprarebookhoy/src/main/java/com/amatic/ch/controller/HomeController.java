package com.amatic.ch.controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.safety.Whitelist;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.amatic.ch.constants.WebConstants;
import com.amatic.ch.dto.Comentario;
import com.amatic.ch.dto.Publicacion;
import com.amatic.ch.exception.UnknownResourceException;
import com.amatic.ch.service.ComentarioService;
import com.amatic.ch.service.PublicacionService;
import com.amatic.ch.utils.Mail;
import com.amatic.ch.utils.WebUtils;

@Controller
public class HomeController {

    List<Integer> sessions = new ArrayList<Integer>();
    private static final Logger log = LoggerFactory
	    .getLogger(HomeController.class);
    @Autowired
    private PublicacionService publicacionService;

    @Autowired
    private ComentarioService comentarioService;

    @RequestMapping(value = { "/index", "/" }, method = { RequestMethod.GET,
	    RequestMethod.POST })
    public String getMainScreen(ModelMap model, HttpServletRequest request,
	    HttpServletResponse response) throws IOException {

	response.setDateHeader("Expires", (new Date()).getTime() + 604800000L);
	// User user = (User) session
	// .getAttribute(WebConstants.SessionConstants.RC_USER);
	// // Ref<?> value has not been initialized
	// if (user != null) {
	// user = this.userService.findUser(user.getMail());
	// }
	// // Saltando Uservalidation
	// if (user == null) {
	// user = new User();
	// user.setMail((String) oIdUserBean.getAttribute("email"));
	// user.setName((String) oIdUserBean.getAttribute("nickname"));
	// session.setAttribute(WebConstants.SessionConstants.RC_USER, user);
	// try {
	// user = this.userService.findUser(user.getMail());
	// } catch (com.googlecode.objectify.NotFoundException nf) {
	// this.userService.create(user, false);
	// }
	// }
	// user.setNewUser(true);
	// Fin Uservalidation trick

	List<Publicacion> publicacionesEbooks = publicacionService
		.getUltimasPublicaciones(WebConstants.SessionConstants.EBOOK);

	List<Publicacion> publicacionesBlog = publicacionService
		.getUltimasPublicaciones(WebConstants.SessionConstants.ARTICULO);

	List<Publicacion> publicacionesMVE = publicacionService
		.getPublicacionesMasVistas(WebConstants.SessionConstants.EBOOK);

	List<Publicacion> publicacionesMVA = publicacionService
		.getPublicacionesMasVistas(WebConstants.SessionConstants.ARTICULO);

	List<Publicacion> publicacionesDestacadas = publicacionService
		.getPublicacionesDestacadas();

	List<Publicacion> publicacionesPortada = publicacionService
		.getPublicacionesPortada();

	List<Comentario> comentarios = comentarioService
		.getUltimosComentarios();
	List<Comentario> ultimosComentarios = new ArrayList<Comentario>();
	for (Comentario comentario : comentarios) {
	    Comentario ultimoComentario = new Comentario();
	    ultimoComentario.setComentario(Jsoup.clean(comentario
		    .getComentario().replaceAll("<br />", " "), Whitelist
		    .simpleText()));
	    ultimoComentario.setNombre(comentario.getNombre());
	    ultimoComentario.setPublicacion(comentario.getPublicacion());
	    ultimosComentarios.add(ultimoComentario);
	}
	model.addAttribute("comentarios", ultimosComentarios);

	model.addAttribute("publicacionesMVE", publicacionesMVE);

	model.addAttribute("publicacionesMVA", publicacionesMVA);

	model.addAttribute("publicacionesEbooks", publicacionesEbooks);

	model.addAttribute("publicacionesBlog", publicacionesBlog);

	model.addAttribute("publicacionesDestacadas", publicacionesDestacadas);

	model.addAttribute("publicacionesPortada", publicacionesPortada);

	return "index";
    }

    @RequestMapping(value = { "/venta/{tipo}/{url}" }, method = { RequestMethod.GET })
    public String getVenta(ModelMap model, @PathVariable String url,
	    @PathVariable String tipo, HttpServletRequest request,
	    HttpServletResponse response) throws IOException,
	    NoSuchAlgorithmException {

	String originalUrl = url;
	String keyb = null;
	if (url.endsWith("-2")) {
	    originalUrl = originalUrl.replace("-2", "");
	} else if (url.endsWith("-3")) {
	    originalUrl = originalUrl.replace("-3", "");
	} else if (url.endsWith("-4")) {
	    originalUrl = originalUrl.replace("-4", "");
	} else if (url.endsWith("-5")) {
	    originalUrl = originalUrl.replace("-5", "");
	}

	String key = WebUtils.SHA1(originalUrl.replaceAll("-", " "));
	Publicacion publicacion = null;
	if (tipo.equals("principal")) {
	    publicacion = publicacionService.getPublicacion(key,
		    WebConstants.SessionConstants.EBOOK);
	    if (publicacion == null) {
		publicacion = publicacionService.getPublicacion(key,
			WebConstants.SessionConstants.ARTICULO);
	    }
	    if (publicacion == null && !originalUrl.equals(url)) {
		keyb = new String(WebUtils.SHA1(url.replaceAll("-", " ")));
		publicacion = publicacionService.getPublicacion(keyb,
			WebConstants.SessionConstants.EBOOK);
		if (publicacion == null) {
		    publicacion = publicacionService.getPublicacion(keyb,
			    WebConstants.SessionConstants.ARTICULO);
		}
	    }
	} else if (tipo.equals("extra")) {
	    publicacion = publicacionService.getPublicacion(key,
		    WebConstants.SessionConstants.ACCESORIO);
	    if (publicacion == null && !originalUrl.equals(url)) {
		keyb = new String(WebUtils.SHA1(url.replaceAll("-", " ")));
		publicacion = publicacionService.getPublicacion(keyb,
			WebConstants.SessionConstants.ACCESORIO);
	    }
	} else if (tipo.equals("marca")) {
	    publicacion = new Publicacion();
	    if (url.equals("logo1")) {
		publicacion.setScript(WebConstants.SessionConstants.logo1);
		publicacion.setScript2(WebConstants.SessionConstants.logo1img);
	    } else if (url.equals("logo2")) {
		publicacion.setScript(WebConstants.SessionConstants.logo2);
		publicacion.setScript2(WebConstants.SessionConstants.logo2img);
	    } else if (url.equals("logo3")) {
		publicacion.setScript(WebConstants.SessionConstants.logo3);
		publicacion.setScript2(WebConstants.SessionConstants.logo3img);
	    } else if (url.equals("logo4")) {
		publicacion.setScript(WebConstants.SessionConstants.logo4);
		publicacion.setScript2(WebConstants.SessionConstants.logo4img);
	    } else if (url.equals("logo5")) {
		publicacion.setScript(WebConstants.SessionConstants.logo5);
		publicacion.setScript2(WebConstants.SessionConstants.logo5img);
	    } else if (url.equals("logo6")) {
		publicacion.setScript(WebConstants.SessionConstants.logo6);
		publicacion.setScript2(WebConstants.SessionConstants.logo6img);
	    } else if (url.equals("logo7")) {
		publicacion.setScript(WebConstants.SessionConstants.logo7);
		publicacion.setScript2(WebConstants.SessionConstants.logo7img);
	    } else if (url.equals("logo8")) {
		publicacion.setScript(WebConstants.SessionConstants.logo8);
		publicacion.setScript2(WebConstants.SessionConstants.logo8img);
	    } else if (url.equals("logo9")) {
		publicacion.setScript(WebConstants.SessionConstants.logo9);
		publicacion.setScript2(WebConstants.SessionConstants.logo9img);
	    } else if (url.equals("logo10")) {
		publicacion.setScript(WebConstants.SessionConstants.logo10);
		publicacion.setScript2(WebConstants.SessionConstants.logo10img);
	    } else if (url.equals("kindleFlash")) {
		publicacion
			.setScript(WebConstants.SessionConstants.kindleFlash);
		publicacion
			.setScript2(WebConstants.SessionConstants.kindleFlashimg);
	    } else if (url.equals("preciosIncreibles")) {
		publicacion
			.setScript(WebConstants.SessionConstants.preciosIncreibles);
		publicacion
			.setScript2(WebConstants.SessionConstants.preciosIncreiblesimg);

	    } else if (url.equals("nexus7")) {
		publicacion.setScript(WebConstants.SessionConstants.nexus7);
		publicacion.setScript2(WebConstants.SessionConstants.nexus7img);
	    } else if (url.equals("SonyReader6")) {
		publicacion
			.setScript("http://www.amazon.es/gp/product/B00910TG9G/ref=as_li_ss_tl?ie=UTF8&camp=3626&creative=24822&creativeASIN=B00910TG9G&linkCode=as2&tag=comprarebookh-21");
		publicacion
			.setScript2("http://ir-es.amazon-adsystem.com/e/ir?t=comprarebookh-21&l=as2&o=30&a=B00910TG9G");
	    } else if (url.equals("NookSimpleTouch")) {
		publicacion
			.setScript("http://www.amazon.es/gp/product/140053271X/ref=as_li_ss_tl?ie=UTF8&camp=3626&creative=24822&creativeASIN=140053271X&linkCode=as2&tag=comprarebookh-21");
		publicacion
			.setScript2("http://ir-es.amazon-adsystem.com/e/ir?t=comprarebookh-21&l=as2&o=30&a=140053271X");
	    } else if (url.equals("SonyReaderPRST2")) {
		publicacion
			.setScript("http://www.amazon.es/gp/product/B00910TFSI/ref=as_li_ss_tl?ie=UTF8&camp=3626&creative=24822&creativeASIN=B00910TFSI&linkCode=as2&tag=comprarebookh-21");
		publicacion
			.setScript2("http://ir-es.amazon-adsystem.com/e/ir?t=comprarebookh-21&l=as2&o=30&a=B00910TFSI");
	    } else {
		publicacion = null;
	    }
	} else if (tipo.equals("Papyre602Ocean")) {
	    publicacion = new Publicacion();
	    publicacion
		    .setScript("http://www.amazon.es/gp/product/B00BS9MH80/ref=as_li_ss_tl?ie=UTF8&camp=3626&creative=24822&creativeASIN=B00BS9MH80&linkCode=as2&tag=comprarebookh-21");
	    publicacion
		    .setScript2("http://ir-es.amazon-adsystem.com/e/ir?t=comprarebookh-21&l=as2&o=30&a=B00BS9MH80");
	} else if (tipo.equals("WolderMibukDelta7")) {
	    publicacion = new Publicacion();
	    publicacion
		    .setScript("http://www.amazon.es/gp/product/B0074FPD7Y/ref=as_li_ss_tl?ie=UTF8&camp=3626&creative=24822&creativeASIN=B0074FPD7Y&linkCode=as2&tag=comprarebookh-21");
	    publicacion
		    .setScript2("http://ir-es.amazon-adsystem.com/e/ir?t=comprarebookh-21&l=as2&o=30&a=B0074FPD7Y");
	} else if (tipo.equals("ApproxAPPEB02G")) {
	    publicacion = new Publicacion();
	    publicacion
		    .setScript("http://www.amazon.es/gp/product/B009OCGEW8/ref=as_li_ss_tl?ie=UTF8&camp=3626&creative=24822&creativeASIN=B009OCGEW8&linkCode=as2&tag=comprarebookh-21");
	    publicacion
		    .setScript2("http://ir-es.amazon-adsystem.com/e/ir?t=comprarebookh-21&l=as2&o=30&a=B009OCGEW8");
	} else if (tipo.equals("WolderMiBukKids")) {
	    publicacion = new Publicacion();
	    publicacion
		    .setScript("http://www.amazon.es/gp/product/B008DG53R8/ref=as_li_ss_tl?ie=UTF8&camp=3626&creative=24822&creativeASIN=B008DG53R8&linkCode=as2&tag=comprarebookh-21");
	    publicacion
		    .setScript2("http://ir-es.amazon-adsystem.com/e/ir?t=comprarebookh-21&l=as2&o=30&a=B008DG53R8");
	}
	if (publicacion == null) {
	    String uri = request.getRequestURI();
	    throw new UnknownResourceException("No existe la ruta: " + uri);
	    // return "channelNotFound";
	}

	StringBuffer mensaje = new StringBuffer();
	Enumeration<String> headerNames = request.getHeaderNames();
	boolean existsAccept = false;
	boolean existsCookie = false;
	boolean existsReferer = false;
	boolean condition1 = false;
	boolean condition2 = false;
	boolean condition3 = false;
	boolean condition4 = false;
	while (headerNames.hasMoreElements()) {
	    String headerName = headerNames.nextElement();
	    if (headerName.equals("Accept")) {
		existsAccept = true;
	    }
	    if (headerName.equals("Cookie")) {
		existsCookie = true;
	    }
	    if (headerName.equals("Referer")) {
		existsReferer = true;
	    }

	    mensaje.append(headerName);
	    String headerValue = request.getHeader(headerName);
	    if (headerName.equals("X-AppEngine-Country")
		    && headerValue.equals("US")) {
		condition1 = true;
	    }
	    if (headerName.equals("X-AppEngine-Region")
		    && headerValue.equals("?")) {
		condition2 = true;
	    }
	    if (headerName.equals("X-AppEngine-City")
		    && headerValue.equals("?")) {
		condition3 = true;
	    }
	    if (headerName.equals("X-AppEngine-Country")
		    && headerValue.equals("ZZ")) {
		condition4 = true;
	    }
	    if (headerName.equals("User-Agent")
		    && headerValue.contains("Zookabot")) {
		existsAccept = false;
	    }
	    mensaje.append(", " + headerValue);
	    mensaje.append("\n");
	}
	mensaje.append("ip: " + WebUtils.getClienAddress(request) + "\n");
	if (condition1 && condition2 && condition3 && !existsCookie) {
	    // mensaje.append("NO ENVIADO A VENTAS");
	    // Mail.sendMail(mensaje.toString(), "CEH " +
	    // request.getRequestURI());
	    return null;
	} else if (existsAccept && !existsCookie && !existsReferer
		&& condition4) {
	    // bot chungo
	    mensaje.append("NO ENVIADO Blue Coat");
	    Mail.sendMail(mensaje.toString(), "CEH " + request.getRequestURI());
	    return null;
	} else if (existsAccept) {

	    // Mail.sendMail(mensaje.toString(), "CEH " +
	    // request.getRequestURI());
	    model.addAttribute("publicacion", publicacion);
	    if (keyb != null) {
		String lastTwoChars = url.substring(url.length() - 2);
		if (url.endsWith(lastTwoChars + "-2")) {
		    return "venta/venta2";
		} else if (url.endsWith(lastTwoChars + "-3")) {
		    return "venta/venta3";
		} else if (url.endsWith(lastTwoChars + "-4")) {
		    return "venta/venta4";
		} else if (url.endsWith(lastTwoChars + "-5")) {
		    return "venta/venta5";
		} else {
		    return "venta/venta";
		}
	    } else {

		if (url.endsWith("-2")) {
		    return "venta/venta2";
		} else if (url.endsWith("-3")) {
		    return "venta/venta3";
		} else if (url.endsWith("-4")) {
		    return "venta/venta4";
		} else if (url.endsWith("-5")) {
		    return "venta/venta5";
		} else {
		    return "venta/venta";
		}
	    }
	} else {
	    // mensaje.append("NO ENVIADO A VENTAS POR NO TENER ACCEPT");
	    // Mail.sendMail(mensaje.toString(), "CEH " +
	    // request.getRequestURI());
	    return null;
	}

    }

    @RequestMapping("/**")
    public void unmappedRequest(HttpServletRequest request) {
	String uri = request.getRequestURI();

	UnknownResourceException urexc = new UnknownResourceException(
		"No existe esta ruta: " + uri);
	log.error("error Bad Request", urexc);

	throw urexc;
	// return "errors/error";
    }

}
