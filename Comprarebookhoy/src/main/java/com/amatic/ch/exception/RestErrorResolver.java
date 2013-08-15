package com.amatic.ch.exception;

import org.springframework.web.context.request.ServletWebRequest;

public interface RestErrorResolver {

    /**
     * Returns a {@code RestError} instance to render as the response body based
     * on the given exception.
     * 
     * @param request
     *            current {@link ServletWebRequest} that can be used to obtain
     *            the source request/response pair.
     * @param handler
     *            the executed handler, or <code>null</code> if none chosen at
     *            the time of the exception (for example, if multipart
     *            resolution failed)
     * @param ex
     *            the exception that was thrown during handler execution
     * @return a resolved {@code RestError} instance to render as the response
     *         body or <code>null</code> for default processing
     */
    RestError resolveError(ServletWebRequest request, Object handler,
	    Exception ex);
}
