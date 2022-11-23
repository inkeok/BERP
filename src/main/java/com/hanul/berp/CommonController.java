package com.hanul.berp;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
	public String list(Model model
			,@RequestParam(defaultValue = "") String code, CommonVO vo
	//		,@RequestParam(defaultValue = "all") String code_title
//			,@RequestParam(defaultValue = "all") String code_value
//			,@RequestParam(defaultValue = "all") String code_used
//			,@RequestParam(defaultValue = "all") String code_name
			) {
		
		//code_title : 인사코드, 	code_value : 문서코드,	code_used : 고용형태코드,	code_name : 근무코드
//		String code_title = vo.getCode_title();
//		String code_value = vo.getCode_value();
//		String code_used = vo.getCode_used();
//		String code_name = vo.getCode_name();
//		vo.setCode_title("all");
//		vo.setCode_value("all");
//		vo.setCode_used("all");
//		vo.setCode_name("all");
		if( code.equals("code_title") ) {
			model.addAttribute("code_title", vo.getCode_title());  //선택한 코드
		}else if( code.equals("code_value") ) {
			model.addAttribute("code_value", vo.getCode_value());  //선택한 코드
		}else if( code.equals("code_used") ) {
			model.addAttribute("code_used", vo.getCode_used());  //선택한 코드
		}else if( code.equals("code_name") ) {
			model.addAttribute("code_name", vo.getCode_name());  //선택한 코드
		}
		
		List<CommonVO> code_titles = dao.personal_code(); //인사코드 목록(드랍다운목록)
		model.addAttribute("code_titles",code_titles);
		List<CommonVO> code_values = dao.document_code(); //문서코드 목록(드랍다운목록)
		model.addAttribute("code_values",code_values);
		List<CommonVO> code_used = dao.employee_code(); //문서코드 목록(드랍다운목록)
		model.addAttribute("code_used",code_used);
		List<CommonVO> code_name = dao.work_code(); //문서코드 목록(드랍다운목록)
		model.addAttribute("code_name",code_name);
		
		List<CommonVO> commonlist = dao.common_list();

//		if(code_title.equalsIgnoreCase("all")) {
//			list = dao.document_list(code_title);
//		}else {
//			System.out.println("안됨");
//		}
		
//		List<CommonVO> documentlist = dao.document_list();
		
//		if(code_title.equalsIgnoreCase("all")) {
//			commonlist = dao.Common_list();
		List<CommonVO> list = null;
		if( code.isEmpty() ) {
			list = dao.common_list(); //코드 전체 목록
		}else {
//			documentlist = dao.document_list();
			list = dao.common_list(vo, code); //선택한 코드 전체 목록
		}
		
		model.addAttribute("list", commonlist);
//		model.addAttribute("code_title", documentlist);
			
		model.addAttribute("list", list);

		
		return "side/common/common";
	}
	
	@RequestMapping("/common.detail")
	public String detail(String code_value, Model model) {
		
		CommonVO vo = dao.code_detail(code_value);
		
		model.addAttribute("vo", vo);
		return "side/common/detail";
		
	}
	
	@RequestMapping("/common.modify")
	public String modify(String code_value, Model model) {
		
		List<CommonVO> code_titles = dao.personal_code(); //인사코드 목록(드랍다운목록)
		model.addAttribute("code_titles",code_titles);
		List<CommonVO> code_values = dao.document_code(); //문서코드 목록(드랍다운목록)
		model.addAttribute("code_values",code_values);
		List<CommonVO> code_used = dao.employee_code(); //문서코드 목록(드랍다운목록)
		model.addAttribute("code_used",code_used);
		List<CommonVO> code_name = dao.work_code(); //문서코드 목록(드랍다운목록)
		model.addAttribute("code_name",code_name);

		
		model.addAttribute("vo", dao.code_detail(code_value));
		return "side/common/modify";
	}
	
	@RequestMapping("/common.update")
	public String update(CommonVO vo, String code_value, HttpServletRequest request) throws Exception {
		CommonVO code = dao.code_detail(vo.getCode_value());
		dao.code_update(vo);
		return "redirect:common.detail?code_value=" + code_value;
	}
	
}