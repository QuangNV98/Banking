package com.abc.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DashboardController {
	

	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public String dashBoard(HttpServletRequest request) {
		return "/view-admin/dashboard";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginAdmin(HttpServletRequest request) {
		return "/view-admin/login";
	}

	
}
