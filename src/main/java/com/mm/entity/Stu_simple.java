package com.mm.entity;

/**
 * @author mzybo
 *
 */
public class Stu_simple {

	private Integer id;
	
	private String name;
	/**
	 * 备注信息
	 */
	private String bak;
	/**
	 * 学习进度
	 */
	private String rate;
	/**
     *状态
     */
    private String state;


	public Mainfee getMainFee() {
		return mainFee;
	}

	public void setMainFee(Mainfee mainFee) {
		this.mainFee = mainFee;
	}

	private Mainfee mainFee;
	
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
	public String getBak() {
		return bak;
	}
	public void setBak(String bak) {
		this.bak = bak;
	}
	public String getRate() {
		return rate;
	}
	public void setRate(String rate) {
		this.rate = rate;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}

	
}
