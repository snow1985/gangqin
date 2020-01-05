package com.mm.dao;

import java.util.List;

import com.mm.entity.Planing;

public interface PlaningDao {

	List<Planing> selectPlan();
	
	Planing selectById(Integer pid);
	
	int updatePlan(Planing plan);
	
	List<Planing> selectSuccess();
	
	List<Planing> selectGiveup();
	
	int addPlan(Planing planing);
}
