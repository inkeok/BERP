package com.hanul.berp;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import emp.EmpDAO;
import emp.EmpVO;

@Controller
public class EmpController {
	@Autowired EmpDAO dao;
	
	
	@RequestMapping("/list.hr")
	public String list(Model model, HttpSession session) {
		
		List<EmpVO> empList = dao.employee_list();
		
		model.addAttribute("list", empList);
		
		
		
		return "emp/empList";
	}
	
	
	

}
