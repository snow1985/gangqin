package com.mm.dao;

import java.util.List;

import com.mm.entity.Stu_simple;

public interface Stu_simpleDao {

	List<Stu_simple> selectById(Integer id);
	
	List<Stu_simple> selectSuccess(Integer id);
	
	List<Stu_simple> selectGiveup(Integer id);
	
	void addsimple(Stu_simple simple);
}
