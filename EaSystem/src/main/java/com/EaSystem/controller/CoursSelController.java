package com.EaSystem.controller;

import java.util.ArrayList;
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
import com.EaSystem.beans.Class_Classroom;
import com.EaSystem.beans.Course;
import com.EaSystem.beans.Performance;
import com.EaSystem.beans.Users;
import com.EaSystem.mapper.IAccountService;
import com.EaSystem.mapper.ICourseService;
import com.EaSystem.mapper.IPerformanceService;
import com.EaSystem.mapper.IUsersService;

@Controller
@SessionAttributes("Account")
@RequestMapping("/coursesSelect")
public class CoursSelController {
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private HttpServletResponse response;
	@Resource
	private IPerformanceService iperformance;
	@Resource
	private ICourseService icourse;
	@Resource
	private IUsersService iusers;
	
	@RequestMapping()
	public ModelAndView getCoursSel(@ModelAttribute("Account")Account account, ModelMap model) {
		ModelAndView modelAndView = new ModelAndView("coursesSelect");
		
		List<Performance> performancelist = new ArrayList<>();
		performancelist	= iperformance.getPerformancebystu(account.getId());
		modelAndView.addObject("performancelist", performancelist);
		Map<Integer,Course> coursesmap = new HashMap<>();
		Map<Integer,String> teachersnamemap = new HashMap<>();
		Course courseSearch = null;
		if(!performancelist.isEmpty()) {
			int courseID;
			Course course;
			List<Class_Classroom> class_Classroom;
			for(int i=0,lenght=performancelist.size();i<lenght;i++) {
				courseID = performancelist.get(i).getClass_id();
				course = icourse.getCourse(courseID);
				coursesmap.put(courseID, course);
				Users users = iusers.getUser(course.getTeacher_id());
				teachersnamemap.put(course.getTeacher_id(), users.getFirstname()+users.getLastname());
			}
		}
		modelAndView.addObject("coursesmap", coursesmap);
		modelAndView.addObject("teachersnamemap", teachersnamemap);
		modelAndView.addObject("courseSearch", courseSearch);
		
		return modelAndView;
	}
	
	@RequestMapping(value="/search")
	public ModelAndView getSearch(@ModelAttribute("Account")Account account, ModelMap model, String course_ID) {
		ModelAndView modelAndView = new ModelAndView("coursesSelect");
		
		List<Performance> performancelist = new ArrayList<>();
		performancelist	= iperformance.getPerformancebystu(account.getId());
		modelAndView.addObject("performancelist", performancelist);
		Map<Integer,Course> coursesmap = new HashMap<>();
		Map<Integer,String> teachersnamemap = new HashMap<>();
		Course courseSearch = null;
		String searchTeacherName = null;
		if(!performancelist.isEmpty()) {
			int courseID;
			Course course;
			List<Class_Classroom> class_Classroom;
			for(int i=0,lenght=performancelist.size();i<lenght;i++) {
				courseID = performancelist.get(i).getClass_id();
				course = icourse.getCourse(courseID);
				coursesmap.put(courseID, course);
				Users users = iusers.getUser(course.getTeacher_id());
				teachersnamemap.put(course.getTeacher_id(), users.getFirstname()+users.getLastname());
			}
		}
		modelAndView.addObject("coursesmap", coursesmap);
		modelAndView.addObject("teachersnamemap", teachersnamemap);
		if(Integer.parseInt(course_ID)>=10000) {
			courseSearch = icourse.getCourse(Integer.parseInt(course_ID));
			Users usersSearch = iusers.getUser(courseSearch.getTeacher_id());
			searchTeacherName = usersSearch.getFirstname()+usersSearch.getLastname();
		}
		modelAndView.addObject("courseSearch", courseSearch);
		modelAndView.addObject("searchTeacherName", searchTeacherName);
		
		return modelAndView;
	}
	
	@RequestMapping("/selected")
	public ModelAndView selected(@ModelAttribute("Account")Account account, ModelMap model, String courseSelected) {
		ModelAndView modelAndView = new ModelAndView("redirect:/coursesSelect");
		
		int flag1 = icourse.addExit(Integer.parseInt(courseSelected));
		if(flag1 == 1) {
			try {
				iperformance.addPerformamce(Integer.parseInt(courseSelected), account.getId());	
			} catch (Exception e) {
				icourse.downExit(Integer.parseInt(courseSelected));
				e.printStackTrace();
			}
		}
		
		return modelAndView;
	}
}
