package com.entitites;

public class Comment {
	int cid;
	String uname;
	String cdate;
	String content;
	int clike;
	int bid;

	public Comment(int cid, String uname, String cdate, String content, int clike, int bid) {
		super();
		this.cid = cid;
		this.uname = uname;
		this.cdate = cdate;
		this.content = content;
		this.clike = clike;
		this.bid = bid;
	}

	public Comment(String uname, String cdate, String content, int clike, int bid) {
		super();
		this.uname = uname;
		this.cdate = cdate;
		this.content = content;
		this.clike = clike;
		this.bid = bid;
	}

	public Comment() {
		super();
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getCdate() {
		return cdate;
	}

	public void setCdate(String cdate) {
		this.cdate = cdate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getClike() {
		return clike;
	}

	public void setClike(int clike) {
		this.clike = clike;
	}

	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

}
