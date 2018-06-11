package com.qimo.bean;

public class Users {
	private int id;
	private String logname;
	private String password;
	private String phone;
	private String address;
	private String realname;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getLogname() {
		return logname;
	}

	public void setLogname(String logname) {
		this.logname = logname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public Users(int id, String logname, String password, String phone,
			String address, String realname) {
		super();
		this.id = id;
		this.logname = logname;
		this.password = password;
		this.phone = phone;
		this.address = address;
		this.realname = realname;
	}

	public Users() {
		super();
	}

	@Override
	public String toString() {
		return "Users [id=" + id + ", logname=" + logname + ", password="
				+ password + ", phone=" + phone + ", address=" + address
				+ ", realname=" + realname + "]";
	}

}
