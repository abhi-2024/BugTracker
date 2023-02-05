package com.entitites;

public class Bug {
	int id;
	String name;
	String des;
	String proj;
	int status;
	String date;
	String media;
	String user;
	
	public Bug(int id, String name, String des, String proj, int status, String date, String media, String user) {
		super();
		this.id = id;
		this.name = name;
		this.des = des;
		this.proj = proj;
		this.status = status;
		this.date = date;
		this.media = media;
		this.user = user;
	}

	public Bug(String name, String des, String proj, int status, String date, String media, String user) {
		super();
		this.name = name;
		this.des = des;
		this.proj = proj;
		this.status = status;
		this.date = date;
		this.media = media;
		this.user = user;
	}

	public Bug() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDes() {
		return des;
	}

	public void setDes(String des) {
		this.des = des;
	}

	public String getProj() {
		return proj;
	}

	public void setProj(String proj) {
		this.proj = proj;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getMedia() {
		return media;
	}

	public void setMedia(String media) {
		this.media = media;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	
}
