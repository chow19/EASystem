package com.EaSystem.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.EaSystem.beans.Classroom;

public interface IClassroomService {
	public List<Classroom> getAll();
	
	public Classroom getClassroom(@Param("classroomId")int classroomId);
}
