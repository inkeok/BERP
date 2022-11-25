package com.hanul.berp;

import org.apache.ibatis.jdbc.SQL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import emp.EmpDAO;
import emp.EmpVO;

@Controller
public class ProfileController {
	@Autowired EmpDAO dao;
	
	
	@RequestMapping("/profile.pr")
	public String Profile(Model model) {
		
		return "side/profile/myProfile";
	}
}
