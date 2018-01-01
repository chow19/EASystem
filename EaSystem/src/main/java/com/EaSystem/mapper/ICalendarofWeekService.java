package com.EaSystem.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.EaSystem.beans.CalendarofWeek;

public interface ICalendarofWeekService {
	public void setCofW(@Param("yearofName")int yearofName, @Param("weekofName")int weekofName , @Param("dayofMonday")Date dayofMonday, @Param("dayofTuesday")Date dayofTuesday, 
			@Param("dayofWednesday")Date dayofWednesday, @Param("dayofThursday")Date dayofThursday, @Param("dayofFriday")Date dayofFriday,
			@Param("dayofSaturday")Date dayofSaturday, @Param("dayofSunday")Date dayofSunday)throws Exception;
	
	public List<CalendarofWeek> getExCalendarofWeek();
	
	public List<CalendarofWeek> getCalendarofWeek();
}
