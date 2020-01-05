package com.mm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mm.dao.StudentDao;
import com.mm.entity.Student;

@Service
public class StudentService {
    @Autowired
	StudentDao sDao;
    
    public Student selectById(int id) {
    	
    	Student student = sDao.selectById(id);
    	
    	return student;
    }
    public List<Student> selectAll() {
    	
    	 List<Student> students = sDao.selectAll();
    	
    	return students;
    }
    
    public Student addStudent(Student student) {
    	try {
    		System.out.println(student);
    		sDao.addStudent(student);
		} catch (Exception e) {
			System.out.println("cuoleo");
		}
    	
    	
    	return student;
    }
}
