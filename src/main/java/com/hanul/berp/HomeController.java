package com.hanul.berp;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@RequestMapping(value = {"/","/index"})
	public String index() {
		
		
		return "side/test";
	}
	
	
	@RequestMapping("/recruit")
	public String recruit() {
		
		
		return "recruit";
	}
	
}
