package com.mm.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mm.dao.PlaningDao;
import com.mm.entity.Planing;

@Service
public class PlanService {
	
    @Autowired
	private PlaningDao planDao;
	
	public List<Planing> selectPlan() {
		List<Planing> plans=new ArrayList<Planing>();
		plans = planDao.selectPlan();
		
		return plans;
	}
	public Planing selectPlanId(Integer pid) {
		
		Planing plan= planDao.selectById(pid);
		
		return plan;
	}
    public int updatePlanId(Planing plan) {
		
		int updatePlan = planDao.updatePlan(plan);
		
		return updatePlan;
	}
    
    public int addPlan(Planing plan) {
		
		int addPlan = planDao.addPlan(plan);
		
		return addPlan;
	}
    
}
