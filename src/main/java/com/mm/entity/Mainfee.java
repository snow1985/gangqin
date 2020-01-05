package com.mm.entity;

import java.sql.Date;

/**
 *
 */
public class Mainfee {
     private Integer id;
     
     private String name;
     /**
     *课单价
     */     
     private Integer unitprice;
     /**
      *剩余课时
      */
     private Double surplushour;
     /**
      *剩余费用
      */
     private Integer surplusfee;
     /**
      *历史课时
      */
     private Double hishour;
     /**
      *历史费用
      */
     private Integer hisfee;
     /**
      *更改日期
      */
     private Date modifydate;
     /**
      *状态
      */
     private String state;
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
	public int getUnitprice() {
		return unitprice;
	}
	public void setUnitprice(int unitprice) {
		this.unitprice = unitprice;
	}
	
	public Double getSurplushour() {
		return surplushour;
	}
	public void setSurplushour(Double surplushour) {
		this.surplushour = surplushour;
	}
	public int getSurplusfee() {
		return surplusfee;
	}
	public void setSurplusfee(int surplusfee) {
		this.surplusfee = surplusfee;
	}
	public Double getHishour() {
		return hishour;
	}
	public void setHishour(Double hishour) {
		this.hishour = hishour;
	}
	public int getHisfee() {
		return hisfee;
	}
	public void setHisfee(int hisfee) {
		this.hisfee = hisfee;
	}
	public Date getModifydate() {
		return modifydate;
	}
	public void setModifydate(Date modifydate) {
		this.modifydate = modifydate;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
}
