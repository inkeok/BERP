package com.hanul.berp;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@RequestMapping(value = {"/","/index"})
	public String index() {
		return "layout/index";
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
