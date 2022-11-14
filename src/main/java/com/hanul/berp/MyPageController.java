package com.hanul.berp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import mypage.EmpMemberVO;
import mypage.MemberVO;
import mypage.MyPageDAO;

@Controller
public class MyPageController {
	@Autowired MyPageDAO dao;
	
	
	
	@RequestMapping("/list.mem")
	public String list_member(Model model) {
		
		List<MemberVO> memberList = dao.member_list();
		
		model.addAttribute("list", memberList);
		
		
		return "side/myPage/list";
	}

	@RequestMapping("/info.mem")
	public String info_member(Model model, String email) {
		
		MemberVO memberInfo = dao.member_Info(email);
		int employee_id = dao.employee_id(email);
		
		EmpMemberVO empMember = dao.empMember_list(employee_id);
		
		model.addAttribute("Info", memberInfo);
		model.addAttribute("emp", empMember);
		
		
		return "side/myPage/info";
	}
	@RequestMapping("/modify.mem")
	public String modify_member(Model model, String email) {
		
		dao.member_modify(email);
		
		
		
		
		return "side/myPage/info";
	}
	
}
