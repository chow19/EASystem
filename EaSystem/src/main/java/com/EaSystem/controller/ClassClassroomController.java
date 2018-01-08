package com.EaSystem.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.EaSystem.beans.Account;
import com.EaSystem.beans.CalendarofWeek;
import com.EaSystem.java.DataListUtil;
import com.EaSystem.java.POIUtil;
import com.EaSystem.mapper.ICalendarofWeekService;
import com.EaSystem.mapper.IClassClassroomService;
import com.EaSystem.mapper.IClassroomService;
import com.EaSystem.mapper.ICourseService;
import com.EaSystem.beans.Class_Classroom;

@Controller
@SessionAttributes("Account")
@RequestMapping("/ClassCLassroom")
public class ClassClassroomController {
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private HttpServletResponse response;
	@Resource
	private ICalendarofWeekService icalendarofweek;
	@Resource
	private IClassroomService iclassroom;
	@Resource
	private ICourseService icourse;
	@Resource
	private IClassClassroomService iclassclassroom;
	
	private static Date getDateofweek(CalendarofWeek calendarofWeek, int day) {
		Date date = null;
		switch (day) {
		case 1:
			return calendarofWeek.getDayofMonday();
		case 2:
			return calendarofWeek.getDayofTuesday();
		case 3:
			return calendarofWeek.getDayofWednesday();
		case 4:
			return calendarofWeek.getDayofThursday();
		case 5:
			return calendarofWeek.getDayofFriday();
		case 6:
			return calendarofWeek.getDayofSaturday();
		case 7:
			return calendarofWeek.getDayofSunday();
		default:
			return date;
		}
	}
	
	public static String getDescription(int KSZ, int JSZ, int ZL, int XQ, int JC) {
		String description="第"+KSZ+"--"+JSZ+"周";
		switch (ZL) {
		case 1:
			description+=" 单周";
			break;
		case 2:
			description+=" 双周";
		default:
			break;
		}
		switch (XQ) {
		case 1:
			description+=" 星期一";
			break;
		case 2:
			description+=" 星期二";
			break;
		case 3:
			description+=" 星期三";
			break;
		case 4:
			description+=" 星期四";
			break;
		case 5:
			description+=" 星期五";
			break;
		case 6:
			description+=" 星期六";
			break;
		default:
			description+=" 星期日";
			break;
		}
		
		description+=" 第"+JC+"节";
		
		return description;
	}
	
