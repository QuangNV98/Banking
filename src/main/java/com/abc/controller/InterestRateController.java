package com.abc.controller;



import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.abc.model.InterestRate;
import com.abc.service.InterestRateService;;
@Controller
@RequestMapping("/admin")
public class InterestRateController {
	
	@Autowired
	InterestRateService rateService;

	@RequestMapping(value = "/list-rate", method = RequestMethod.GET)
	public String getAllUserS(HttpServletRequest request) {
		List<InterestRate> rates = rateService.getAllRatess();
		
		request.setAttribute("rates", rates);
		return "view-admin/rate/listRates"; 
	}
	
	@RequestMapping(value = "/addRate", method = RequestMethod.GET)
	public String addRate(ModelAndView mav, HttpServletRequest request) {
		
		return "view-admin/rate/editRate";
	}
}
