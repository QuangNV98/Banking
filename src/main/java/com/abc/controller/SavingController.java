package com.abc.controller;



import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.abc.model.InterestRate;
import com.abc.model.PercentInteresrt;
import com.abc.model.Saving;
import com.abc.model.TypeSaving;
import com.abc.model.User;
import com.abc.service.InterestRateService;
import com.abc.service.PercentService;
import com.abc.service.SavingService;
import com.abc.service.TypeSavingService;
import com.abc.service.UserService;
import com.google.gson.Gson;;
@Controller
@RequestMapping("/admin")
public class SavingController {
	@Autowired
	SavingService savingService;
	
	@Autowired
	TypeSavingService typeService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	InterestRateService rateService;
	
	@Autowired
	PercentService perService;
	
	@RequestMapping(value = "/list-saving", method = RequestMethod.GET)
	public String getAllUserS(HttpServletRequest request) {
		List<Saving> savings = savingService.getAllSavings();
		
		request.setAttribute("savings", savings);
		return "view-admin/saving/listSavings";
	}
	
	@RequestMapping(value = "/toTypeSaving/{userId}", method = RequestMethod.GET)
	public String toTypeSavings(HttpServletRequest request, @PathVariable(name="userId") int userId) {
		
		List<TypeSaving> types= typeService.getAllTypes();
		
		request.setAttribute("types", types);
		request.setAttribute("id_user", userId);
		return "view-admin/saving/typeSavings";
	}
	
	@RequestMapping(value = "/toDetailSaving/{savingId}", method = RequestMethod.GET)
	public String toDetailSaving(HttpServletRequest request, @PathVariable(name="savingId") String savingNum) {
		
		Saving saving= savingService.getByNumSaving(savingNum);
		User user= saving.getUser();
		InterestRate rate= saving.getInterestRate();
		TypeSaving type= typeService.getTypeById(rate.getIdType());
		PercentInteresrt per = perService.getPercentByName("M02");
		
		request.setAttribute("saving", saving);
		request.setAttribute("user", user);
		request.setAttribute("rate", rate);
		request.setAttribute("type", type);
		request.setAttribute("percent_pre", per);
		
		return "view-admin/saving/detailSaving";
	}
	
	@RequestMapping(value = "/toFormSaving/{userId}/{typeId}", method = RequestMethod.GET)
	public String toFormSaving(HttpServletRequest request, @PathVariable(name="userId") int userId, @PathVariable(name="typeId") int typeId) {
		
		User user= userService.getUserById(userId);
		TypeSaving type= typeService.getTypeById(typeId);
		
		Gson gson = new Gson();
		String jsonType = gson.toJson(type);
		
		List<InterestRate> interestRates= rateService.getListRateByIdType(typeId);
		
		request.setAttribute("user", user);
		request.setAttribute("type", jsonType);
		request.setAttribute("rates", interestRates);
		
		return "view-admin/saving/formSaving";
	}
	
	@RequestMapping("/save02.ajax")
	public @ResponseBody String saveSaving (HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String a="fail";
		
		String idUser= request.getParameter("id_user");
		//String depositStr = request.getParameter("total_deposit");
		String depositInBankStr = request.getParameter("deposit");
		String id_rate= request.getParameter("id_rate");
		String startDateStr= request.getParameter("start_date");
		String endDateStr= request.getParameter("end_date");
		String moneyAsmStr= request.getParameter("money_asm");
		String numSavingStr= request.getParameter("num_saving");
		
		
		Saving saving= new Saving();
		
		User user= userService.getUserById(Integer.parseInt(idUser));
		
		BigDecimal depositInBank = new BigDecimal(depositInBankStr);
		BigDecimal depositInReal= user.getTotal_money();
		BigDecimal depositRemain= depositInReal.subtract(depositInBank);
		
		user.setTotal_money(depositRemain);
		
		saving.setUser(user);
		
		InterestRate rate= rateService.getRateById(Integer.parseInt(id_rate));
		saving.setInterestRate(rate);
		
		SimpleDateFormat formatter1=new SimpleDateFormat("yyyy-MM-dd");  
		Date startDate=formatter1.parse(startDateStr);  
		Date endDate =formatter1.parse(endDateStr);
		
		saving.setStartDate(startDate);
		saving.setEndDate(endDate);
	
		
		BigDecimal deposit = new BigDecimal(depositInBankStr);	
		saving.setDeposit(deposit);
		
		BigDecimal moneyAsm = new BigDecimal(moneyAsmStr);
		saving.setInterestAsm(moneyAsm);
		
		saving.setNumSaving(numSavingStr);
		saving.setValid(1);
		try {
			userService.updateUser(user);
			savingService.addSaving(saving);
			
			a="success";
		} catch (Exception e) {
			// TODO: handle exception
			a="fail";
		}
		
		return a;
	}
	
	
	@RequestMapping("/withDrawal.ajax")
	public @ResponseBody String withDrawal (HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String a="fail";
		
		String interestRealStr= request.getParameter("interest_real");
		String numSavingStr= request.getParameter("num_saving");
		
		Saving saving= savingService.getByNumSaving(numSavingStr);
		User user= saving.getUser();
		BigDecimal moneyInBankNow= user.getTotal_money();
		
		BigDecimal interestReal = new BigDecimal(interestRealStr);
		
		BigDecimal totalInSaving= saving.getDeposit().add(interestReal);
		
		BigDecimal totalNow= moneyInBankNow.add(totalInSaving);
		user.setTotal_money(totalNow);
		
		saving.setValid(0);
		saving.setInterestReal(interestReal);
		
		try {
			userService.updateUser(user);
			savingService.endSaving(saving);
			a="success";
		} catch (Exception e) {
			// TODO: handle exception
			a="fail";
		}
		
		return a;
	}
	
	@RequestMapping("/getRate.ajax")
	public @ResponseBody InterestRate getRate (HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		String idRate= request.getParameter("id_rate");
		InterestRate inteRate= rateService.getRateById(Integer.parseInt(idRate));
		
		
		return inteRate;
	}
}
