package com.mm.controller;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mm.dto.StudentDto;
import com.mm.entity.Student;
import com.mm.service.StudentService;
import com.mm.util.Msg;



@Controller
public class StudentController {
	@Autowired
    StudentService service;

	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping("/Student") public Student getStu(@RequestBody @Valid
	 * StudentDto sDto) {
	 * 
	 * Student student=service.selectById(sDto.getId());
	 * 
	 * return student; }
	 */
	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping("/Student") public List<Student> getAllStu() {
	 * 
	 * List<Student> students = new ArrayList<Student>();
	 * students=service.selectAll();
	 * 
	 * return students; }
	 * 
	 * public void addStudent(Student student) { service.addStudent(student); }
	 */
    
    @ResponseBody
    @RequestMapping(value = "/student")
    public Msg addStu(Student student) {
    	
    	service.addStudent(student);
    	
    	System.out.println(student);
  	  return Msg.success();
  	  
    }
    @ResponseBody
    @RequestMapping(value = "/selectstu")
    public Msg selectStu(Student student) {
    	
    	Student stu = service.selectById(student.getId());
    	
    	System.out.println(stu);
  	  return Msg.success().addMap("stu", stu);
  	  
    }
	
	
}
