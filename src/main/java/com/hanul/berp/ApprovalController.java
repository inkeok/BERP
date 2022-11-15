package com.hanul.berp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import approval.ApprovalDAO;
import approval.Ing_tableVO;

@Controller
public class ApprovalController {
	@Autowired ApprovalDAO dao;
	
	//상신함 뷰
	@RequestMapping("/submitList.ap")
	public String submitList(String email, Model model) {
		model.addAttribute("submitList", dao.submitList(email));
		return "side/approval/submitList";
	}
	
	//보관함 뷰
	@RequestMapping("/lockerList.ap")
	public String lockerList(String email, Model model) {
		model.addAttribute("lockerList", dao.lockerList(email));
		return "side/approval/lockerList";
	}
	
	@RequestMapping("/post.ap")
	public String post() {
		return "side/approval/post";
	}
	
	//상신함 저장
	@ResponseBody
	@RequestMapping(value="/insertPost.ap", produces="text/html; charset=utf8")
	public String insertPost(Ing_tableVO vo, String email, String url) {
		if(dao.insertPost(vo)==1) {
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
}
