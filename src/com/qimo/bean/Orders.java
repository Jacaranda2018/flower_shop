package com.qimo.bean;

import java.util.ArrayList;

/*
 * ∂©µ•¿‡
 */
public class Orders{
	private int oid;
	private Users user;
	private String o_dids;
	private String o_nums;
	private double o_money;
	private ArrayList<Flower> fList;
	private String[] numList;

	public int getOid() {
		return oid;
	}

	public void setOid(int oid) {
		this.oid = oid;
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public String getO_dids() {
		return o_dids;
	}

	public void setO_dids(String o_dids) {
		this.o_dids = o_dids;
	}

	public String getO_nums() {
		return o_nums;
	}

	public void setO_nums(String o_nums) {
		this.o_nums = o_nums;
	}

	public double getO_money() {
		return o_money;
	}

	public void setO_money(double o_money) {
		this.o_money = o_money;
	}

	public ArrayList<Flower> getfList() {
		return fList;
	}

	public void setfList(ArrayList<Flower> fList) {
		this.fList = fList;
	}

	public String[] getNumList() {
		return numList;
	}

	public void setNumList(String[] numList) {
		this.numList = numList;
	}

	public Orders(int oid, Users user, String o_dids, String o_nums,
			double o_money, ArrayList<Flower> fList, String[] numList) {
		super();
		this.oid = oid;
		this.user = user;
		this.o_dids = o_dids;
		this.o_nums = o_nums;
		this.o_money = o_money;
		this.fList = fList;
		this.numList = numList;
	}

	public Orders() {
		super();
	}
}
