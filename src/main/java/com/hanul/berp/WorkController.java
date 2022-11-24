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

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import emp.DepartmentVO;
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
	Gson gson = new GsonBuilder()
	.setDateFormat("yyyy-MM-dd").create();

	//세션처리 필요
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

	//세션처리 필요
	// 퇴근 버튼 눌렀을 때 시간 update
	@ResponseBody
	@RequestMapping("/work_end_input")
	public String work_end_input(Model model, String id, String end_work) {

		EmpVO vo = dao.empInfo(id);
		model.addAttribute("vo", vo);
		
		
		
		dao.work_end_input(end_work);
		
		

		return "work";
	}

	//세션처리 필요
	//출근버튼 눌렀을 때 시간 insert
	
	@ResponseBody
	@RequestMapping("/work_start_input")
	public String work_start_input(String start_work, Model model, String id, WorkVO wVo)  {
		
		EmpVO vo = dao.empInfo(id);
		model.addAttribute("vo", vo);
		
		try {
			dao.work_start_input(start_work);					
		} catch (Exception e) {
			
			StringBuffer msg = new StringBuffer("<html>");
			msg.append("<body>");
			msg.append("<script>");
			msg.append("alert('이미 출근 되었습니다');");
			msg.append("</script>");
			msg.append("</body>");
			msg.append("</html>");
			return msg.toString();	
		}

		System.out.println("ajax end");

		return "work";
	
	
	}
	
	//세션처리 필요
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
	/* =======================안드로이드 ====================== */
	
	@ResponseBody @RequestMapping(value="/andWorkList",
	produces="text/html; charset=utf-8") public String andWorkList() {
	
	List<WorkResultVO> list = dao.rList(); 
	return gson.toJson(list); }
	
	
	 // 퇴근 버튼 눌렀을 때 시간 update
	 
	 @ResponseBody
	 @RequestMapping("/andWork_end_input") 
	 public String andWork_end_input( String end_work) {
	
	 
	 return dao.work_end_input(end_work)+""; }

	
		//출근버튼 눌렀을 때 시간 insert
		
		@ResponseBody
		@RequestMapping("/andWork_start_input")
		public String andWork_start_input(String start_work)  {
	
			System.out.println(start_work);
		
			return dao.work_start_input(start_work)+"";
		
		
		}

		
		@ResponseBody @RequestMapping(value="/andHolidayList", produces="text/html; charset=utf-8")
		public String andHolidayList()  {
			
			Gson gson = new GsonBuilder()
					.setDateFormat("yyyy-MM-dd").create();
			
			return gson.toJson(dao.holidayAllList());
			
			
		}
		@ResponseBody @RequestMapping(value="/andSearch", produces="text/html; charset=utf-8")
		public String andSearch() {
			
			
			return gson.toJson(dao.search());
		}
		@ResponseBody @RequestMapping(value="/andEndSearch", produces="text/html; charset=utf-8")
		public String andEndSearch() {
			
			
			return gson.toJson(dao.andEndSearch());
		}
		
		@ResponseBody @RequestMapping(value="/andHoliday", produces="text/html; charset=utf-8")
		public String andHoliday(String vo) {
			HolidayVO dto =  new Gson().fromJson(vo, HolidayVO.class);
			
			System.out.println(dto.getStart_holiday());
			System.out.println(dto.getEnd_holiday());
			System.out.println(dto.getWork_code());
			try {
				return dao.andHoliday(dto)+"";
			} catch (Exception e) {
				return "1";
			}
			
	}
		
		
		@ResponseBody @RequestMapping(value="/andWorkDept", produces="text/html; charset=utf-8")
		public String andWorkDept() {
		
			List<DepartmentVO> list = dao.departments();
			return gson.toJson(list);
		}
		@ResponseBody @RequestMapping(value="/andWorkDeptList", produces="text/html; charset=utf-8")
		public String andWorkDeptList(int department_id) {
			System.out.println(department_id);
			
			
			return gson.toJson(dao.department_work(department_id));
		}
		@ResponseBody @RequestMapping(value="/andCode", produces="text/html; charset=utf-8")
		public String andCode() {
			
			List<CommonCodeVO> list = dao.andCode();
			
			return gson.toJson(list);
		}
		@ResponseBody @RequestMapping(value="/andHolidaySearch", produces="text/html; charset=utf-8")
		public String andHolidaySearch(String vo) {
			HolidayVO dto =  new Gson().fromJson(vo, HolidayVO.class);
			//
			return gson.toJson(dto);
		}
		
		@ResponseBody @RequestMapping(value="/andHoliday_List", produces="text/html; charset=utf-8")
		public String andHoliday_List() {
			
			
			return gson.toJson(dao.andHoliday_List());
			
		}
		@ResponseBody @RequestMapping(value="/andHolidayDept_List", produces="text/html; charset=utf-8")
		public String andHolidayDept_List(int department_id) {
			
			
			return gson.toJson(dao.andHolidayDept_List(department_id));
			
		}
		
		@ResponseBody @RequestMapping(value="/andHolidayIndi_List", produces="text/html; charset=utf-8")
		public String andHolidayIndi_List(int employee_id) {
			List<WorkResultVO> list = dao.andHolidayIndi_List(employee_id);
			
			return gson.toJson(list);
			
		}
		
		
}
