package com.hanul.berp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import work.WorkDAO;

@Controller
public class WorkController {
	@Autowired WorkDAO dao;
	
	@RequestMapping("/work")
	public String work_list() {
		
		System.out.println(dao.work_list());
		
		return "side/work/work";
	}
	
	@RequestMapping("/input")
	public String input() {
		
		System.out.println(dao.work_list());
		
		return "side/work/input";
	}
	
	@RequestMapping("/adminList")
	public String adminlist() {
		
		System.out.println(dao.work_list());
		
		return "side/work/adminList";
	}
	
	
	@RequestMapping("/holiday")
	public String holiday() {
		
		System.out.println(dao.work_list());
		
		return "side/work/holiday";
	}
	
	
	
}
