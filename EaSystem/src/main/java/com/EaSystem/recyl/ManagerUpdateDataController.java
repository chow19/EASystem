package com.EaSystem.recyl;

import com.EaSystem.java.CalendarofWeekUtils;
import com.EaSystem.java.WeekCalendarUtils;
import com.EaSystem.java.WeekCalendarUtils.DayModel;
import com.EaSystem.java.WeekCalendarUtils.MonthModel;
import com.EaSystem.java.WeekCalendarUtils.WeekModel;
import com.EaSystem.mapper.ICalendarofWeekService;

import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.time.DateUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

/*@Controller
@RequestMapping("/managerUpdateData")
public class ManagerUpdateDataController extends CalendarofWeekUtils {
	@Resource
	private ICalendarofWeekService icalendarofweek;
	
	@RequestMapping()
	public String managerUpdateData(String beginDate, String endDate) {
		Map<Integer, YearModel> yearMap = get(beginDate, endDate, true);
		
		for (YearModel years : yearMap.values()) {
			Map<String, WeekModel> weekMap = years.getWeeks();
				
			for (WeekModel weeks : weekMap.values()) {
				Map<String, DayModel> dayMap = weeks.getDays();
				DayModel[] dayofWeek = new DayModel[7];
				int i=0;
				
				for (DayModel days : dayMap.values()) {
					dayofWeek[i] = days;
					i++;
				}
				try {
					icalendarofweek.setCofW(years.getYearName(), weeks.getWeekName(), dayofWeek[0].getDate(), dayofWeek[1].getDate(), dayofWeek[2].getDate(), dayofWeek[3].getDate(), dayofWeek[4].getDate(), dayofWeek[5].getDate(), dayofWeek[6].getDate());
				}catch (Exception e) {
					// TODO: handle exception
				}
			}
		}
		return "forward:/login/role";
	}
}*/
