package com.mm.entity;

import java.sql.Date;

/**
 * @author mzybobo
 *
 */
public class Dayfee {

	private Date date;
	/**
	 * 学号
	 */
	private Integer stuId;
	/**
	 * 当天费用
	 */
	private Integer fee;
	/**
	 * 总课时
	 */
	private Double hour;
	
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getStuId() {
		return stuId;
	}
	public void setStuId(int stuId) {
		this.stuId = stuId;
	}
	public int getFee() {
		return fee;
	}
	public void setFee(int fee) {
		this.fee = fee;
	}
	public Double getHour() {
		return hour;
	}
	public void setHour(Double hour) {
		this.hour = hour;
	}
	@Override
	public String toString() {
		return "Dayfee [date=" + date + ", stuId=" + stuId + ", fee=" + fee + ", hour=" + hour + "]";
	}
}
