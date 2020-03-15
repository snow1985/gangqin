package com.mm.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mm.entity.Mainfee;
import com.mm.service.MainfeeService;
import com.mm.util.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
public class MainfeeController {

    @Autowired
    private MainfeeService mainfeeService;
    @ResponseBody
    @RequestMapping(value = "/main/{id}",method = RequestMethod.GET)
    public Msg selectById(@PathVariable("id")Integer id){
        Mainfee mainfee = mainfeeService.selectById(id);
        return Msg.success().addMap("mainfee",mainfee);
    }
    @ResponseBody
    @RequestMapping(value = "/main/{id}",method = RequestMethod.PUT)
    public Msg updateById(Mainfee mainfee){
        mainfeeService.updateMainfee(mainfee);
        return Msg.success().addMap("mainfee",mainfee);
    }
    @ResponseBody
    @RequestMapping("/mains")
    public Msg selectByAll(@RequestParam(value = "pn",defaultValue = "1")Integer pn){
        List<Mainfee> mains=new ArrayList<>();
        mains = mainfeeService.selectAll();
        PageHelper.startPage(pn,10);
        PageInfo<Mainfee> pageInfo=new PageInfo<>(mains,10);
        return Msg.success().addMap("pageInfo", pageInfo);
    }

}
