package com.EaSystem.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.EaSystem.beans.Performance;

public interface IPerformanceService {
	public List<Performance> getAll();
	
	public List<Performance> getPerformance(@Param("id")int id);
	
	public List<Performance> getPerformancebystu(@Param("id")int id);
	
	public void changePerForForm(@Param("course_id")int course_id, @Param("cstudent_id")int cstudent_id, @Param("cdaily_achievement")int cdaily_achievement, @Param("ctest_scores")int ctest_scores, @Param("cfinal_scores")int cfinal_scores, @Param("ccredit")int ccredit );
}
