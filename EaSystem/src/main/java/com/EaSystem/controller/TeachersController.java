package com.EaSystem.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
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
import com.EaSystem.beans.Course;
import com.EaSystem.beans.Performance;
import com.EaSystem.java.HssCellGetValueUtil;
import com.EaSystem.java.POIUtil;
import com.EaSystem.mapper.ICalendarofWeekService;
import com.EaSystem.mapper.ICourseService;
import com.EaSystem.mapper.IPerformanceService;

@Controller
@SessionAttributes("Account")
@RequestMapping("/teachers")
public class TeachersController {
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private HttpServletResponse response;
	@Resource
	private ICalendarofWeekService icalendarofweek;
	@Resource
	private ICourseService icourse;
	@Resource
	private IPerformanceService iperformance;
	
	@RequestMapping()
	public ModelAndView getTeachersHome(@ModelAttribute("Account")Account account, ModelMap model) {
		ModelAndView modelAndView = new ModelAndView("homeofTeachers");
		if(account!=null) {
			modelAndView.addObject("account", account);
			List<CalendarofWeek> calendarList = icalendarofweek.getCalendarofWeek();
			modelAndView.addObject("calendarList", calendarList);
			List<Course> courselist = icourse.getTeachersCourses(account.getId());
			modelAndView.addObject("courses", courselist);
			int thisweek=0;
			modelAndView.addObject("thisweek", thisweek);
			List<Performance> performancelist = new ArrayList<Performance>();
			int selectedCourse = -1;
			if(courselist.size()!=0) {
				selectedCourse = courselist.get(0).getId();
				performancelist = iperformance.getPerformance(selectedCourse);
			}
			modelAndView.addObject("selectedCourse", selectedCourse);
			modelAndView.addObject("performancelist", performancelist);
		}
		
		return modelAndView;
	}
	
	@RequestMapping(value="/selectweeks")
	public ModelAndView selectedweek(@ModelAttribute("Account")Account account, ModelMap model, String selected) {
		ModelAndView modelAndView = new ModelAndView("homeofTeachers");
		if(account!=null) {
			modelAndView.addObject("account", account);
			List<CalendarofWeek> calendarList = icalendarofweek.getCalendarofWeek();
			modelAndView.addObject("calendarList", calendarList);
			List<Course> courselist = icourse.getTeachersCourses(account.getId());
			modelAndView.addObject("courses", courselist);
			int thisweek=Integer.parseInt(selected);
			modelAndView.addObject("thisweek", thisweek-1);
			List<Performance> performancelist = new ArrayList<Performance>();
			int selectedCourse = -1;
			if(courselist.size()!=0) {
				selectedCourse = courselist.get(0).getId();
				performancelist = iperformance.getPerformance(selectedCourse);
			}
			modelAndView.addObject("selectedCourse", selectedCourse);
			modelAndView.addObject("performancelist", performancelist);
 		}
		
		return modelAndView;
	}
	
	@RequestMapping(value="changeCourse")
	public ModelAndView changeCourse(@ModelAttribute("Account")Account account, ModelMap model, String select) {
		ModelAndView modelAndView = new ModelAndView("homeofTeachers");
		if(account!=null) {
			modelAndView.addObject("account", account);
			List<CalendarofWeek> calendarList = icalendarofweek.getCalendarofWeek();
			modelAndView.addObject("calendarList", calendarList);
			List<Course> courselist = icourse.getTeachersCourses(account.getId());
			modelAndView.addObject("courses", courselist);
			int thisweek=0;
			modelAndView.addObject("thisweek", thisweek);
			List<Performance> performancelist = new ArrayList<Performance>();
			int selectedCourse = Integer.parseInt(select);
			if(courselist.size()!=0) {
				selectedCourse = courselist.get(0).getId();
				performancelist = iperformance.getPerformance(selectedCourse);
			}
			modelAndView.addObject("selectedCourse", selectedCourse);
			modelAndView.addObject("performancelist", performancelist);
		}
		return modelAndView;
	}
	
	
	@RequestMapping(value="/changePerFor")
	public ModelAndView selectedweek(@ModelAttribute("Account")Account account, ModelMap model, String course_id, String cstudent_id, String cdaily_achievement, String ctest_scores, String cfinal_scores, String ccredit) {
		ModelAndView modelAndView = new ModelAndView("redirect:/teachers");
		iperformance.changePerForForm(Integer.parseInt(course_id), Integer.parseInt(cstudent_id),
				Integer.parseInt(cdaily_achievement), Integer.parseInt(ctest_scores), Integer.parseInt(cfinal_scores), Integer.parseInt(ccredit));
		return modelAndView;
	}
	
