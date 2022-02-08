package com.example.project01.model.shop;

public class DrugDTO {
	private int drug_code;
	private String drug_name;
	private String indication;
	private String dose;
	private float price;
	private String side_effect;
	private String allergy;
	private String pregnancy;
	private int cnt;

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public int getDrug_code() {
		return drug_code;
	}

	public void setDrug_code(int drug_code) {
		this.drug_code = drug_code;
	}

	public String getDrug_name() {
		return drug_name;
	}

	public void setDrug_name(String drug_name) {
		this.drug_name = drug_name;
	}

	public String getIndication() {
		return indication;
	}

	public void setIndication(String indication) {
		this.indication = indication;
	}

	public String getDose() {
		return dose;
	}

	public void setDose(String dose) {
		this.dose = dose;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public String getSide_effect() {
		return side_effect;
	}

	public void setSide_effect(String side_effect) {
		this.side_effect = side_effect;
	}

	public String getAllergy() {
		return allergy;
	}

	public void setAllergy(String allergy) {
		this.allergy = allergy;
	}

	public String getPregnancy() {
		return pregnancy;
	}

	public void setPregnancy(String pregnancy) {
		this.pregnancy = pregnancy;
	}

	@Override
	public String toString() {
		return "DrugDTO [drug_code=" + drug_code + ", drug_name=" + drug_name + ", indication=" + indication + ", dose="
				+ dose + ", price=" + price + ", side_effect=" + side_effect + ", allergy=" + allergy + ", pregnancy="
				+ pregnancy + ", cnt=" + cnt + "]";
	}

}
