package com.hanul.berp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import emp.EmpVO;
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
	

@ResponseBody @RequestMapping(value="/andModify.mp", produces="text/html; charset=utf-8")
public String AndMyPageModify(int employee_id, String phone, String pw, String email) {

	mypage.EmpVO vo = new mypage.EmpVO();
	vo.setEmployee_id(employee_id);
	vo.setPhone(phone);
	vo.setPw(pw);
	vo.setEmail(email);
	//System.out.println(vo);
//mypage.EmpVO vo2= new Gson().fromJson(vo, mypage.EmpVO.class);

dao.and_emp_modify(vo);
return new Gson().toJson("dd");

/*
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


*/
}

//and에서 스프링으로 로그인 정보 보내줌 => employee_id
//변경저장처리 
//dto 패스워드 추가 확인 
}
