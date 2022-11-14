package com.hanul.berp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import mypage.MyPageDAO;

@Controller
public class MyPageController {
	@Autowired MyPageDAO dao;
	
	
	
	@RequestMapping("/update.mem")
	public String update_member() {
		
		
		return "layout/myPage/update";
	}

}
