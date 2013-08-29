package com.amatic.ch.utils;

import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;

import com.timgroup.jgravatar.Gravatar;
import com.timgroup.jgravatar.GravatarDefaultImage;
import com.timgroup.jgravatar.GravatarRating;

public class WebUtils {

    public static String getClienAddress(HttpServletRequest request) {
	request.getHeader("VIA");
	String ipAddress = request.getHeader("X-FORWARDED-FOR");
	if (ipAddress == null) {
	    ipAddress = request.getRemoteAddr();
	}
	return ipAddress;
    }

    public static String getGravatar80pxUrl(String email) throws IOException {
	String gravatarUrl = "";
	Gravatar gravatar = new Gravatar();
	gravatar.setRating(GravatarRating.GENERAL_AUDIENCES);
	gravatar.setDefaultImage(GravatarDefaultImage.IDENTICON);
	String gravatarUrlIfExist = gravatar.getUrl(email);
	URL u = new URL(gravatarUrlIfExist);
	HttpURLConnection huc = (HttpURLConnection) u.openConnection();
	huc.setRequestMethod("GET");
	huc.setDoOutput(true);
	huc.connect();
	OutputStream os = huc.getOutputStream();
	int code = huc.getResponseCode();
	if (code != 404) {
	    gravatarUrl = gravatarUrlIfExist;
	}
	return gravatarUrl;
    }

    public static String cleanTildes(String input) {

	// Cadena de caracteres original a sustituir.
	String original = "áàäéèëíìïóòöúùuñÁÀÄÉÈËÍÌÏÓÒÖÚÙÜÑçÇ";
	// Cadena de caracteres ASCII que reemplazarán los originales.
	String ascii = "aaaeeeiiiooouuunAAAEEEIIIOOOUUUNcC";
	String output = input;
	for (int i = 0; i < original.length(); i++) {
	    // Reemplazamos los caracteres especiales.
	    output = output.replace(original.charAt(i), ascii.charAt(i));
	}// for i
	return output;

    }

    private static String convToHex(byte[] data) {
	StringBuilder buf = new StringBuilder();
	for (byte element : data) {
	    int halfbyte = (element >>> 4) & 0x0F;
	    int two_halfs = 0;
	    do {
		if ((0 <= halfbyte) && (halfbyte <= 9)) {
		    buf.append((char) ('0' + halfbyte));
		} else {
		    buf.append((char) ('a' + (halfbyte - 10)));
		}
		halfbyte = element & 0x0F;
	    } while (two_halfs++ < 1);
	}
	return buf.toString();
    }

    public static String SHA1(String text) throws NoSuchAlgorithmException,
	    UnsupportedEncodingException {
	MessageDigest md = MessageDigest.getInstance("SHA-1");
	byte[] sha1hash = new byte[40];
	md.update(text.getBytes("iso-8859-1"), 0, text.length());
	sha1hash = md.digest();
	return convToHex(sha1hash);
    }

}