	@RequestMapping(value="/downloadExcel")
	public void downloadExcel(@ModelAttribute("Account")Account account, ModelMap model) {
		
		List<Map<String, Object>> headInfoList = new ArrayList<Map<String,Object>>();
		Map<String, Object> itemMap = new HashMap<String, Object>();
		itemMap.put("title", "课号");   
        itemMap.put("columnWidth", 50);   
        headInfoList.add(itemMap);
        itemMap = new HashMap<String, Object>();
		itemMap.put("title", "开始周");   
        itemMap.put("columnWidth", 20);   
        headInfoList.add(itemMap);
        itemMap = new HashMap<String, Object>();
		itemMap.put("title", "结束周");   
        itemMap.put("columnWidth", 20);   
        headInfoList.add(itemMap);
        itemMap = new HashMap<String, Object>();
		itemMap.put("title", "周类");   
        itemMap.put("columnWidth", 20);   
        headInfoList.add(itemMap);
        itemMap = new HashMap<String, Object>();
		itemMap.put("title", "星期");   
        itemMap.put("columnWidth", 20);   
        headInfoList.add(itemMap);
        itemMap = new HashMap<String, Object>();
		itemMap.put("title", "节次");   
        itemMap.put("columnWidth", 20);   
        headInfoList.add(itemMap);
        itemMap = new HashMap<String, Object>();
		itemMap.put("title", "教室号");   
        itemMap.put("columnWidth", 20);   
        headInfoList.add(itemMap);
        List<Map<String, Object>> dataList = new ArrayList<Map<String,Object>>();
        
        String sheetName = "空白课表";
        String filePath = request.getSession().getServletContext().getRealPath("/WEB-INF/xls")+"\\"+sheetName+".xls";
        try {
        	POIUtil.exportExcel2FilePath(sheetName,filePath, headInfoList, dataList);
        	response.setCharacterEncoding("utf-8");  
            response.setContentType("multipart/form-data");  
            response.setHeader("Content-Disposition", "attachment;fileName="+sheetName+"成绩表.xls");
            InputStream inputStream = new FileInputStream(filePath);
            OutputStream os = response.getOutputStream();
			byte[] b = new byte[2048];
			int length;
			while ((length = inputStream.read(b)) > 0) {
				os.write(b, 0, length);
			}
			os.close();
			
			inputStream.close();
			
			File file = new File(filePath);
			file.delete();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * ZL 周类 0为不分类 1为单周 2为双周
	 */
	@RequestMapping(value="/uploadExcel")
	public ModelAndView uploadExcel(@ModelAttribute("Account")Account account, ModelMap model, @RequestParam("xlsfile")CommonsMultipartFile  xlsfile) {
		ModelAndView modelAndView = new ModelAndView("redirect:/manager");
		
		if(!xlsfile.isEmpty()) {
			try {
				InputStream inputStream = xlsfile.getInputStream(); 			
				HSSFWorkbook hssfWorkbook = new HSSFWorkbook(inputStream);
				List<String> dataKey = new ArrayList<>();
				dataKey.add("KH");
				dataKey.add("KSZ");
				dataKey.add("JSZ");
				dataKey.add("ZL");
				dataKey.add("XQ");
				dataKey.add("JC");
				dataKey.add("JSH");
				int linenum = 7;
				List<Map<String, Integer>> dataList = DataListUtil.getDataList(hssfWorkbook, linenum, dataKey);
				Map<Integer, List<Class_Classroom>> idClassClassroommap = new HashMap<>();
				Map<Integer, String> courseDescriptionmap = new HashMap<>();
				List<Class_Classroom> class_Classroomlist;
				Class_Classroom class_Classroom;
				Date class_date;
				rowTraversal: for(int i=0, lenght=dataList.size();i<lenght;i++) {
	            	//dataList为表内每一行的map集
					class_Classroomlist = new ArrayList<>();
	            	for(int startweek=dataList.get(i).get("KSZ"), endweek=dataList.get(i).get("JSZ");startweek<=endweek;startweek++) {
	            		class_date = getDateofweek(icalendarofweek.getWeek(startweek), dataList.get(i).get("XQ"));
	            		if(class_date==null) {
	            			continue rowTraversal;
	            		}
	            		int class_order = dataList.get(i).get("JC");
	            		if(class_order<1||class_order>10) {
	            			continue rowTraversal;
	            		}
	            		String classroom = iclassroom.getClassroom(dataList.get(i).get("JSH")).getRoomname();
	            		if(classroom==null) {
	            			continue rowTraversal;
	            		}
	            		int class_id = dataList.get(i).get("KH");
	            		if(icourse.getCourse(class_id)==null) {
	            			continue rowTraversal;
	            		}
	            		
	            		class_Classroom = new Class_Classroom();
	            		class_Classroom.setClass_date(class_date);
	            		class_Classroom.setClass_id(class_id);
	            		class_Classroom.setClass_order(class_order);
	            		class_Classroom.setClassroom(classroom);
	            		
	            		switch(dataList.get(i).get("ZL")) {
	            		case 0:
	            			if(idClassClassroommap.containsKey(class_id)) {
	            				idClassClassroommap.get(class_id).add(class_Classroom);
	            			}else {
	            				class_Classroomlist = new ArrayList<>();
	            				class_Classroomlist.add(class_Classroom);
	            				idClassClassroommap.put(class_id, class_Classroomlist);
	            			}
	            			break;
	            		case 1:
	            			if(startweek%2!=0) {
	            				if(idClassClassroommap.containsKey(class_id)) {
		            				idClassClassroommap.get(class_id).add(class_Classroom);
		            			}else {
		            				class_Classroomlist = new ArrayList<>();
		            				class_Classroomlist.add(class_Classroom);
		            				idClassClassroommap.put(class_id, class_Classroomlist);
		            			}
	            			}
	            			break;
	            		case 2:
	            			if(startweek%2==0) {
	            				if(idClassClassroommap.containsKey(class_id)) {
		            				idClassClassroommap.get(class_id).add(class_Classroom);
		            			}else {
		            				class_Classroomlist = new ArrayList<>();
		            				class_Classroomlist.add(class_Classroom);
		            				idClassClassroommap.put(class_id, class_Classroomlist);
		            			}
	            			}
	            			break;
	            		default :
	            			continue rowTraversal;
	            		}
	            	}
	            	String description = getDescription(dataList.get(i).get("KSZ"), dataList.get(i).get("JSZ"), dataList.get(i).get("ZL"), dataList.get(i).get("XQ"), dataList.get(i).get("JC"));
	            	if(courseDescriptionmap.containsKey(dataList.get(i).get("KH"))) {
	            		courseDescriptionmap.put(dataList.get(i).get("KH"), courseDescriptionmap.get(dataList.get(i).get("KH"))+"  "+description);
	            	}else{
	            		courseDescriptionmap.put(dataList.get(i).get("KH"), description);
	            	}
				}
				
				if(!idClassClassroommap.isEmpty()) {
					for(int key : idClassClassroommap.keySet()) {
						iclassclassroom.delClass_Classroom(key);
						List<Class_Classroom> class_Classrooms = idClassClassroommap.get(key);
						for(Class_Classroom cc : class_Classrooms) {
							iclassclassroom.addClass_Classroom(cc.getClass_date(), cc.getClass_order(), cc.getClassroom(), cc.getClass_id());
						}
						icourse.updateDescription(key, courseDescriptionmap.get(key));
					}
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		return modelAndView;
	}
}
