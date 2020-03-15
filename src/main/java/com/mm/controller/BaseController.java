package com.mm.controller;



import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;





@Controller

public class BaseController {

	@RequestMapping("/week")
    public String week() {				
		return "week";
	}
	@RequestMapping("/student")
    public String student() {
		return "student";
	}
	@RequestMapping("/plan")
    public String plan() {				
		return "plan";
	}
	@RequestMapping("/history")
    public String history() {				
		return "history";
	}
	@RequestMapping("/addfee")
    public String addfee() {				
		return "addfee";
	}
	@RequestMapping("/weekplan")
	public String weekplan(){return "weekplan";}
}
