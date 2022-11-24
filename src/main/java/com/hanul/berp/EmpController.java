package com.hanul.berp;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;


import emp.CompanyVO;
import emp.DepartmentVO;
import emp.EmpAndInsertDTO;
import emp.EmpDAO;
import emp.EmpVO;
import emp.PatternVO;
import emp.PositionVO;

@Controller
public class EmpController {
	@Autowired EmpDAO dao;
	
	//사원정보변경 저장
	@RequestMapping("/update.hr")
	public String update(EmpVO vo) {
		dao.employee_update(vo);
		return "redirect:info.hr?id=" + vo.getEmployee_id();
	}
	
	
	//사원정보 수정화면 
	@RequestMapping("/modify.hr")
	public String modify(int id, Model model) {
		
		List<EmpVO> emp = dao.employee_list();
		List<DepartmentVO> departments = dao.departments();
		List<CompanyVO> company = dao.company();
		List<EmpVO> position = dao.position();
		
		EmpVO vo = dao.emp_info(id);
		
		model.addAttribute("vo", vo);
		model.addAttribute("emp", emp);		
		model.addAttribute("departments", departments);
		model.addAttribute("company", company);
		model.addAttribute("position", position);
		return "side/emp/modify";
	}
	
	//사원정보화면
	@RequestMapping("/info.hr")
	public String info(int id, Model model) {
		EmpVO vo = dao.emp_info(id);
		model.addAttribute("vo", vo);
		
		return "side/emp/info";
	}
	
	// 신규사원등록저장
	@RequestMapping("/insert.hr")
	public String insert(EmpVO vo) {
		// 화면에서 입력한 정보를 DB에 신규저장처리한 후
		System.out.println(vo.getCompany_cd());
		
		dao.employee_insert(vo);
		// 응답화면 연결
		
		return "redirect:list.hr";
	}

	// 신규사원등록
	@RequestMapping("/new.hr")
	public String newhr(Model model) {

		List<EmpVO> emp = dao.employee_list();
		List<DepartmentVO> departments = dao.departments();
		List<CompanyVO> company = dao.company();
		List<EmpVO> position = dao.position();
		List<PatternVO> pattern = dao.pattern();
		
		model.addAttribute("departments", departments);
		model.addAttribute("company", company);
		model.addAttribute("emp", emp);
		model.addAttribute("position", position);
		model.addAttribute("pattern",pattern);
		
		return "side/emp/new";
	}

	// 사원목록
	@RequestMapping("/list.hr")
	public String list(Model model, HttpSession session) {

		List<EmpVO> empList = dao.employee_list();

		model.addAttribute("list", empList);

		return "side/emp/empList";
	}
	
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	@ResponseBody @RequestMapping(value="/andEmpList.hr", produces="text/html; charset=utf-8")
	public String andEmpList() {
		
		List<EmpVO> list = dao.andEmp_list();
		
		return new Gson().toJson(list);
	}
	@ResponseBody @RequestMapping(value="/andEmpListDepartment.hr", produces="text/html; charset=utf-8")
	public String andEmpDepartmentList() {
		
		List<DepartmentVO> list = dao.andEmp_department_list();
		
		return new Gson().toJson(list);

	}
	@ResponseBody @RequestMapping(value="/andEmpListCompany.hr", produces="text/html; charset=utf-8")
	public String andEmpCompanyList() {
		
		List<CompanyVO> list = dao.andEmp_company_list();
		
		return new Gson().toJson(list);

	}
	@ResponseBody @RequestMapping(value="/andEmpListPosition.hr", produces="text/html; charset=utf-8")
	public String andEmpPositionList() {
		
		List<PositionVO> list = dao.andEmp_position_list();
		
		return new Gson().toJson(list);

	}


	@ResponseBody @RequestMapping(value="/andEmpListPattern.hr", produces="text/html; charset=utf-8")
	public String andEmpPatternList() {
		
		List<PatternVO> list = dao.andEmp_pattern_list();
		
		return new Gson().toJson(list);

	}
	
	@ResponseBody @RequestMapping(value="/andEmpDepartmentSelect.hr", produces="text/html; charset=utf-8")
	public String andEmpDepartmentSelect(int department_id) {
		
		List<EmpVO> list = dao.andEmp_department_select(department_id);
		
		return new Gson().toJson(list);

	}
	@ResponseBody @RequestMapping(value="/andEmpCompanySelect.hr", produces="text/html; charset=utf-8")
	public String andEmpCompanySelect(String company) {
		
		List<EmpVO> list = dao.andEmp_company_select(company);
		
		return new Gson().toJson(list);

	}
	@ResponseBody @RequestMapping(value="/andEmpPositionSelect.hr", produces="text/html; charset=utf-8")
	public String andEmpPositionSelect(String position) {
		
		List<EmpVO> list = dao.andEmp_position_select(position);
		
		return new Gson().toJson(list);

	}
	@ResponseBody @RequestMapping(value="/andEmpPatternSelect.hr", produces="text/html; charset=utf-8")
	public String andEmpPatternSelect(String pattern) {
		
		List<EmpVO> list = dao.andEmp_pattern_select(pattern);
		
		return new Gson().toJson(list);

	}
	@ResponseBody @RequestMapping(value="/andModifyEmployee.hr", produces="text/html; charset=utf-8")
	public String andModifyEmployee(String dto) {
		EmpAndInsertDTO vo = new Gson().fromJson(dto, EmpAndInsertDTO.class);
		
		
		return dao.andEmp_modify(vo)+"";

	}
	
	@ResponseBody @RequestMapping(value="/andInsertEmployee.hr", produces="text/html; charset=utf-8")
	public String andInsertEmployee(String dto) {
		EmpAndInsertDTO vo = new Gson().fromJson(dto, EmpAndInsertDTO.class);
		
		
		return dao.and_emp_insert(vo)+"";

	}
	
	
	
	
}
