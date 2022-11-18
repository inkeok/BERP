package com.hanul.berp;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import common.CommonDAO;
import common.CommonVO;

@Controller
public class CommonController {
	@Autowired CommonDAO dao;
	
	@RequestMapping("/common.cd")
	public String list(Model model, HttpSession session) {
		
		List<CommonVO> commonlist = dao.Common_list();
		
		model.addAttribute("list", commonlist);
		
		return "side/common/common";
	}
	
}
