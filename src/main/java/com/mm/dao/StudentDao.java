package com.mm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.datasource.DataSourceException;

import com.mm.entity.Student;

public interface StudentDao {

	Student selectById(@Param("id") int id);
	
	List<Student> selectAll();
	
	void addStudent(Student student) throws DataSourceException;
}
