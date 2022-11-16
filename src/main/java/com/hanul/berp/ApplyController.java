package com.hanul.berp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import apply.ApplyDAO;

@Controller
public class ApplyController {

	@Autowired ApplyDAO dao;
	
	@RequestMapping("/fillout.apply")
	public String applyList() {
		
		return "apply/fillout";
	}
}
