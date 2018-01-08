package com.EaSystem.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.EaSystem.beans.Class_Classroom;

public interface IClassClassroomService {
	public List<Class_Classroom> getAll();
	
	public List<Class_Classroom> getClassandClassroom(@Param("classID")int classID);
	
	public void delClass_Classroom(@Param("courseId")int CourseId);
	
	public void addClass_Classroom(@Param("class_date")Date class_date, @Param("class_order")int class_order, @Param("classroom")String classroom, @Param("class_id")int class_id);
}
