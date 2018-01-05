package com.EaSystem.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.EaSystem.beans.Account;
import com.EaSystem.beans.CalendarofWeek;
import com.EaSystem.beans.Class_Classroom;
import com.EaSystem.beans.Course;
import com.EaSystem.beans.Performance;
import com.EaSystem.mapper.ICalendarofWeekService;
import com.EaSystem.mapper.IClassClassroomService;
import com.EaSystem.mapper.ICourseService;
import com.EaSystem.mapper.IPerformanceService;

@Controller
@SessionAttributes("Account")
@RequestMapping("/students")
public class StudentsController {
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private HttpServletResponse response;
	@Resource
	private IPerformanceService iperformance;
	@Resource
	private ICourseService icourse;
	@Resource
	private ICalendarofWeekService icalendarofweek;
	@Resource
	private IClassClassroomService iclassclassroom;
	
	@RequestMapping()
	public ModelAndView getStudentsHome(@ModelAttribute("Account")Account account, ModelMap model) {
		ModelAndView modelAndView = new ModelAndView("homeofStudents");
		
		if(account!=null) {
			modelAndView.addObject("account", account);
			List<CalendarofWeek> calendarList = icalendarofweek.getCalendarofWeek();
			modelAndView.addObject("calendarList", calendarList);
			int thisweek=0;
			modelAndView.addObject("thisweek", thisweek);
			List<Performance> performancelist = new ArrayList<>();
			performancelist	= iperformance.getPerformancebystu(account.getId());
			modelAndView.addObject("performancelist", performancelist);
			Map<Integer,Course> coursesmap = new HashMap<>();
			Map<Date,List<Class_Classroom>> class_classroommap= new HashMap<>();
			if(!performancelist.isEmpty()) {
				int courseID;
				List<Class_Classroom> class_Classroom;
				for(int i=0,lenght=performancelist.size();i<lenght;i++) {
					courseID=performancelist.get(i).getClass_id();
					coursesmap.put(courseID, icourse.getCourse(courseID));
					class_Classroom = iclassclassroom.getClassandClassroom(courseID);
					if(!class_Classroom.isEmpty()) {
						for(int j=0,jlenght=class_Classroom.size();j<jlenght;j++) {
							if(class_classroommap.containsKey(class_Classroom.get(j).getClass_date())) {
								class_classroommap.get(class_Classroom.get(j).getClass_date()).add(class_Classroom.get(j));
							}else {
								class_classroommap.put(class_Classroom.get(j).getClass_date(), new ArrayList<Class_Classroom>());
								class_classroommap.get(class_Classroom.get(j).getClass_date()).add(class_Classroom.get(j));
							}
						}
					}
				}
			}
			modelAndView.addObject("coursesmap", coursesmap);
			modelAndView.addObject("class_classroommap", class_classroommap);
		}
		
		return modelAndView;
	}
	
	@RequestMapping(value="/selectweeks")
	public ModelAndView selectedweek(@ModelAttribute("Account")Account account, ModelMap model, String selected) {
		ModelAndView modelAndView = new ModelAndView("homeofStudents");
		
		if(account!=null) {
			modelAndView.addObject("account", account);
			List<CalendarofWeek> calendarList = icalendarofweek.getCalendarofWeek();
			modelAndView.addObject("calendarList", calendarList);
			int thisweek=Integer.parseInt(selected);
			modelAndView.addObject("thisweek", thisweek-1);
			List<Performance> performancelist = new ArrayList<>();
			performancelist	= iperformance.getPerformancebystu(account.getId());
			modelAndView.addObject("performancelist", performancelist);
			Map<Integer,Course> coursesmap = new HashMap<>();
			Map<Date,List<Class_Classroom>> class_classroommap= new HashMap<>();
			if(!performancelist.isEmpty()) {
				int courseID;
				List<Class_Classroom> class_Classroom;
				for(int i=0,lenght=performancelist.size();i<lenght;i++) {
					courseID=performancelist.get(i).getClass_id();
					coursesmap.put(courseID, icourse.getCourse(courseID));
					class_Classroom = iclassclassroom.getClassandClassroom(courseID);
					if(!class_Classroom.isEmpty()) {
						for(int j=0,jlenght=class_Classroom.size();j<jlenght;j++) {
							if(class_classroommap.containsKey(class_Classroom.get(j).getClass_date())) {
								class_classroommap.get(class_Classroom.get(j).getClass_date()).add(class_Classroom.get(j));
							}else {
								class_classroommap.put(class_Classroom.get(j).getClass_date(), new ArrayList<Class_Classroom>());
								class_classroommap.get(class_Classroom.get(j).getClass_date()).add(class_Classroom.get(j));
							}
						}
					}
				}
			}
			modelAndView.addObject("coursesmap", coursesmap);
			modelAndView.addObject("class_classroommap", class_classroommap);
		}
		
		return modelAndView;
	}
}
