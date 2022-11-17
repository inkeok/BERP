package com.hanul.berp;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import approval.ApprovalDAO;
import approval.Ing_tableVO;
import emp.EmpDAO;

@Controller
public class ApprovalController {
	@Autowired ApprovalDAO dao;
	@Autowired EmpDAO emp_dao;
	
	//상신함 뷰
	@RequestMapping("/submitList.ap")
	public String submitList(String email, Model model) {
		model.addAttribute("submitList", dao.submitList(email));
		model.addAttribute("email", email);
		return "side/approval/submitList";
	}
	
	//보관함 뷰
	@RequestMapping("/lockerList.ap")
	public String lockerList(String email, Model model) {
		model.addAttribute("lockerList", dao.lockerList(email));
		model.addAttribute("email", email);
		return "side/approval/lockerList";
	}
	
	//수신함 뷰
	@RequestMapping("/receiveList.ap")
	public String receiveList(String email, Model model) {
		model.addAttribute("receiveList", dao.receiveList(email));
		model.addAttribute("email", email);
		return "side/approval/receiveList";
	}
	//결재함 뷰
	@RequestMapping("/approvalList.ap")
	public String approvalList(String email, Model model) {
		model.addAttribute("approvalList", dao.approvalList(email));
		model.addAttribute("email", email);
		return "side/approval/approvalList";
	}
	
	@RequestMapping("/post.ap")
	public String post(Model model, Ing_tableVO vo, String email,
			@RequestParam(defaultValue = "부서") String department_name) {

		if(department_name != "부서") 
			model.addAttribute("departmentEmployee", dao.departmentEmployee(department_name));
		
		model.addAttribute("document_title", vo.getDocument_title());
		model.addAttribute("document_content", vo.getDocument_content());
		
		model.addAttribute("departments", emp_dao.departments());
		model.addAttribute("department_name", department_name);
		return "default/approval/post";
	}
	
	//상신함 저장
	@ResponseBody
	@RequestMapping(value="/insertPost.ap", produces="text/html; charset=utf8")
	public String insertPost(Ing_tableVO vo, String email, String url) {
		if(dao.insertPost(vo)==1 && dao.insertResult(vo)==1) {
			StringBuffer msg = new StringBuffer("<script>");
			msg.append("alert('제출했습니다.'); location='")
				.append(url).append("?email=").append(email).append("'");
			msg.append("</script>");
			return msg.toString();
		}
		return null;
	}
	
	//임시보관함 저장
	@RequestMapping("/insertLocker.ap")
	public String insertLocker(Ing_tableVO vo, String email) {
		dao.insertLocker(vo);
		return "redirect:lockerList.ap?email="+email;
	}
	
	//상신함 목록 중 제목 클릭시 상세화면
	@RequestMapping("/submitListDetail.ap")
	public String submitListDetail(int no, String email, Model model) {
		model.addAttribute("submitListDetail", dao.submitListDetail(no, email));
		model.addAttribute("email", email);
		return "side/approval/submitListDetail";
	}
	
	//보관함 목록 중 제목 클릭시 상세화면
	@RequestMapping("/lockerListDetail.ap")
	public String lockerListDetail(Model model, String email, int no, int ing_no) {
		Ing_tableVO vo = dao.lockerListDetail(no, email);
		model.addAttribute("document_content", vo.getDocument_content());
		model.addAttribute("document_title", vo.getDocument_title());
		model.addAttribute("email", email);
		model.addAttribute("departments", emp_dao.departments());
		dao.deleteIng(ing_no);
		return "default/approval/lockerListDetail";
	}
	
	//결재함 목록 중 제목 클릭시 상세화면
	@RequestMapping("/receiveListDetail.ap")
	public String approvalListDetail(int no, String email, Model model, String document_check) {
		model.addAttribute("receiveListDetail", dao.receiveListDetail(no, email));
		model.addAttribute("email", email);
		model.addAttribute("document_checks", dao.document_checks());
		model.addAttribute("document_check", document_check);
		return "side/approval/receiveListDetail";
	}
	
	//수신함에서 처리하면 result_table에 저장
	@ResponseBody
	@RequestMapping(value="/insertResultEnd.ap", produces="text/html; charset=utf8")
	public String insertResultEnd(Ing_tableVO vo, String email, String url, int ing_no){
		if(dao.insertResultEnd(vo) == 1 && dao.deleteIng(ing_no)==1) {
			StringBuffer msg = new StringBuffer("<script>");
			msg.append("alert('처리 완료.'); location='")
				.append(url).append("?email=").append(email).append("'");
			msg.append("</script>");
			return msg.toString();
		}
		return null;
	}
}
