package com.amatic.ch.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;

@ControllerAdvice
public class CentralControllerHandler {

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
