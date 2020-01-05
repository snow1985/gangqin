package com.mm.dao;

import java.util.List;

import com.mm.entity.Mainfee;

public interface MainfeeDao {

     Mainfee selectById(Integer id);
     List<Mainfee> selectAll();
     void addmainfee(Mainfee mainfee);
}
