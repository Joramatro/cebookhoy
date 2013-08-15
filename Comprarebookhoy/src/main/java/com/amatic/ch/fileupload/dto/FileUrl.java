package com.amatic.ch.fileupload.dto;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
@XmlAccessorType(XmlAccessType.FIELD)
public class FileUrl {
    String url;

    public FileUrl() {
    }

    public FileUrl(String url) {
	this.url = url;
    }
}
