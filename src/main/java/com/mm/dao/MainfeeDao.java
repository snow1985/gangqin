package com.mm.dao;

import java.util.List;

import com.mm.dto.MainfeeDto;
import com.mm.entity.Mainfee;

public interface MainfeeDao {

     Mainfee selectById(Integer id);
     List<Mainfee> selectAll();
     int updateMain(MainfeeDto mainfeeDto);
     void updateMainfee(Integer id);
     void addmainfee(Mainfee mainfee);
}
