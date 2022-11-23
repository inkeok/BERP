package com.hanul.berp;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import emp.EmpVO;
import member.MemberDAO;
import member.MemberVO;
import notice.NoticeDAO;
import notice.NoticeVO;

@Controller
public class NoticeController {

	@Autowired private MemberDAO member;
	@Autowired NoticeDAO dao;
	
	//게시판 리스트 
	@RequestMapping("/list.no")
	public String noticeList(Model model, HttpSession session) {
		List<NoticeVO> list =dao.notice_list();
		
		//로그인처리
		int id = 20221016;
		String pw = "0000";
		EmpVO vo = member.checkLogin(id, pw);
		session.setAttribute("loginInfo", vo);
		
		model.addAttribute("list",list);
		return "notice/list";
	}
	
	@RequestMapping("/new.no")
	public String insertNotice() {
		
		return "notice/new";
	}
	
}
