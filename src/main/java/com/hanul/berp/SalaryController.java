package com.hanul.berp;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import emp.EmpDAO;
import salary.SalEmpVO;
import salary.SalaryDAO;
import salary.SalaryVO;

@Controller
public class SalaryController {
	@Autowired SalaryDAO dao;
	@Autowired EmpDAO emp_dao;
	
	@RequestMapping("list.sa")
	public String hrList(Model model, HttpSession session, @RequestParam(defaultValue = "-1") int department_id) {
		List<SalEmpVO> workList = null;
		
		if( department_id == -1 ) {
			workList = dao.employee_list();
		}else {			
			workList = dao.employee_list_d(department_id);
		}
		//List<SalEmpVO> empList = dao.employee_list();
		List<SalEmpVO> departments = dao.departments();
		
		model.addAttribute("list", workList);
		model.addAttribute("departments", departments);
		
		return "side/salary/salList";
	}
	
	@RequestMapping("modify.sa")
	public String salModify(Model model , int id) {
	
		SalEmpVO emp = dao.mod_info(id);
		List<SalaryVO> sa = dao.salary_List();
		List<SalEmpVO> sl = dao.employee_list();
		
	
		
		model.addAttribute("emp", emp);
		 model.addAttribute("sa", sa); 
		model.addAttribute("sl", sl);
		
		return "side/salary/salModify";
	}
	
	@RequestMapping("bonus.sa")
	public String salBonus(Model model , int id) {
	
		SalEmpVO emp = dao.mod_info(id);
	
		model.addAttribute("emp", emp);
		
		return "side/salary/salBonus";
	}
	@RequestMapping("insertCommission.sa")
	public String insert_commission(int employee_id, String salary, String commission) {
	
		SalEmpVO vo = new SalEmpVO();
		vo.setSalary(Integer.parseInt(salary));
		vo.setEmployee_id(employee_id);
		vo.setCommission_pct(Float.parseFloat(commission));
		
		dao.update_salary(vo);
		
		return "redirect:list.sa";
	}
	@RequestMapping("insertBonus.sa")
	public String insert_bonus(int employee_id, String bonus, String bonus_comment) {
	
		SalEmpVO vo = new SalEmpVO();
		vo.setBonus(Integer.parseInt(bonus));
		vo.setEmployee_id(employee_id);
		vo.setBonus_comment(bonus_comment);
		
		System.out.println(dao.insert_bonus(vo));
		
		return "redirect:list.sa";
	}
	
	
	
	
	
	
	//====================================안드로이드==========================================
	
	Gson gson = new Gson();
	
	@ResponseBody @RequestMapping(value="/andDeptList.sa", produces="text/html; charset=utf-8")
	public String DeptList() {
		return gson.toJson(emp_dao.departments());
	}
	

	@ResponseBody @RequestMapping(value="/andSalaryList.sa", produces="text/html; charset=utf-8")
	public String SalaryList() {
		return gson.toJson(dao.salaryList());
	}
	
	@ResponseBody @RequestMapping(value="/andInsertBonus.sa", produces="text/html; charset=utf-8")
	public String andInsertBonus(int employee_id, String bonus, String bonus_comment, Date bonus_date) {
		System.out.println("상여");
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
	
	
}
