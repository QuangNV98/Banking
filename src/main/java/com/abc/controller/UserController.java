package com.abc.controller;



import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.abc.dao.UserDao;
import com.abc.model.User;
import com.abc.service.UserService;
import com.google.gson.Gson;;
@Controller
@RequestMapping("/admin")
public class UserController {
	@Autowired
	UserService userService;
	
	@Autowired
	UserDao userDao;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public @ResponseBody String getAll(HttpServletRequest request, HttpServletResponse resp) throws IOException {
		List<User> users = userService.getAllUsers();
		//Gson gson= new Gson();
		//String json= gson.toJson(users);
		
		Gson gson= new Gson();
		
		String json= gson.toJson(users);
		
		return json;
	}
	
//	@RequestMapping(value = "/updateUser/{userId}", method = RequestMethod.POST)
//	public @ResponseBody String update(HttpServletRequest request, HttpServletResponse resp, @PathVariable(name="userId") int userId,@RequestBody Map map) throws IOException {
//		
//		String a="";
//		
//		String id= (String) map.get("id");
//		String username = (String) map.get("username");
//		String password = (String) map.get("password");
//		String name = (String) map.get("name");
//		String phone = (String) map.get("phone");
//		String email = (String) map.get("email");
//		String address= (String) map.get("address");
//		
//		User user= userService.getUserById(Integer.parseInt(id));
//		user.setUsername(username);
//		user.setPassword(password);
//		user.setName(name);
//		user.setPhone(phone);
//		user.setEmail(email);
//		user.setAddress(address);
//		
//		try {
//			userDao.updateUserFlutter(user);
//			a="success";
//		} catch (Exception e) {
//			a="fail";
//		}	
//		
//		return a;
//	}
	
//	@RequestMapping(value = "/addUserFlutter", method = RequestMethod.POST)
//	public @ResponseBody String add (HttpServletRequest request, HttpServletResponse resp,@RequestBody Map map) throws IOException {
//		
//		String a="";
//		
//		String username = (String) map.get("username");
//		String password = (String) map.get("password");
//		String name = (String) map.get("name");
//		String phone = (String) map.get("phone");
//		String email = (String) map.get("email");
//		String address= (String) map.get("address");
//		
//		User user= new User();
//		user.setUsername(username);
//		user.setPassword(password);
//		user.setName(name);
//		user.setPhone(phone);
//		user.setEmail(email);
//		user.setAddress(address);
//		
//		try {
//			userService.addUser(user);
//			a="success";
//		} catch (Exception e) {
//			a="fail";
//		}	
//		
//		return a;
//	}
//	
//	@RequestMapping(value = "/deleteUserFlutter/{userId}", method = RequestMethod.POST)
//	public @ResponseBody String deleteUser(HttpServletRequest request, HttpServletResponse resp, @PathVariable(name="userId") int userId) throws IOException {
//		String a="";
//		try {
//			userDao.deleteUserFlutter(userId);
//			a="success";
//		} catch (Exception e) {
//			a="fail";
//		}
//		return a;
//	}
	
	@RequestMapping(value = "/detailUser/{userId}", method = RequestMethod.GET)
	public @ResponseBody String detailUser1(HttpServletRequest request, @PathVariable(name="userId") int userId) {
		//request.setAttribute("user", userService.getUserById(userId));
		User user= userService.getUserById(userId);
		Gson gson= new Gson();
		
		String json= gson.toJson(user);
		
		return json;
	}
	
	
	@RequestMapping(value = "/list-user", method = RequestMethod.GET)
	public String getAllUserS(HttpServletRequest request) {
		List<User> users = userService.getAllUsers();
		
		request.setAttribute("users", users);
		return "view-admin/user/listUsers";
	}
	
	@RequestMapping(value = "/addUser", method = RequestMethod.GET)
	public String addUser(ModelAndView mav, HttpServletRequest request) {
		
		return "view-admin/user/editUser";
	}
	
	
	@RequestMapping("/save01.ajax")
	public @ResponseBody String saveUser(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String a="";
		
		Map map = request.getParameterMap();
		
		String id = request.getParameter("id");
		String username= request.getParameter("username");
		String password= request.getParameter("password");
		String email= request.getParameter("email");
		String phone= request.getParameter("phone");
		String address= request.getParameter("address");
		String name= request.getParameter("name");
		String total_money= request.getParameter("total_money");
		String date_ranger= request.getParameter("date_ranger");
		String id_number= request.getParameter("id_number");
		String account_number= request.getParameter("account_number");
		
		
		User user= new User();
		
		user.setUsername(username);
		user.setPassword(password);
		user.setEmail(email);
		user.setPhone(phone);
		user.setAddress(address);
		user.setName(name);
		
		BigDecimal money = new BigDecimal(total_money);
		user.setTotal_money(money);
		user.setId_number(id_number);
		user.setAccount_number(account_number);
		
		SimpleDateFormat formatter1=new SimpleDateFormat("yyyy-MM-dd");  
		Date date1=formatter1.parse(date_ranger);  
		user.setDate_ranger(date1);
		
		
		if(id.equals("")) {
			try {
				userService.addUser(user);
				a="success";
			} catch (Exception e) {
				// TODO: handle exception
				a="fail";
			}	
		}
		else {
			user.setId(Integer.parseInt(id));
			try {
				userService.updateUser(user);
				a="success";
			} catch (Exception e) {
				// TODO: handle exception
				a="fail";
			}	
		}	
		
		return a;
	}
	
	@RequestMapping(value = "/detail-user/{userId}", method = RequestMethod.GET)
	public String detailUser(HttpServletRequest request, @PathVariable(name="userId") int userId) {
		//request.setAttribute("user", userService.getUserById(userId));
		User user= userService.getUserById(userId);
		Gson gson = new Gson();
		String jsonString = gson.toJson(user);
		request.setAttribute("user", jsonString);
		return "view-admin/user/editUser";
	}
	
	/*@RequestMapping(value = "/them-user", method = RequestMethod.GET)
	public String themUser(HttpServletRequest request) {
		User user = new User();
		request.setAttribute("user", user);
		return "view-admin/user/addUser";
	}
	@RequestMapping(value = "/them-user", method = RequestMethod.POST)
	public String addUser(HttpServletRequest request, @ModelAttribute("user") @Valid User user,
			BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {	
			return "view-admin/user/addUser";
		}
		userService.addUser(user);
		return "redirect:/admin/list-user";
	}
	@RequestMapping(value = "/xoa-user/{userId}", method = RequestMethod.GET)
	public String xoaUser(HttpServletRequest request, @PathVariable(name="userId") int userId) {
		userService.deleteUser(userId);
		return "redirect:/admin/list-user";
	}
	@RequestMapping(value = "/sua-user/{userId}", method = RequestMethod.GET)
	public String suaUser(HttpServletRequest request, @PathVariable(name="userId") int userId) {
		request.setAttribute("user", userService.getUserById(userId));
		return "view-admin/user/editUser";
	}
	@RequestMapping(value = "/sua-user", method = RequestMethod.POST)
	public String editUser(HttpServletRequest request, @ModelAttribute("user") @Valid User user,
			BindingResult bindingResult){
		if (bindingResult.hasErrors()) {	
				return "view-admin/user/editUser";
			}
		userService.updateUser(user);
		return "redirect:/admin/list-user";
	}*/

}
