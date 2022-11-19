package com.hanul.berp;



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
	public String submitList(int employee_id, Model model) {
		model.addAttribute("submitList", dao.submitList(employee_id));
		model.addAttribute("employee_id", employee_id);
		return "side/approval/submitList";
	}
	
	//보관함 뷰
	@RequestMapping("/lockerList.ap")
	public String lockerList(int employee_id, Model model) {
		model.addAttribute("lockerList", dao.lockerList(employee_id));
		model.addAttribute("employee_id", employee_id);
		return "side/approval/lockerList";
	}
	
	//보관함 디테일에서 취소 시 삭제
	@ResponseBody
	@RequestMapping(value="/deleteLockerList.ap",
				produces="text/html; charset=utf8")
	public String deleteLockerList(int employee_id, String url, 
								Model model, int ing_no) {
		if(dao.deleteIng(ing_no)==1) {
			StringBuffer msg = new StringBuffer("<script>");
			msg.append("alert('삭제했습니다.'); location='")
				.append(url).append("?employee_id=").append(employee_id).append("'");
			msg.append("</script>");
			return msg.toString();
		}
		return null;
	}
	
	
	
	//수신함 뷰
	@RequestMapping("/receiveList.ap")
	public String receiveList(int employee_id, Model model) {
		model.addAttribute("receiveList", dao.receiveList(employee_id));
		model.addAttribute("employee_id", employee_id);
		return "side/approval/receiveList";
	}
	//결재함 뷰
	@RequestMapping("/approvalList.ap")
	public String approvalList(int employee_id, Model model,
			@RequestParam(defaultValue = "-1")String code_value) {
		
		model.addAttribute("employee_id", employee_id);
		model.addAttribute("documentCheckAll", dao.document_check());
		model.addAttribute("code_value", code_value);
		
		if(code_value.equals("-1")) {
			model.addAttribute("approvalList", dao.approvalList(employee_id));
			
		}else {
			model.addAttribute("approvalList", dao.approvalList(employee_id, code_value));
		}
		
		return "side/approval/approvalList";
	}
	
	@RequestMapping("/post.ap")
	public String post(Model model, Ing_tableVO vo, int employee_id, 
			@RequestParam(defaultValue = "-1") int ing_no,
			@RequestParam(defaultValue = "부서") String department_name) {

		if(department_name != "부서") 
			model.addAttribute("departmentEmployee", dao.departmentEmployee(department_name, employee_id));
		
		model.addAttribute("document_title", vo.getDocument_title());
		model.addAttribute("document_content", vo.getDocument_content());
		
		model.addAttribute("departments", emp_dao.departments());
		model.addAttribute("department_name", department_name);
		model.addAttribute("ing_no", ing_no);
		return "side/approval/post";
	}
	
	//상신함 저장
	@ResponseBody
	@RequestMapping(value="/insertPost.ap", produces="text/html; charset=utf8")
	public String insertPost(Ing_tableVO vo, int employee_id, String url,
			@RequestParam(defaultValue = "-1") int ing_no) {
		dao.deleteIng(ing_no);
		if(dao.insertPost(vo)==1 && dao.insertResult(vo)==1) {
			StringBuffer msg = new StringBuffer("<script>");
			msg.append("alert('제출했습니다.'); location='")
				.append(url).append("?employee_id=").append(employee_id).append("'");
			msg.append("</script>");
			return msg.toString();
		}
		
		return null;
	}
	
	//임시보관함 삭제 후 상신함 저장-결재함 저장
	@ResponseBody
	@RequestMapping(value="/deleteInsertSubmit.ap", produces="text/html; charset=utf8")
	public String deleteInsertSubmit(Ing_tableVO vo, int employee_id, String url, int ing_no) {
		if(dao.deleteIng(ing_no)==1 && dao.insertPost(vo)==1 && dao.insertResult(vo)==1) {
			StringBuffer msg = new StringBuffer("<script>");
			msg.append("alert('제출했습니다.'); location='")
				.append(url).append("?employee_id=").append(employee_id).append("'");
			msg.append("</script>");
			return msg.toString();
		}
		return null;
	}
	
	//임시보관함 저장
	@RequestMapping("/insertLocker.ap")
	public String insertLocker(Ing_tableVO vo, int employee_id) {
		dao.insertLocker(vo);
		return "redirect:lockerList.ap?employee_id="+employee_id;
	}
	
	//임시보관함 저장
	@ResponseBody
	@RequestMapping(value="/deleteInsertLocker.ap", 
					produces="text/html; charset=utf8")
	public String deleteInsertLocker(Ing_tableVO vo, String url, 
					int employee_id, int ing_no) {
		int a = dao.insertLocker(vo);
		int b = dao.deleteIng(ing_no);
			StringBuffer msg = new StringBuffer("<script>");
			msg.append("alert('저장했습니다.');").append("location='")
			.append(url).append("?employee_id=").append(employee_id)
			.append("<script>");
			return msg.toString();
	}
	
