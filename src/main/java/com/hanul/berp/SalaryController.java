package com.hanul.berp;

import java.sql.Date;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import emp.EmpDAO;
import salary.SalaryDAO;

@Controller
public class SalaryController {
	@Autowired SalaryDAO dao;
	@Autowired EmpDAO emp_dao;
	
	//====================================안드로이드==========================================
	
	Gson gson = new Gson();
	
	@ResponseBody @RequestMapping(value="/andDeptList.sa", produces="text/html; charset=utf-8")
	public String DeptList() {
		return gson.toJson(emp_dao.departments());
	}
	

	@ResponseBody @RequestMapping(value="/andSalary.sa", produces="text/html; charset=utf-8")

	public String SalaryList() {
		return gson.toJson(dao.salaryList());
	}
	
	@ResponseBody @RequestMapping(value="/andInsertBonus.sa", produces="text/html; charset=utf-8")
	public String andInsertBonus(int employee_id, String bonus, String bonus_comment, Date bonus_date) {
		
		HashMap<String, Object> map = new HashMap<>();
        map.put("bonus" , bonus);
        map.put("bonus_date" , bonus_date);
        map.put("bonus_comment", bonus_comment);
        map.put("employee_id", employee_id);
		return gson.toJson(dao.andInsertBonus(map));
	}
	
	@ResponseBody @RequestMapping(value="/andBonusList.sa", produces="text/html; charset=utf-8")
	public String andBonusList() {
		return gson.toJson(dao.andBonusList());
	}
	
	
}
