package com.mm.service;

import com.mm.dao.MainfeeDao;
import com.mm.dao.PayfeeDao;
import com.mm.dto.MainfeeDto;
import com.mm.entity.Mainfee;
import com.mm.entity.Payfee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PayfeeService {
    @Autowired
    private PayfeeDao payfeeDao;
    @Autowired
    private MainfeeDao mainfee;

    public void addPayfee(Payfee payfee){
        payfeeDao.addPayfee(payfee);

        MainfeeDto mfd=new MainfeeDto();
        mfd.setId(payfee.getId());
        mfd.setUnitprice(payfee.getUnitprice());
        mfd.setIncrease(payfee.getIncrease());

        mainfee.updateMain(mfd);

    }
}
