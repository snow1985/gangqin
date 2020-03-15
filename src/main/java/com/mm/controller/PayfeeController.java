package com.mm.controller;

import com.mm.entity.Payfee;
import com.mm.service.PayfeeService;
import com.mm.util.Msg;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class PayfeeController {

    private PayfeeService payfeeService;
    @ResponseBody
    @RequestMapping(value = "/payfee",method = RequestMethod.POST)
    public Msg addPayfee(Payfee payfee){
        payfeeService.addPayfee(payfee);
        return Msg.success();
    }
}
