package com.hanul.berp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import emp.EmpVO;
import work.WorkDAO;
import work.WorkVO;

@Controller
public class WorkController {
	@Autowired
	WorkDAO dao;

	@RequestMapping("/work")
	public String work_list(String id, Model model) {

		EmpVO vo = dao.empInfo(id);
		model.addAttribute("vo", vo);

		/*
		 * WorkVO wVo = dao.workInfo(id); model.addAttribute("wVo",wVo);
		 */

		return "side/work/work";
	}

	// 퇴근 버튼 눌렀을 때 시간 update
	@ResponseBody
	@RequestMapping("/work_end_input")
	public String work_end_input(Model model, String id, String end_work) {

		EmpVO vo = dao.empInfo(id);
		model.addAttribute("vo", vo);
		System.out.println(end_work);
		
		dao.work_end_input(end_work);
		
		System.out.println("ajax end");

		return "work";
	}

	
	//출근버튼 눌렀을 때 시간 update
	
	@ResponseBody
	@RequestMapping("/work_start_input")
	public String work_start_input(String start_work, Model model, String id) {
		
		EmpVO vo = dao.empInfo(id);
		model.addAttribute("vo", vo);
		System.out.println(start_work);
		
		dao.work_start_input(start_work);
		
		System.out.println("ajax end");

		return "work";
	
	
	}
	

}
