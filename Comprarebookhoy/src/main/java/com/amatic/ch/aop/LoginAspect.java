package com.amatic.ch.aop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.ModelMap;

import com.amatic.ch.constants.WebConstants;
import com.amatic.ch.dto.User;
import com.dyuproject.demos.openidservlet.PopupVerifyServlet;

@Aspect
public class LoginAspect {

    @Value("#{application['mail']}")
    private String myMail;

    @Pointcut(value = "execution(* com.amatic.ch.controller.EditionController.*(..)) && args(model, request, response)")
    public void editionMethods(ModelMap model, HttpServletRequest request,
	    HttpServletResponse response) {
    }

    @Before("editionMethods(model,request,response)")
    public void checkUserLogged(ModelMap model, HttpServletRequest request,
	    HttpServletResponse response) throws Throwable {

	// Object retVal = pjp.proceed();
	// stop stopwatch

	// throw new Exception();
	/*
	 * HttpServletRequest request = ((ServletRequestAttributes)
	 * RequestContextHolder .getRequestAttributes()).getRequest();
	 * HttpSession session = request.getSession(); User user = (User)
	 * session .getAttribute(WebConstants.SessionConstants.RC_USER);
	 * 
	 * // Saltando Uservalidation
	 * 
	 * if (user == null) { user = new User(); user.setMail((String)
	 * oIdUserBean.getAttribute("email")); user.setName((String)
	 * oIdUserBean.getAttribute("nickname"));
	 * 
	 * // session.setAttribute(WebConstants.SessionConstants.RC_USER, //
	 * user); /* try { user = this.userService.findUser(user.getMail()); }
	 * catch (com.googlecode.objectify.NotFoundException nf) {
	 * this.userService.create(user, false); }
	 */

	// user.setNewUser(true);
	// }
	// return retVal;

	// HttpSession s = (HttpSession) RequestContextHolder
	// .currentRequestAttributes().resolveReference(
	// RequestAttributes.REFERENCE_SESSION);
	User userA = (User) request.getSession().getAttribute(
		WebConstants.SessionConstants.RC_USER);

	if (userA != null && userA.getMail().equals(myMail)) {
	    return;
	} else {
	    request.getSession().setAttribute(
		    WebConstants.SessionConstants.RC_USER, null);

	    PopupVerifyServlet pvs = new PopupVerifyServlet();
	    request.setAttribute("logout", "true");
	    pvs.doGet(request, response);
	    response.sendRedirect("/editar");
	    response.flushBuffer();
	    response.reset();
	}

    }
}
