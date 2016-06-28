package com.hlyin.model;

public class Users {
	private String username;
	private String pwd;
	private String pwd_confirm;
	private String email;
	private String tele;
	
	public Users(){
	}
	public Users(String username){
		this.username = username;
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getPwd_confirm() {
		return pwd_confirm;
	}
	public void setPwd_confirm(String pwd_confirm) {
		this.pwd_confirm = pwd_confirm;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTele() {
		return tele;
	}
	public void setTele(String tele) {
		this.tele = tele;
	}
	
}