package com.entities;

public class bugs {
   private int bid;
   private String bTitle;
   private String pTitle;
   private String bDate;
   private String bDesc;
   private String uEmail;
   private String bSoln;
   
public bugs(String bTitle, String pTitle, String bDate, String bDesc, String uEmail) {
	super();
	this.bTitle = bTitle;
	this.pTitle = pTitle;
	this.bDate = bDate;
	this.bDesc = bDesc;
	this.uEmail = uEmail;
}

public bugs(int bid, String bTitle, String pTitle, String bDate, String bDesc, String bSoln) {
	super();
	this.bid = bid;
	this.bTitle = bTitle;
	this.pTitle = pTitle;
	this.bDate = bDate;
	this.bDesc = bDesc;
	this.bSoln = bSoln;
}

public bugs(String bTitle, String pTitle, String bDate, String bDesc) {
	super();
	this.bTitle = bTitle;
	this.pTitle = pTitle;
	this.bDate = bDate;
	this.bDesc = bDesc;
}

public bugs() {
	super();
}

public int getBid() {
	return bid;
}

public void setBid(int bid) {
	this.bid = bid;
}

public String getbTitle() {
	return bTitle;
}

public void setbTitle(String bTitle) {
	this.bTitle = bTitle;
}

public String getpTitle() {
	return pTitle;
}

public void setpTitle(String pTitle) {
	this.pTitle = pTitle;
}

public String getbDate() {
	return bDate;
}

public void setbDate(String bDate) {
	this.bDate = bDate;
}

public String getbDesc() {
	return bDesc;
}

public void setbDesc(String bDesc) {
	this.bDesc = bDesc;
}

public String getuEmail() {
	return uEmail;
}

public void setuEmail(String uEmail) {
	this.uEmail = uEmail;
}

public String getbSoln() {
	return bSoln;
}

public void setbSoln(String bSoln) {
	this.bSoln = bSoln;
}
   

   
}
