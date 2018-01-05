package com.EaSystem.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.EaSystem.beans.Account;
import com.EaSystem.beans.Account_role;
import com.EaSystem.beans.CalendarofWeek;
import com.EaSystem.mapper.IAccountService;
import com.EaSystem.mapper.IAount_roleService;
import com.EaSystem.mapper.ICalendarofWeekService;

@Controller
@SessionAttributes("Account")
@RequestMapping("/login")
public class LoginController {
	@Autowired
	@Resource
	private IAccountService ilogin;
	@Resource
	private IAount_roleService iaccount_role;
	@Resource
	private ICalendarofWeekService icalendarofweek;
	
	@RequestMapping()
	public ModelAndView Login(String username, String pw,ModelMap model) {
		Account account = ilogin.Login(username, pw);
		ModelAndView modelandview;
		if(account != null) {
			modelandview = new ModelAndView("redirect:/login/role");
			model.addAttribute("Account", account);
		}else {
			modelandview = new ModelAndView("index");
		}
		return modelandview;
	}
	
	@RequestMapping(value="/role")
	public ModelAndView backLogin(@ModelAttribute("Account") Account account,ModelMap model) {
		ModelAndView modelandview;
		if(account != null) {
			Account_role account_role=iaccount_role.getAccount_role(account.getId());
			switch (account_role.getRole_id()) {
			case 3:
				modelandview = new ModelAndView("redirect:/manager");
				break;
			case 2:
				modelandview = new ModelAndView("redirect:/teachers");
				break;
			default:
				modelandview = new ModelAndView("redirect:/students");
				break;
			}
		}else {
			modelandview = new ModelAndView("index");
		}
		return modelandview;
	}
}

