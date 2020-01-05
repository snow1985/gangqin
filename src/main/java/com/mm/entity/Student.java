package com.mm.entity;

import java.util.Arrays;

/**
 * @author mzybobo
 *
 */
public class Student {
	/**
     *
	 */
	private Integer id;
	/**
	 *年龄
	 */
	private String name;
	
	private Integer age;
	/**
	 *地址
	 */
	private String address;
	/**
	 *
	 */
	private byte[] photo;
	/**
	 *详细信息
	 */
	private String information;
	/**
	 *备注
	 */
	private String bak;
	
	private Mainfee mainFee;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public byte[] getPhoto() {
		return photo;
	}

	public void setPhoto(byte[] photo) {
		this.photo = photo;
	}

	public String getInformation() {
		return information;
	}

	public void setInformation(String information) {
		this.information = information;
	}

	public String getBak() {
		return bak;
	}

	public void setBak(String bak) {
		this.bak = bak;
	}

	

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	@Override
	public String toString() {
		return "Student [id=" + id + ", name=" + name + ", age=" + age + ", address=" + address + ", photo="
				+ Arrays.toString(photo) + ", information=" + information + ", bak=" + bak + "]";
	}

	public Mainfee getMainFee() {
		return mainFee;
	}

	public void setMainFee(Mainfee mainFee) {
		this.mainFee = mainFee;
	}
}
