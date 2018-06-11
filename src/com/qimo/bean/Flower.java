package com.qimo.bean;

public class Flower {
	private int f_id;
	private String f_name;
	private String f_color;
	private String f_place;
	private int f_stock;
	private double f_price;
	private String f_message;
	private String f_picture;
	private Classify classify;
	private int recommend;

	public static final int RECOM_NO = 0;
	public static final int RECOM_YES = 1;

	public int getF_id() {
		return f_id;
	}

	public void setF_id(int f_id) {
		this.f_id = f_id;
	}

	public String getF_name() {
		return f_name;
	}

	public void setF_name(String f_name) {
		this.f_name = f_name;
	}

	public String getF_color() {
		return f_color;
	}

	public void setF_color(String f_color) {
		this.f_color = f_color;
	}

	public String getF_place() {
		return f_place;
	}

	public void setF_place(String f_place) {
		this.f_place = f_place;
	}

	public int getF_stock() {
		return f_stock;
	}

	public void setF_stock(int f_stock) {
		this.f_stock = f_stock;
	}

	public double getF_price() {
		return f_price;
	}

	public void setF_price(double f_price) {
		this.f_price = f_price;
	}

	public String getF_message() {
		return f_message;
	}

	public void setF_message(String f_message) {
		this.f_message = f_message;
	}

	public String getF_picture() {
		return f_picture;
	}

	public void setF_picture(String f_picture) {
		this.f_picture = f_picture;
	}

	public Classify getClassify() {
		return classify;
	}

	public void setClassify(Classify classify) {
		this.classify = classify;
	}

	public int getRecommend() {
		return recommend;
	}

	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}

	@Override
	public String toString() {
		return "Flower [f_id=" + f_id + ", f_name=" + f_name + ", f_color="
				+ f_color + ", f_place=" + f_place + ", f_stock=" + f_stock
				+ ", f_price=" + f_price + ", f_message=" + f_message
				+ ", f_picture=" + f_picture + ", classify=" + classify
				+ ", recommend=" + recommend + "]";
	}

	public Flower(int f_id, String f_name, String f_color, String f_place,
			int f_stock, double f_price, String f_message, String f_picture,
			Classify classify, int recommend) {
		super();
		this.f_id = f_id;
		this.f_name = f_name;
		this.f_color = f_color;
		this.f_place = f_place;
		this.f_stock = f_stock;
		this.f_price = f_price;
		this.f_message = f_message;
		this.f_picture = f_picture;
		this.classify = classify;
		this.recommend = recommend;
	}

	public Flower() {
		super();
		// TODO Auto-generated constructor stub
	}
}
