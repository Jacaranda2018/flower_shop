package com.qimo.bean;

import java.util.ArrayList;
import java.util.Arrays;

public class CustomOrder {
	private int tid;
	private Users user;
	private String tfids;
	private String tnums;
	private double tmoney;
	private ArrayList<Flower> fList;
	private String[] numList;

	public int getTid() {
		return tid;
	}

	public void setTid(int tid) {
		this.tid = tid;
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public String getTfids() {
		return tfids;
	}

	public void setTfids(String tfids) {
		this.tfids = tfids;
	}

	public String getTnums() {
		return tnums;
	}

	public void setTnums(String tnums) {
		this.tnums = tnums;
	}

	public double getTmoney() {
		return tmoney;
	}

	public void setTmoney(double tmoney) {
		this.tmoney = tmoney;
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

	public CustomOrder(int tid, Users user, String tfids, String tnums,
			double tmoney, ArrayList<Flower> fList, String[] numList) {
		super();
		this.tid = tid;
		this.user = user;
		this.tfids = tfids;
		this.tnums = tnums;
		this.tmoney = tmoney;
		this.fList = fList;
		this.numList = numList;
	}

	public CustomOrder() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "CustomOrder [tid=" + tid + ", user=" + user + ", tfids="
				+ tfids + ", tnums=" + tnums + ", tmoney=" + tmoney
				+ ", fList=" + fList + ", numList=" + Arrays.toString(numList)
				+ "]";
	}
}
