package com.EaSystem.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.EaSystem.beans.Account;
import com.EaSystem.beans.CalendarofWeek;
import com.EaSystem.beans.Course;
import com.EaSystem.mapper.ICalendarofWeekService;
import com.EaSystem.mapper.ICourseService;

@Controller
@SessionAttributes("Account")
@RequestMapping("/teachers")
public class TeachersController {
	@Resource
	private ICalendarofWeekService icalendarofweek;
	@Resource
	private ICourseService icourse;
	
	@RequestMapping(value="/home")
	public ModelAndView getTeachersHome(@ModelAttribute("Account")Account account, ModelMap model) {
		ModelAndView modelAndView = new ModelAndView("homeofTeachers");
		if(account!=null) {
			modelAndView.addObject("account", account);
			List<CalendarofWeek> calendarList = icalendarofweek.getCalendarofWeek();
			modelAndView.addObject("calendarList", calendarList);
			List<Course> courselist = icourse.getTeachersCourses(account.getId());
			modelAndView.addObject("courses", courselist);
			int thisday=0;
			modelAndView.addObject("thisday", thisday);
		}
		
		return modelAndView;
	}
	
	@RequestMapping(value="/selectweeks")
	public ModelAndView selectedweek(String selected, @ModelAttribute("Account")Account account, ModelMap model) {
		ModelAndView modelAndView = new ModelAndView("homeofTeachers");
		if(account!=null) {
			modelAndView.addObject("account", account);
			List<CalendarofWeek> calendarList = icalendarofweek.getCalendarofWeek();
			modelAndView.addObject("calendarList", calendarList);
			List<Course> courselist = icourse.getTeachersCourses(account.getId());
			modelAndView.addObject("courses", courselist);
			int thisday=Integer.parseInt(selected);
			modelAndView.addObject("thisday", thisday);
		}
		
		return modelAndView;
	}
}
