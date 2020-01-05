package com.mm.dao;

import java.sql.Date;
import java.util.List;

import com.mm.entity.Dayfee;

public interface DayfeeDao {

	Dayfee selectByDate(Date date);
	
	List<Dayfee> selectAll();
	
	void addDayfee(List<Dayfee> daylist);
}
