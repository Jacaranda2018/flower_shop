package com.qimo.bean;

public class Classify {
	private int id;
	private String name;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Classify(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public Classify() {
		super();
	}

	@Override
	public String toString() {
		return "Classify [id=" + id + ", name=" + name + "]";
	}

}
