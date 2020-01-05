package com.mm.controller;



import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;




@Controller

public class BaseController {

	@RequestMapping("/week")
    public String week() {				
		return "week";
	}
	@RequestMapping("/addStudent")
    public String addStudent() {				
		return "addStudent";
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
}
