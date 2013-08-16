package com.amatic.session.handle;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.amatic.ch.dto.Comentario;
import com.amatic.ch.dto.Contacto;
import com.amatic.ch.dto.Email;
import com.amatic.ch.dto.Publicacion;
import com.amatic.ch.dto.User;
import com.google.appengine.api.channel.ChannelMessage;
import com.google.appengine.api.channel.ChannelService;
import com.google.appengine.api.channel.ChannelServiceFactory;
import com.google.appengine.labs.repackaged.org.json.JSONObject;
import com.googlecode.objectify.ObjectifyService;

public class SessionCounter implements HttpSessionListener {

    static {
	ObjectifyService.register(Publicacion.class);
	ObjectifyService.register(User.class);
	ObjectifyService.register(Comentario.class);
	ObjectifyService.register(Email.class);
	ObjectifyService.register(Contacto.class);
    }

    private static List sessions = new ArrayList();

    private static ConcurrentHashMap<String, Integer> nbrConnects = new ConcurrentHashMap<String, Integer>();

    public static void setNumberSessions(boolean isConnected, String channelKey) {
	try {
	    ChannelService channelService = ChannelServiceFactory
		    .getChannelService();

	    JSONObject msg = new JSONObject();
	    int nbrConnections;
	    // initializing to 0 as nbr connections for the hashmap for new
	    // channelkey
	    if (nbrConnects.get(channelKey) == null) {
		nbrConnects.put(channelKey, new Integer(0));
	    }

	    if (isConnected) {
		nbrConnections = nbrConnects.get(channelKey).intValue() + 1;

	    } else {
		nbrConnections = nbrConnects.get(channelKey).intValue() - 1;
	    }
	    nbrConnects.put(channelKey, nbrConnections);
	    msg.put("nbrUsrs", nbrConnections);
	    channelService.sendMessage(new ChannelMessage(channelKey, msg
		    .toString()));
	} catch (Exception e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	}
    }

    public SessionCounter() {
    }

    @Override
    public void sessionCreated(HttpSessionEvent event) {
	HttpSession session = event.getSession();
	sessions.add(session.getId());

	// setNumberSessions();
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent event) {
	HttpSession session = event.getSession();
	sessions.remove(session.getId());

	// setNumberSessions();
    }
}
