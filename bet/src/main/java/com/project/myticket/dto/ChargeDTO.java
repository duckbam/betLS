package com.project.myticket.dto;

public class ChargeDTO {
	private int num;
	private String id;
	private int chargeMoney;
	private String condi;
	
	public void setNum(int num) {
		this.num = num;
	}
	public int getNum() {
		return num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getChargeMoney() {
		return chargeMoney;
	}
	public void setChargeMoney(int chargeMoney) {
		this.chargeMoney = chargeMoney;
	}
	public String getCondi() {
		return condi;
	}
	public void setCondi(String condi) {
		this.condi = condi;
	}
	
	
}
