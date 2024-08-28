package com.java.www;

import java.sql.Timestamp;

public class Member {
	private String id;
	private String pw; 
	private String phone;
	private String gender;
	private String hobbys;
	private Timestamp jdate;
	
	public Member() {}
	public Member(String id, String pw, String phone, String gender, String hobbys) {
		this.id = id;
		this.pw = pw;
		this.phone = phone;
		this.gender = gender;
		this.hobbys = hobbys;
	}
	
	
	public Member(String id, String pw) {
		this.id = id;
		this.pw = pw;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getHobbys() {
		return hobbys;
	}
	public void setHobbys(String hobbys) {
		this.hobbys = hobbys;
	}
	public Timestamp getJdate() {
		return jdate;
	}
	public void setJdate(Timestamp jdate) {
		this.jdate = jdate;
	}
	
	
	
	
	
}
