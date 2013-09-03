package com.amatic.ch.exception;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.ConversionNotSupportedException;
import org.springframework.beans.TypeMismatchException;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.http.converter.HttpMessageNotWritableException;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.amatic.ch.fileupload.controller.FileResource;

@ControllerAdvice
public class CentralControllerHandler {
    private static final Logger log = LoggerFactory
	    .getLogger(FileResource.class);

    // 400
    @ExceptionHandler({ MissingServletRequestParameterException.class,
	    ConversionNotSupportedException.class, TypeMismatchException.class,
	    HttpMessageNotReadableException.class,
	    HttpMessageNotWritableException.class })
    public String handleMyException(Exception exception,
	    HttpServletRequest request) {

	log.error("error Bad Request", exception);
	return "/error/error_dinamic";
    }

    // 500ConversionNotSupportedException

    // @ExceptionHandler({PersonNotFoundException.class})
    // public ResponseEntity<String>
    // handlePersonNotFound(PersonNotFoundException pe) {
    // return new ResponseEntity<String>(pe.getMessage(), HttpStatus.NOT_FOUND);
    // }

    // @ExceptionHandler({ MethodArgumentNotValidException.class })
    // public ResponseEntity<String> handleValidationException(
    // MethodArgumentNotValidException pe) {
    // return new ResponseEntity<String>(pe.getMessage(),
    // HttpStatus.BAD_REQUEST);
    //
    // }
    //
    // @ExceptionHandler({ Exception.class })
    // public ResponseEntity<String> handleValidationException(Exception pe) {
    // return new ResponseEntity<String>(pe.getMessage(),
    // HttpStatus.BAD_REQUEST);
    // }

    // @ExceptionHandler(value = { IllegalArgumentException.class,
    // IllegalStateException.class })
    // protected ResponseEntity<Object> handleConflict(RuntimeException ex,
    // WebRequest request) {
    // String bodyOfResponse = "This should be application specific";
    // return handleExceptionInternal(ex, bodyOfResponse,
    // new HttpHeaders(), HttpStatus.CONFLICT, request);
    // }

    // @ExceptionHandler(Exception.class)
    // public String handleIOException(Exception ex) {
    //
    // return "errorView";
    //
    // }

}
