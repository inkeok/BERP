package com.hanul.berp;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import emp.EmpVO;
import work.CommonCodeVO;
import work.HolidayResultVO;
import work.HolidayVO;
import work.WorkDAO;
import work.WorkResultVO;
import work.WorkVO;

@Controller
public class WorkController {
	@Autowired
	WorkDAO dao;

	@RequestMapping("/work")
	public String work_list(String id, Model model) {

		EmpVO vo = dao.empInfo(id);
		model.addAttribute("vo", vo);

		WorkVO wVo = dao.workInfo(id);
		model.addAttribute("wVo", wVo);
		
		List<WorkResultVO> workList = dao.rList();
		
		model.addAttribute("workList",workList); 
		
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

	
	//출근버튼 눌렀을 때 시간 insert
	
	@ResponseBody
	@RequestMapping("/work_start_input")
	public String work_start_input(String start_work, Model model, String id, WorkVO wVo)  {
		
		EmpVO vo = dao.empInfo(id);
		model.addAttribute("vo", vo);
		System.out.println(start_work);
		
		dao.work_start_input(start_work);			

		System.out.println("ajax end");

		return "work";
	
	
	}
	@RequestMapping("/holiday")
	public String holiday(String id, Model model ) {
		EmpVO vo = dao.empInfo(id);
		model.addAttribute("vo", vo);

		WorkVO wVo = dao.workInfo(id);
		model.addAttribute("wVo", wVo);
		
		List<WorkResultVO> holiday_list = dao.holiday_list();
		
		model.addAttribute("holiday_list",holiday_list); 
		
		List<CommonCodeVO> codeList = dao.codeList();
		
		model.addAttribute("codeList", codeList);
		
		List<HolidayResultVO> holiday_submit_list = dao.holiday_submit_list();
		
		model.addAttribute("holiday_submit_list",holiday_submit_list);
		
		List<HolidayVO> hoList = dao.holidayList();
		
		model.addAttribute("hoList", hoList);
		
		
		return "side/work/holiday";
	}
	
	
	@RequestMapping("/holiday_submit")
	public String holiday_submit(HolidayVO vo, String start_holiday, String end_holiday, String work_code) {
		
		/* dao.holiday_submit(vo); */
		
		System.out.println(start_holiday);
		System.out.println(end_holiday);
		System.out.println(work_code);
		System.out.println("ajax submit");
		
		
		dao.holiday_submit(vo);
		
		
		return "side/work/holiday";
	}
	
	@RequestMapping("listWork")
	public String listWork() {
		
		dao.rList();
		
		return "side/work/workList";
	}
	
	@RequestMapping("/workList")
	public String work_list(Model model, @RequestParam(defaultValue = "-1")  int department_id) {
		
		List<WorkResultVO> workList = null;
//		
		//model.addAttribute("workList",workList);


		//dao.rList();



		if( department_id == -1 ) {
			workList = dao.rList();
		}else {			
			workList = dao.department_work(department_id);
		}
		List<emp.DepartmentVO> departments = dao.departments();
		model.addAttribute("departments",departments);
		model.addAttribute("department_id", department_id);
		model.addAttribute("workList",workList);
		
		return "side/work/workList";
	}
	

}