//	//보관함 디테일에서 취소 시 삭제
//		@ResponseBody
//		@RequestMapping(value="/deleteLockerList.ap",
//					produces="text/html; charset=utf8")
//		public String deleteLockerList(int employee_id, String url, 
//									Model model, int ing_no) {
//			if(dao.deleteIng(ing_no)==1) {
//				StringBuffer msg = new StringBuffer("<script>");
//				msg.append("alert('삭제했습니다.'); location='")
//					.append(url).append("?employee_id=").append(employee_id).append("'");
//				msg.append("</script>");
//				return msg.toString();
//			}
//			return null;
//		}
	
	//상신함 목록 중 제목 클릭시 상세화면
	@RequestMapping("/submitListDetail.ap")
	public String submitListDetail(int no, int employee_id, Model model) {
		model.addAttribute("submitListDetail", dao.submitListDetail(no, employee_id));
		model.addAttribute("employee_id", employee_id);
		return "side/approval/submitListDetail";
	}
	
	//보관함 목록 중 제목 클릭시 상세화면
		@RequestMapping("/lockerListDetail.ap")
		public String lockerListDetail(Model model, int employee_id, int no, int ing_no) {
			Ing_tableVO vo = dao.lockerListDetail(no, employee_id);
			model.addAttribute("document_content", vo.getDocument_content());
			model.addAttribute("document_title", vo.getDocument_title());
			model.addAttribute("employee_id", employee_id);
			model.addAttribute("ing_no", ing_no);
			model.addAttribute("departments", emp_dao.departments());
			return "side/approval/lockerListDetail";
		}
	
//	//보관함 목록 중 제목 클릭시 상세화면
//	@RequestMapping("/lockerListDetail.ap")
//	public String lockerListDetail(Model model, int employee_id, int no, int ing_no,
//			@RequestParam(defaultValue = "부서") String department_name ) {
//		
//		if(department_name != "부서") 
//			model.addAttribute("departmentEmployee", dao.departmentEmployee(department_name, employee_id));
//		
//		
//		model.addAttribute("department_name", department_name);
//		
//		Ing_tableVO vo = dao.lockerListDetail(no, employee_id);
//		model.addAttribute("document_content", vo.getDocument_content());
//		model.addAttribute("document_title", vo.getDocument_title());
//		model.addAttribute("employee_id", employee_id);
//		model.addAttribute("departments", emp_dao.departments());
//		model.addAttribute("ing_no", ing_no);
//		
//		return "side/approval/lockerListDetail";
//	}
	
	//수신함 목록 중 제목 클릭시 상세화면
	@RequestMapping("/receiveListDetail.ap")
	public String approvalListDetail(int no, int employee_id, Model model, String document_check) {
		model.addAttribute("receiveListDetail", dao.receiveListDetail(no, employee_id));
		model.addAttribute("employee_id", employee_id);
		model.addAttribute("document_checks", dao.document_checks());
		model.addAttribute("document_check", document_check);
		return "side/approval/receiveListDetail";
	}
	
	//수신함에서 처리하면 result_table에 저장
	@ResponseBody
	@RequestMapping(value="/insertResultEnd.ap", produces="text/html; charset=utf8")
	public String insertResultEnd(Ing_tableVO vo, String url, int ing_no){
		if(dao.insertResultEnd(vo) == 1 && dao.deleteIng(ing_no)==1) {
			StringBuffer msg = new StringBuffer("<script>");
			msg.append("alert('처리 완료.'); location='")
				.append(url).append("?employee_id=").append(vo.getApprover_id()).append("'");
			msg.append("</script>");
			return msg.toString();
		}
		return null;
	}
	
	//결재함 목록 중 제목 클릭시 상세화면
	@RequestMapping("/approvalListDetail.ap")
	public String approvalListDetail(int no, int employee_id, Model model) {
		model.addAttribute("approvalListDetail", dao.approvalListDetail(no, employee_id));
		model.addAttribute("employee_id", employee_id);
		return "side/approval/approvalListDetail";
	}
	
	//보관함 리스트에서 체크박스로 다수 게시글 한꺼번에 삭제
	@ResponseBody
	@RequestMapping(value="/deleteLocker.ap", produces="text/html; charset=utf8")
	public String deleteLocker(String[] deleteCheck, String url, int employee_id) {
		if(dao.deleteLocker(deleteCheck) == deleteCheck.length) {		//보낸 int[]를 편하게 String[]으로 받는다
			StringBuffer msg = new StringBuffer("<script>");
			msg.append("alert('삭제 완료.'); location='")
				.append(url).append("?employee_id=").append(employee_id).append("'");
			msg.append("</script>");
 			return msg.toString();
		}
		return null;		
	}
	
}
