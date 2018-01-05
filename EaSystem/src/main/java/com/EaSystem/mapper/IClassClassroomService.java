package com.EaSystem.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.EaSystem.beans.Class_Classroom;

public interface IClassClassroomService {
	public List<Class_Classroom> getAll();
	
	public List<Class_Classroom> getClassandClassroom(@Param("classID")int classID);

}
