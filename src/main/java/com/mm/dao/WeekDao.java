package com.mm.dao;


import com.mm.entity.Week;

import java.util.List;


public interface WeekDao {

	List<Week> selectByWeek(Week week);

	void addWeek(Week week);
	
	List<Week> selectAll();

	void deleteWeek(Week week);

}
