package com.hanul.berp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import member.AndLoginMemberVO;
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
	
	
///////////////////////////////////안드로이드/////////////////////////////////////////////////////////
	
/*	
@ResponseBody @RequestMapping(value="/andModify.mypage", produces="text/html; charset=utf-8")
public String AndLoginCheck(String id, String pw) {
Boolean info = false;
List<AndLoginMemberVO> memList = dao.andCheckLogin();
System.out.println(memList.get(0).getEmployee_id());
for (int i = 0; i < memList.size(); i++) {
if(memList.get(i).getEmployee_id() == Integer.parseInt(id) && memList.get(i).getPw().equals(pw)) {
info = true;
break;
}else {
continue;
}
}

if(!info) {
return "zzz";
}else{
List<AndLoginMemberVO> loginList = dao.andLogin(id);

return new Gson().toJson(loginList);
}



}
	*/ 

//dto 패스워드 추가 확인 
}
