package com.hanul.berp;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import member.MemberServiceImpl;
import member.MemberVO;

@Controller
public class MemberController {
 	
	
	@RequestMapping("/join")
	public String join(HttpSession session) {
		session.setAttribute("nav-sign", "join");
		return "member/join";
		
	}
	
	@RequestMapping("/login")
	public String login(HttpSession session) {
		session.setAttribute("nav-sign", "login");
		return "member/login";
		
	}
	
//	@Autowired private MemberServiceImpl service;
//
//	
//	//아이디 중복확인처리 요청
//	@ResponseBody @RequestMapping("/id_check")
//	public boolean id_check(String id) {
//		//아이디가 DB에 존재하는지 확인한 후: 1:사용불가(false), 0:사용가능(true)
//		//true/false 로 반환
//		return service.member_id_check(id)==1 ? false : true;
//	}
//	
//	
//	//회원가입화면 요청
//	@RequestMapping("/member")
//	public String member(HttpSession session) {
//		session.setAttribute("category", "join");
//		//응답화면연결
//		return "member/join";
//	}
//	
//	//로그인화면 요청
//	@RequestMapping("/login")
//	public String login(HttpSession session) {
//		session.setAttribute("category", "login");
//		
//		//응답화면연결
//		return "default/member/login";
//	}
}
