package com.EaSystem.controller;

import java.util.Date;
import java.text.SimpleDateFormat;

import javax.annotation.Resource;

import org.apache.commons.lang3.time.DateUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.EaSystem.beans.Account;
import com.EaSystem.beans.Users;
import com.EaSystem.mapper.IUsersService;

@Controller
@SessionAttributes("Account")
@RequestMapping("/presonal")
public class PerInformationController {
	@Resource
	private IUsersService iusers;
	
	@RequestMapping()
	public ModelAndView getPerInfor(@ModelAttribute("Account")Account account, ModelMap model) {
		ModelAndView modelAndView = new ModelAndView("personalInformation");
		Users users = iusers.getUser(account.getId());
		if(users==null) {
			users = new Users();
			users.setAccount_id(account.getId());
			users.setBirth(new java.sql.Date(2017));
			users.setEamil("none");
			users.setFirstname("none");
			users.setImage("deafult.jpg");
			users.setInformation("none");
			users.setLastname("none");
			users.setPhonenumber("none");
			users.setSex("none");
		}
		modelAndView.addObject("account", account);
		modelAndView.addObject("perInfor", users);
		return modelAndView;
	}
	
	@RequestMapping(value="/changeInfor")
	public ModelAndView changePerInfor(@ModelAttribute("Account")Account account, ModelMap model, String cfirstname, String clastname, String csex, String cbirth, String cphonenumber, String cemail) {
		ModelAndView modelAndView = new ModelAndView("redirect:/presonal");
		String DATE_FORMAT = "yyyy-MM-dd";
		int account_id = account.getId();
		switch (csex) {
		case "男":
			csex="M";
			break;
		case "女":
			csex="F";
			break;

		default:
			csex="N";
			break;
		}
		try {
			cfirstname = new String(cfirstname.getBytes("UTF-8"),"UTF-8");
			clastname = new String(clastname.getBytes("UTF-8"),"UTF-8");
			Date cbirthdate = DateUtils.parseDate(cbirth, DATE_FORMAT);
			if(iusers.getUser(account_id)!=null) {
				iusers.updateinfo(cfirstname, clastname, csex, cbirthdate, cphonenumber, cemail, account_id);
			}else {
				iusers.insertinfo(cfirstname, clastname, csex, cbirthdate, cphonenumber, cemail, account_id);
			}
		}catch (Exception e) {
            e.printStackTrace();
        }
		return modelAndView;
	}
	
	@RequestMapping(value="/changeInforImg")
	public ModelAndView changeInforImg(@ModelAttribute("Account")Account account, ModelMap model, @RequestParam("xlsfile")CommonsMultipartFile  jpgfile) {
		ModelAndView modelAndView = new ModelAndView("redirect:/presonal");
		
		
		
		return modelAndView;
	}
}
