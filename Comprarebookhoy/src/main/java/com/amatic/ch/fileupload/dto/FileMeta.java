package com.amatic.ch.fileupload.dto;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
@XmlAccessorType(XmlAccessType.FIELD)
public class FileMeta {
    String name;
    long size;
    String url;
    String delete_url;
    String delete_type;
    String thumbnail_url;

    public FileMeta() {
    }

    public FileMeta(String filename, long size, String url, String urlPreview) {
	this.name = filename;
	this.size = size;
	this.url = url;
	this.delete_url = url;
	this.delete_type = "DELETE";
	this.thumbnail_url = urlPreview;
    }
}
