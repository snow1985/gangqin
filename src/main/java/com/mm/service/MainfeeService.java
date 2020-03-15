package com.mm.service;

import com.mm.dao.MainfeeDao;
import com.mm.entity.Mainfee;
import com.mm.util.State;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.time.Instant;
import java.time.LocalDate;
import java.util.List;

@Service
public class MainfeeService {
    @Autowired
    private MainfeeDao mainfeeDao;

    public Mainfee selectById(Integer id){

        return mainfeeDao.selectById(id);
    }

    public List<Mainfee> selectAll(){
        return mainfeeDao.selectAll();
    }

    public void updateMainfee(Mainfee mainfee){
                   Mainfee yl=mainfeeDao.selectById(mainfee.getId());
        boolean change=yl.getUnitprice().equals(mainfee.getUnitprice());
        if(!change){
            yl.setUnitprice(mainfee.getUnitprice());
            yl.setState(State.STATE_SHENGXIAO);
            Date date= new Date(System.currentTimeMillis());
            yl.setModifydate(date);
            mainfeeDao.updateMainfee(mainfee.getId());
            mainfeeDao.addmainfee(yl);

        }

    }
}
