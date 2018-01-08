package com.EaSystem.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.EaSystem.beans.Account;

@Controller
@SessionAttributes("Account")
@RequestMapping("/logout")
public class LogoutController {
	
	@RequestMapping()
	public ModelAndView Login(@ModelAttribute("Account") Account account,ModelMap model, SessionStatus sessionStatus) {
		ModelAndView modelAndView = new ModelAndView("index");
		
		sessionStatus.setComplete();
		
		return modelAndView;
	}
}
