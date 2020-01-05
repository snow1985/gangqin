package com.mm.entity;

import java.sql.Date;

/**
 * @author mzybo
 *
 */
public class Planing {
	private Integer pid;
	/**
	 * 计划开始时间
	 */
	private Date startdate;
	/**
	 * 计划结束时间
	 */
	private Date enddate;
	/**
	 * 计划内容
	 */
	private String plan;
	/**
	 * 计划状态
	 */
	private String state;
	
	public Date getStartdate() {
		return startdate;
	}
	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}
	public Date getEnddate() {
		return enddate;
	}
	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}
	public String getPlan() {
		return plan;
	}
	public void setPlan(String plan) {
		this.plan = plan;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
}
