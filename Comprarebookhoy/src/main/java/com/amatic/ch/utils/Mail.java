package com.amatic.ch.utils;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.amatic.ch.fileupload.controller.FileResource;

public class Mail {
    private static final Logger log = LoggerFactory
	    .getLogger(FileResource.class);

    static Properties props = new Properties();
    static Session session = Session.getDefaultInstance(props, null);

    public static void sendMail(String msgBody, String subject) {
	try {
	    Message msg = new MimeMessage(session);
	    msg.setFrom(new InternetAddress("jorge.amatro@gmail.com",
		    "Jorge Combrar Ebook Hoy News"));
	    msg.addRecipient(Message.RecipientType.TO, new InternetAddress(
		    "hola@comprarebookhoy.com", "Jorge Amat"));
	    msg.setSubject(subject);
	    msg.setText(msgBody);
	    Transport.send(msg);

	} catch (Exception e) {
	    log.error("error al mandar mail", e);
	}
    }
}
