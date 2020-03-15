package com.mm.service;

import com.mm.dao.Stu_simpleDao;
import com.mm.entity.Stu_simple;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SimpleService {
    @Autowired
    private Stu_simpleDao ssSimple;

    public Stu_simple selectAll(Integer id){
        return  ssSimple.selectAll(id);
    }

    public List<Stu_simple> selectById(Integer id){
        return  ssSimple.selectById(id);
    }

    public List<Stu_simple> selectGiveup(){
        return  ssSimple.selectGiveup();
    }
    public List<Stu_simple> selectSuccess(){
        return  ssSimple.selectSuccess();
    }
}
