package com.hanul.berp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import member.MemberDAO;
import member.MemberVO;

@Controller
public class MemberController {
	@Autowired private MemberDAO dao;
	
	@RequestMapping("/join.mem")
	public String join() {
		return "default/member/join";
	}
	
	//회원가입 아이디 중복 확인
	@ResponseBody @RequestMapping("/checkId")
	public boolean checkId(String id) {
		return dao.checkId(id)==1 ? false : true;
	}
	
	//회원가입 신청 정보 디비에 저장처리
	@ResponseBody
	@RequestMapping(value="/insert.mem", produces="text/html; charset=utf-8")
	public String insert(MemberVO vo, HttpServletRequest req) {
		StringBuffer msg = new StringBuffer("<script>");
		if( dao.insert(vo)==1 ) {
			msg.append("alert('success to sign-up'); location='")
				.append(req.getContextPath())
				.append("'");
			req.getSession().setAttribute("loginInfo", vo);
		}else {
			msg.append("alert('fail to sign-up'); history.back();");
		}
		msg.append("</script>");
		return msg.toString();
	}
	
	//로그인 입력페이지로
	@RequestMapping("/login.mem")
	public String login(HttpSession session) {
		session.setAttribute("category", "login");
		return "default/member/login";
	}
	
	//check id and pw for login
	@ResponseBody
	@RequestMapping("/checkLogin.mem")
	public boolean checkLogin(String id, String pw, HttpSession session) {
		MemberVO vo = dao.checkLogin(id, pw);
		session.setAttribute("loginInfo", vo);
		return vo == null ? false : true;
	}
	
	@RequestMapping("/logout.mem")
	public String logout(HttpSession session) {
		session.removeAttribute("loginInfo");
		return "redirect:/";
	}
}
