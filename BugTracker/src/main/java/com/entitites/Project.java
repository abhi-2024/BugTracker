package com.entitites;

public class Project {
 int id;
 String pname;
 String pdesc;
 String pstate;
 String ptype;
 String pdate;
 String puser;
public Project(String pname, String pdesc, String pstate, String ptype, String pdate, String puser) {
	super();
	this.pname = pname;
	this.pdesc = pdesc;
	this.pstate = pstate;
	this.ptype = ptype;
	this.pdate = pdate;
	this.puser = puser;
}
public Project(int id, String pname, String pdesc, String pstate, String ptype, String pdate) {
	super();
	this.id = id;
	this.pname = pname;
	this.pdesc = pdesc;
	this.pstate = pstate;
	this.ptype = ptype;
	this.pdate = pdate;
}



public Project(int id, String pname, String pdesc, String pstate, String ptype, String pdate, String puser) {
	super();
	this.id = id;
	this.pname = pname;
	this.pdesc = pdesc;
	this.pstate = pstate;
	this.ptype = ptype;
	this.pdate = pdate;
	this.puser = puser;
}
public Project() {
	super();
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getPname() {
	return pname;
}
public void setPname(String pname) {
	this.pname = pname;
}
public String getPdesc() {
	return pdesc;
}
public void setPdesc(String pdesc) {
	this.pdesc = pdesc;
}
public String getPstate() {
	return pstate;
}
public void setPstate(String pstate) {
	this.pstate = pstate;
}
public String getPtype() {
	return ptype;
}
public void setPtype(String ptype) {
	this.ptype = ptype;
}
public String getPdate() {
	return pdate;
}
public void setPdate(String pdate) {
	this.pdate = pdate;
}
public String getPuser() {
	return puser;
}
public void setPuser(String puser) {
	this.puser = puser;
}
 
 
}
