package com.hanul.berp;



import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import emp.EmpDAO;
import emp.EmpVO;
import salary.BonusVO;
import salary.SalaryDAO;
import salary.SalaryVO;

@Controller
public class SalaryController {
	@Autowired SalaryDAO dao;
	@Autowired EmpDAO emp_dao;
	
	@RequestMapping("list.sa")
	public String hrList(Model model, HttpSession session) {
		
		List<EmpVO> empList = dao.employee_list();
		
		model.addAttribute("list", empList);
		
		return "side/salary/salList";
	}
	
	
	
	
	
	
	//====================================안드로이드==========================================
	
	Gson gson = new Gson();
	
	@ResponseBody @RequestMapping(value="/andDeptList.sa", produces="text/html; charset=utf-8")
	public String DeptList() {
		return gson.toJson(emp_dao.departments());
	}
	

	@ResponseBody @RequestMapping(value="/andSalaryList.sa", produces="text/html; charset=utf-8")
	public String SalaryList() {
		List<SalaryVO> salaryList = dao.salaryList();
		return gson.toJson(salaryList);
	}
	
	@ResponseBody @RequestMapping(value="/andInsertBonus.sa", produces="text/html; charset=utf-8")
	public String andInsertBonus(int employee_id, String bonus, String bonus_comment, Date bonus_date) {
		System.out.println("상여");
		HashMap<String, Object> map = new HashMap<>();
        map.put("bonus" , bonus);
        map.put("bonus_date" , bonus_date);
        map.put("bonus_comment", bonus_comment);
        map.put("employee_id", employee_id);
        int res = dao.andInsertBonus(map);
		return gson.toJson(res);
	}
	
	@ResponseBody @RequestMapping(value="/andBonusList.sa", produces="text/html; charset=utf-8")
	public String andBonusList() {
		List<BonusVO> list = dao.andBonusList();
		return gson.toJson(list);
	}
	
	@ResponseBody @RequestMapping(value="/andCommissionSave.sa", produces="text/html; charset=utf-8")
	public String andCommissionSave(int employee_id, int commission_pct) {
		System.out.println("커미션");
		return gson.toJson(dao.andCommissionSave(employee_id, commission_pct));
	}
	
	@ResponseBody @RequestMapping(value="/andSalarySave.sa", produces="text/html; charset=utf-8")
	public String andSalarySave(int employee_id, int salary) {
		System.out.println("샐러리");
		return gson.toJson(dao.andSalarySave(employee_id, salary));
	}
	
	@ResponseBody @RequestMapping(value="/andMySalaryVo.sa", produces="text/html; charset=utf-8")
	public String andMySalaryVo(int employee_id) {
		System.out.println("andMySalaryVo");
		SalaryVO vo = dao.andMySalaryVo(employee_id);
     	return gson.toJson(vo);
	}
	
	@ResponseBody @RequestMapping(value="/andMyBonusList.sa", produces="text/html; charset=utf-8")
	public String andMyBonusList(int employee_id) {
		System.out.println("andMyBonusList");
		List<BonusVO> myBonusList = dao.andMyBonusList(employee_id);
		return gson.toJson(myBonusList);
	}
	
	
}
