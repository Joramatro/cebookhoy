package com.amatic.ch.fileupload.dto;

import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
@XmlAccessorType(XmlAccessType.FIELD)
public class Entity {
    private List<FileMeta> files;

    public Entity() {
    }

    public Entity(List<FileMeta> files) {
	this.files = files;
    }
}
