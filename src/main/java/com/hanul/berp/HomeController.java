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
public class HomeController {
	@Autowired EmpDAO dao;
	@RequestMapping(value = {"/","/index"})
	public String index() {
		return "layout/index";
	}
	
	@RequestMapping(value= {"/side"})
	public String side(Model model) {
		
		EmpVO vo = dao.emp_info(0);
		
		model.addAttribute("vo", vo);
		return "side";
	}
	
	@RequestMapping(value = {"/sideIndex"})
	public String sideIndex(HttpSession session) {
		
		
		return "side/sideIndex";
	}
	
	
	@RequestMapping("/recruit")
	public String recruit() {
		
			
		return "recruit";
	}
	
}
