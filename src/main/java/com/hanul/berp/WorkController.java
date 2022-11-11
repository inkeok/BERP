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
		
		dao.work_list();
		return "";
	}
	
	
	
}
