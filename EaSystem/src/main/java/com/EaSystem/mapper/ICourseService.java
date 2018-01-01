package com.EaSystem.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.EaSystem.beans.Course;

public interface ICourseService {
	public List<Course> getAll();
	
	public List<Course> getTeachersCourses(@Param("teachersID")int teachersID);
}
