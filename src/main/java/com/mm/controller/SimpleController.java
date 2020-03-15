package com.mm.controller;

import com.mm.entity.Stu_simple;
import com.mm.entity.Student;
import com.mm.service.SimpleService;
import com.mm.util.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class SimpleController {
    @Autowired
    private SimpleService simpleService;
    @ResponseBody
    @RequestMapping("/simples")
    public Msg selectById(Integer id){
        List<Stu_simple> simples = simpleService.selectById(id);

        return Msg.success().addMap("simples",simples);

    }
    @ResponseBody
    @RequestMapping(value = "/simple/{id}",method = RequestMethod.GET)
    public Msg selectAll(@PathVariable("id")Integer id) {

        Stu_simple stu = simpleService.selectAll(id);

        System.out.println(stu);
        return Msg.success().addMap("stu", stu);

    }
}
