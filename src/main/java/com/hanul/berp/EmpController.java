package com.hanul.berp;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import emp.CompanyVO;
import emp.DepartmentVO;
import emp.EmpDAO;
import emp.EmpVO;

@Controller
public class EmpController {
	@Autowired EmpDAO dao;

	// 신규사원등록저장
	@RequestMapping("/insert.hr")
	public String insert(EmpVO vo) {
		// 화면에서 입력한 정보를 DB에 신규저장처리한 후
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
		
		model.addAttribute("departments", departments);
		model.addAttribute("company", company);
		model.addAttribute("emp", emp);
		model.addAttribute("position", position);
		return "side/emp/new";
	}

	// 사원목록
	@RequestMapping("/list.hr")
	public String list(Model model, HttpSession session) {

		List<EmpVO> empList = dao.employee_list();

		model.addAttribute("list", empList);

		return "side/emp/empList";
	}
	
	
	
	

}
