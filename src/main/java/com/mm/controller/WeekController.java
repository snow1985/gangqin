package com.mm.controller;

import com.mm.entity.Week;
import com.mm.service.StudentService;
import com.mm.service.WeekService;
import com.mm.util.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class WeekController {
    @Autowired
    WeekService weekService;
    @Autowired
    StudentService ss;
    @ResponseBody
    @RequestMapping(value = "/weeks",method = RequestMethod.GET)
    public Msg selectAll(){
        Map<String,List<Week>> weeks=new HashMap<>();
        weeks=weekService.selectAll();
        return Msg.success().addMap("weeks",weeks);
    }
    @ResponseBody
    @RequestMapping(value = "week",method = RequestMethod.POST)
    public Msg addWeek(Week week){

        String name=week.getName();
        String[] idname=name.split("!");
        week.setId(Integer.parseInt(idname[0]));
        week.setName(idname[1]);
        //System.out.println(week);
        weekService.addWeek(week);
        return Msg.success();
    }

}
