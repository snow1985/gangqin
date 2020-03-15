package com.mm.entity;

import java.sql.Date;

/**
 * @author mzybo
 */
public class Payfee {

	private Integer id;
	
    private String name;
    /**
     * 原课单价
     */
    private Integer hisprice;
    /**
     * 新课单价
     */
    private Integer unitprice;
    /**
     * 缴费金额
     */
    private Integer increase;
    /**
     * 修改日期
     */
    private Date date;
    
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
	public int getHisprice() {
		return hisprice;
	}
	public void setHisprice(int hisprice) {
		this.hisprice = hisprice;
	}
	public int getUnitprice() {
		return unitprice;
	}
	public void setUnitprice(int unitprice) {
		this.unitprice = unitprice;
	}
	public int getIncrease() {
		return increase;
	}
	public void setIncrease(int increase) {
		this.increase = increase;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
}
