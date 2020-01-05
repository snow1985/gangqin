package com.mm.dto;

import org.hibernate.validator.constraints.NotBlank;

public class StudentDto {
	
  @NotBlank(message = "不能为空")
  private int id;

public int getId() {
	return id;
}

public void setId(int id) {
	this.id = id;
}
}
