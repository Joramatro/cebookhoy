package com.amatic.channel.tracker;

import java.io.IOException;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.amatic.session.handle.SessionCounter;
import com.google.appengine.api.channel.ChannelPresence;
import com.google.appengine.api.channel.ChannelService;
import com.google.appengine.api.channel.ChannelServiceFactory;

public class ChannelDisconnected extends HttpServlet {

	private static final long serialVersionUID = 1L;

	Logger logger = Logger.getLogger(ChannelDisconnected.class.getName());

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		ChannelService channelService = ChannelServiceFactory
				.getChannelService();
		ChannelPresence presence = channelService.parsePresence(req);

		logger.info("- " + presence.clientId());

		SessionCounter.setNumberSessions(presence.isConnected(),
				presence.clientId());

	}

}
