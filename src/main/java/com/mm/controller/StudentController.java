package com.mm.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mm.entity.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


import com.mm.service.StudentService;
import com.mm.util.Msg;

import java.util.List;


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
    @RequestMapping(value = "/stu",method = RequestMethod.POST)
    public Msg addStu(Student student) {
    	
    	service.addStudent(student);
    	
    	System.out.println(student);
  	  return Msg.success();
  	  
    }
    @ResponseBody
    @RequestMapping(value = "/stu/{id}",method = RequestMethod.GET)
    public Msg selectStu(@PathVariable("id")Integer id) {
    	
    	Student stu = service.selectById(id);
    	
    	System.out.println(stu);
  	  return Msg.success().addMap("stu", stu);
  	  
    }
	@ResponseBody
	@RequestMapping(value = "/stus")
	public Msg stuAll(@RequestParam(value = "pn",defaultValue = "1")Integer pn) {

		List<Student> students = service.selectAll();

		PageHelper.startPage(pn,10);
		PageInfo<Student> pageInfo=new PageInfo<>(students,10);
		return Msg.success().addMap("pageInfo", pageInfo);

	}
	@ResponseBody
	@RequestMapping(value = "/stuss",method = RequestMethod.GET)
	public Msg stusimAll() {

		List<Student> students = service.selectAll();


		return Msg.success().addMap("students", students);

	}
	
	
}
