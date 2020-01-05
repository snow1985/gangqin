package com.mm.util;

import java.util.HashMap;
import java.util.Map;



public class Msg {
	   private int code;
	   private String message;
	   private Map<String,Object> extend=new HashMap<String,Object> ();
	   public static Msg success() {
		   Msg result=new Msg();
		   result.setCode(150);
		   result.setMessage("成功");
		return result;
	}
	   
	   public static Msg fail() {
		   Msg result=new Msg();
		   result.setCode(300);
		   result.setMessage("失败");
		return result;
	}
	   public  Msg addMap(String key,Object value) {
	           this.getExtend().put(key, value);
		   return this;
	}
	   
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Map<String, Object> getExtend() {
		return extend;
	}
	public void setExtend(Map<String, Object> extend) {
		this.extend = extend;
	}
}
