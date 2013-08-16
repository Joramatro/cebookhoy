package com.amatic.ch.dto;

import java.io.Serializable;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;

@Entity
public class Email implements Serializable {

    /**
     * 
     */
    private static final long serialVersionUID = -3531745903981769677L;

    @Id
    Long id;
    @Index
    private String email;

    public Email() {

    }

    public Email(String email) {
	this.email = email;
    }

    public Long getId() {
	return id;
    }

    public void setId(Long id) {
	this.id = id;
    }

    public String getEmail() {
	return email;
    }

    public void setEmail(String email) {
	this.email = email;
    }

}
