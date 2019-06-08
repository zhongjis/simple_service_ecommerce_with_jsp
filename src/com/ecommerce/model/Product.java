package com.ecommerce.model;

public class Product {
	private int id;
	private String img_dir;
	private String name;
	private String brief_description;
	private String detail_description;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getImg_dir() {
		return img_dir;
	}
	public void setImg_dir(String img_dir) {
		this.img_dir = img_dir;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBrief_description() {
		return brief_description;
	}
	public void setBrief_description(String brief_description) {
		this.brief_description = brief_description;
	}
	public String getDetail_description() {
		return detail_description;
	}
	public void setDetail_description(String detail_description) {
		this.detail_description = detail_description;
	}
}
