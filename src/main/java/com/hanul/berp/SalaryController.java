package com.hanul.berp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import emp.DepartmentVO;
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
		return gson.toJson(dao.SalaryList());
	}
}
