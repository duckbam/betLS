package com.project.myticket.dto;

public class SoccerDTO {
	
	private String num;
	private String event;
	private String team;
	private double win;
	private double draw;
	private double lose;
	private String time;
	
	public void setNum(String num) {
		this.num = num;
	}
	
	public String getNum() {
		return num;
	}
	
	public String getEvent() {
		return event;
	}
	public void setEvent(String event) {
		this.event = event;
	}
	public String getTeam() {
		return team;
	}
	public void setTeam(String team) {
		this.team = team;
	}
	public double getWin() {
		return win;
	}
	public void setWin(double win) {
		this.win = win;
	}
	public double getDraw() {
		return draw;
	}
	public void setDraw(double draw) {
		this.draw = draw;
	}
	public double getLose() {
		return lose;
	}
	public void setLose(double lose) {
		this.lose = lose;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	

}