	@RequestMapping(value="/downloadExcel")
	public void downloadExcel(@ModelAttribute("Account")Account account, ModelMap model, String selectCourse) {
		
		List<Performance> performancelist = iperformance.getPerformance(Integer.parseInt(selectCourse));
		
		List<Map<String, Object>> headInfoList = new ArrayList<Map<String,Object>>();
		Map<String, Object> itemMap = new HashMap<String, Object>();
		itemMap.put("title", "课号");   
        itemMap.put("columnWidth", 50);   
        itemMap.put("dataKey", "KH");   
        headInfoList.add(itemMap);
        itemMap = new HashMap<String, Object>();
		itemMap.put("title", "学号");   
        itemMap.put("columnWidth", 50);   
        itemMap.put("dataKey", "XH");   
        headInfoList.add(itemMap);
        itemMap = new HashMap<String, Object>();
		itemMap.put("title", "日常分");   
        itemMap.put("columnWidth", 20);   
        itemMap.put("dataKey", "RCF");   
        headInfoList.add(itemMap);
        itemMap = new HashMap<String, Object>();
		itemMap.put("title", "考试分");   
        itemMap.put("columnWidth", 20);   
        itemMap.put("dataKey", "KSF");   
        headInfoList.add(itemMap);itemMap = new HashMap<String, Object>();
		itemMap.put("title", "综合分");   
        itemMap.put("columnWidth", 20);   
        itemMap.put("dataKey", "ZHF");   
        headInfoList.add(itemMap);itemMap = new HashMap<String, Object>();
		itemMap.put("title", "学分");   
        itemMap.put("columnWidth", 20);   
        itemMap.put("dataKey", "XF");   
        headInfoList.add(itemMap);
        List<Map<String, Object>> dataList = new ArrayList<Map<String,Object>>();   
        Map<String, Object> dataItem = null;
        for(int i=0;i<performancelist.size();i++) {
        	dataItem = new HashMap<String, Object>();
        	Performance performance = performancelist.get(i);
        	dataItem.put("KH", performance.getClass_id());
        	dataItem.put("XH", performance.getStudent_id());
        	dataItem.put("RCF", performance.getDaily_achievement());
        	dataItem.put("KSF", performance.getTest_scores());
        	dataItem.put("ZHF", performance.getFinal_scores());
        	dataItem.put("XF", performance.getCredit());
        	dataList.add(dataItem);
        }
        String sheetName = selectCourse+"成绩表";
        String filePath = request.getSession().getServletContext().getRealPath("/WEB-INF/xls")+"\\"+selectCourse+".xls";
        
        try {
        	POIUtil.exportExcel2FilePath(sheetName,filePath, headInfoList, dataList);
        	response.setCharacterEncoding("utf-8");  
            response.setContentType("multipart/form-data");  
            response.setHeader("Content-Disposition", "attachment;fileName="+selectCourse+"成绩表.xls");
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
	
	@RequestMapping(value="/uploadExcel")
	public ModelAndView uploadExcel(@ModelAttribute("Account")Account account, ModelMap model, @RequestParam("xlsfile")CommonsMultipartFile  xlsfile) {
		ModelAndView modelAndView =new ModelAndView("redirect:/teachers");
		
		if(!xlsfile.isEmpty()) {
			try {
				InputStream inputStream = xlsfile.getInputStream(); 			
				HSSFWorkbook hssfWorkbook = new HSSFWorkbook(inputStream);
				List<Map<String, Integer>> dataList = new ArrayList<>();
				Map<String, Integer> dataItem = null;
				HSSFCell hssfCell = null;
				for (int numSheet = 0; numSheet < hssfWorkbook.getNumberOfSheets(); numSheet++) {
					HSSFSheet hssfSheet = hssfWorkbook.getSheetAt(numSheet);
		            if (hssfSheet == null) {
		                continue;
		            }
		         // 循环行Row
		            for (int rowNum = 1; rowNum <= hssfSheet.getLastRowNum(); rowNum++) {
		            	HSSFRow hssfRow = hssfSheet.getRow(rowNum);
		                if (hssfRow == null) {
		                    continue;
		                }
		                dataItem = new HashMap<>();
		             // 循环列Cell
		                hssfCell = hssfRow.getCell(0);
		                if (hssfCell == null) {
		                    continue;
		                }
		                dataItem.put("KH",(int)Float.parseFloat(HssCellGetValueUtil.getValue(hssfCell)));
		                hssfCell = hssfRow.getCell(1);
		                if (hssfCell == null) {
		                    continue;
		                }
		                dataItem.put("XH", (int)Float.parseFloat(HssCellGetValueUtil.getValue(hssfCell)));
		                hssfCell = hssfRow.getCell(2);
		                if (hssfCell == null) {
		                    continue;
		                }
		                dataItem.put("RCF", (int)Float.parseFloat(HssCellGetValueUtil.getValue(hssfCell)));
		                hssfCell = hssfRow.getCell(3);
		                if (hssfCell == null) {
		                    continue;
		                }
		                dataItem.put("KSF", (int)Float.parseFloat(HssCellGetValueUtil.getValue(hssfCell)));
		                hssfCell = hssfRow.getCell(4);
		                if (hssfCell == null) {
		                    continue;
		                }
		                dataItem.put("ZHF", (int)Float.parseFloat(HssCellGetValueUtil.getValue(hssfCell)));
		                hssfCell = hssfRow.getCell(5);
		                if (hssfCell == null) {
		                    continue;
		                }
		                dataItem.put("XF", (int)Float.parseFloat(HssCellGetValueUtil.getValue(hssfCell)));
		                
		                dataList.add(dataItem);
		            }
		            for(int i=0, lenght=dataList.size();i<lenght;i++) {
		            	iperformance.changePerForForm(dataList.get(i).get("KH"), dataList.get(i).get("XH"), 
		            								dataList.get(i).get("RCF"), dataList.get(i).get("KSF"), 
		            								dataList.get(i).get("ZHF"), dataList.get(i).get("XF"));
		            }
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return modelAndView;
	}
	
}
