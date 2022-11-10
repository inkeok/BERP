package com.hanul.berp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import approval.ApprovalDAO;

@Controller
public class ApprovalController {
	@Autowired ApprovalDAO dao;
	
	@RequestMapping("/saveList.ap")
	public String saveList(String employee_id, Model model) {
		System.out.println("세이브리스트");
		model.addAttribute("saveList", dao.saveList(employee_id));
		return "side/approval/submitList";
	}
	
	@RequestMapping("/submitList.ap")
	public String submitList(String employee_id, Model model) {
		System.out.println("섬밋리스트");
		model.addAttribute("submitList", dao.submitList(employee_id));
		return "side/approval/submitList";
	}

}
