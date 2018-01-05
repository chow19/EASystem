package com.EaSystem.controller;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.EaSystem.beans.Account;
import com.EaSystem.beans.CalendarofWeek;
import com.EaSystem.java.CalendarofWeekUtils;
import com.EaSystem.java.CalendarofWeekUtils.DayModel;
import com.EaSystem.java.CalendarofWeekUtils.WeekModel;
import com.EaSystem.java.CalendarofWeekUtils.YearModel;
import com.EaSystem.mapper.ICalendarofWeekService;

@Controller
@SessionAttributes("Account")
@RequestMapping("/manager")
public class ManagerController {
	@Resource
	private ICalendarofWeekService icalendarofweek;
	
	@RequestMapping()
	public ModelAndView getManagerHome(@ModelAttribute("Account")Account account,ModelMap model) {
		ModelAndView modelandview = new ModelAndView("homeofManagers");
		if(account != null) {
			modelandview.addObject("account", account);
			try {
				List<CalendarofWeek> calendarofweekList = icalendarofweek.getExCalendarofWeek();
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
				String beginDate = simpleDateFormat.format(calendarofweekList.get(0).getDayofMonday());
				String endDate = simpleDateFormat.format(calendarofweekList.get(1).getDayofSunday());
				modelandview.addObject("beginDate", beginDate);
				modelandview.addObject("endDate", endDate);					
			} catch (Exception e) {
				modelandview.addObject("beginDate", "none");
				modelandview.addObject("endDate", "none");		
			}			
		}
		
		return modelandview;
	}
	
	public class ManagerUpdateData extends CalendarofWeekUtils {
		
		public String managerUpdateData(String beginDate, String endDate, ICalendarofWeekService icalendarofweek) {
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
			return "redirect:/login/role";
		}
	}
	@RequestMapping(value="/managerUpdateData")
	public String ManagerUpdateDataController(String beginDate, String endDate) {
		ManagerUpdateData mud = new ManagerUpdateData();
		return mud.managerUpdateData(beginDate, endDate, icalendarofweek);
	}
	
	
	
}
