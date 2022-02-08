package com.example.project01.model.shop;

public class CartDTO {
	private int cart_id;
	private String userid;
	public String name;
	private int drug_code;
	private String drug_name;
	private float price;
	private int amount;
	private float money;
	private String dose;

	public String getDose() {
		return dose;
	}

	public void setDose(String dose) {
		this.dose = dose;
	}

	public int getDrug_code() {
		return drug_code;
	}

	public void setDrug_code(int drug_code) {
		this.drug_code = drug_code;
	}

	public int getCart_id() {
		return cart_id;
	}

	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDrug_name() {
		return drug_name;
	}

	public void setDrug_name(String drug_name) {
		this.drug_name = drug_name;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public float getMoney() {
		return money;
	}

	public void setMoney(float money) {
		this.money = money;
	}

	@Override
	public String toString() {
		return "CartDTO [cart_id=" + cart_id + ", userid=" + userid + ", name=" + name + ", drug_code=" + drug_code
				+ ", drug_name=" + drug_name + ", price=" + price + ", amount=" + amount + ", money=" + money + "]";
	}

}
