package com.amatic.ch.dto;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.sun.syndication.feed.rss.Category;

public class SampleContent {

    String title;
    String url;
    String summary;
    String author;
    String comments;
    List<Category> categories = new ArrayList<Category>();
    String description;
    Date createdDate;

    public String getTitle() {
	return title;
    }

    public void setTitle(String title) {
	this.title = title;
    }

    public String getUrl() {
	return url;
    }

    public void setUrl(String url) {
	this.url = url;
    }

    public String getSummary() {
	return summary;
    }

    public void setSummary(String summary) {
	this.summary = summary;
    }

    public Date getCreatedDate() {
	return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
	this.createdDate = createdDate;
    }

    public String getAuthor() {
	return author;
    }

    public void setAuthor(String author) {
	this.author = author;
    }

    public String getComments() {
	return comments;
    }

    public void setComments(String comments) {
	this.comments = comments;
    }

    public String getDescription() {
	return description;
    }

    public void setDescription(String description) {
	this.description = description;
    }

    public List<Category> getCategories() {
	return categories;
    }

    public void setCategories(List<Category> categories) {
	this.categories = categories;
    }

}
