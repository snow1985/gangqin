package com.mm.controller;


import static org.junit.Assert.assertNotNull;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mm.dto.PlanDto;
import com.mm.entity.Planing;
import com.mm.service.PlanService;
import com.mm.util.Msg;

@Controller
public class PlanController {
	
    @Autowired
	private PlanService pService;
    
    @ResponseBody
    @RequestMapping(value = "/plans")
    public Msg selectplan(@RequestParam(value = "pn",defaultValue = "1")Integer pn) {
    	
    	PageHelper.startPage(pn,4);
    	
    	List<Planing> plans=pService.selectPlan();
    	
    	PageInfo<Planing> pageInfo=new PageInfo<Planing>(plans,4);
    	
    	
    	
  	  return Msg.success().addMap("pageInfo", pageInfo);
  	  
    }
    @ResponseBody
    @RequestMapping(value = "/plan/{pid}",method = RequestMethod.GET)
    public Msg selectplanid(@PathVariable("pid")Integer pid) {
    	Planing plan = pService.selectPlanId(pid);
    	return Msg.success().addMap("plan", plan);
    }
    @ResponseBody
    @RequestMapping(value = "/plan",method = RequestMethod.POST)
    public Msg addPlan(PlanDto planDto) {
    	SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd");
    	Planing plan=new Planing();
    	
    	Date startdate = null;
    	Date endDate=null;
		try {
			startdate = (java.sql.Date) sim.parse(planDto.getStartdate());
			endDate=(java.sql.Date) sim.parse(planDto.getEnddate());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//java.sql.Date date1 =new java.sql.Date(startdate.getTime());
		//java.sql.Date date2 =new java.sql.Date(endDate.getTime());
			plan.setStartdate(startdate);
			plan.setEnddate(endDate);
			plan.setPid(planDto.getPid());
			plan.setPlan(planDto.getPlan());
			plan.setState(planDto.getState());
	
    	
    	int p = pService.addPlan(plan);
    	
    	if (p==0) {
    		return Msg.success();
		}
    	return Msg.fail();
    }
    
    @ResponseBody
    @RequestMapping(value = "/plan/{pid}",method = RequestMethod.PUT)
    public Msg updateplan(Planing planing) {
    	int plan = pService.updatePlanId(planing);
    	if (plan==0) {
    		return Msg.success();
		}
    	return Msg.fail();
    }
    
}
