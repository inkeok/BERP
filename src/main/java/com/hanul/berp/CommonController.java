package com.hanul.berp;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import common.CommonDAO;
import common.CommonVO;

@Controller
public class CommonController {
	@Autowired CommonDAO dao;
	
	@RequestMapping("/common.cd")
	public String list(Model model, HttpSession session
			,@RequestParam(defaultValue = "all") String code_title) {
		
		
		List<CommonVO> commonlist = dao.Common_list();
		
		List<CommonVO> documentlist = dao.document_list(code_title);
		
		if(code_title.equalsIgnoreCase("all")) {
			commonlist = dao.Common_list();
		}else {
			documentlist = dao.document_list(code_title);
		}
		
		model.addAttribute("list", commonlist);
		model.addAttribute("code_title", documentlist);
		
		return "side/common/common";
	}
	
}
