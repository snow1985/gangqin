package com.mm.dao;

import java.util.List;

import com.mm.entity.Payfee;

public interface PayfeeDao {

	List<Payfee> selectById(Integer id);
	
	void addPayfee(Payfee payfee);
	
}
