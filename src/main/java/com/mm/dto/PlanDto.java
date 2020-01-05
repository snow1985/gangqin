package com.mm.dto;

import java.sql.Date;

public class PlanDto {
	private Integer pid;
	/**
	 * 计划开始时间
	 */
	private String startdate;
	/**
	 * 计划结束时间
	 */
	private String enddate;
	/**
	 * 计划内容
	 */
	private String plan;
	/**
	 * 计划状态
	 */
	private String state;
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
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
	
}
