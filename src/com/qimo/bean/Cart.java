package com.qimo.bean;

import java.io.Serializable;

public class Cart implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int cid;// cid
	private Users user;// cuid
	private Flower flower;// cbid
	private int num;// cnum
	private double money;// cmoney

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public Flower getFlower() {
		return flower;
	}

	public void setFlower(Flower flower) {
		this.flower = flower;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public double getMoney() {
		return money;
	}

	public void setMoney(double money) {
		this.money = money;
	}

	public Cart(int cid, Users user, Flower flower, int num, double money) {
		super();
		this.cid = cid;
		this.user = user;
		this.flower = flower;
		this.num = num;
		this.money = money;
	}

	public Cart() {
		super();
	}

	@Override
	public String toString() {
		return "Cart [cid=" + cid + ", user=" + user + ", flower=" + flower
				+ ", num=" + num + ", money=" + money + "]";
	}
}
