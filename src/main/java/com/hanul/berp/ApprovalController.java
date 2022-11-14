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
	
	@RequestMapping("/submitList.ap")
	public String submitList(String email, Model model) {
		model.addAttribute("submitList", dao.submitList(email));
		return "side/approval/submitList";
	}
	
	@RequestMapping("/post.ap")
	public String post() {
		return "side/approval/post";
	}
	
	
	@ResponseBody @RequestMapping("/insertPost.ap")
	public String submitPost(Ing_tableVO vo) {
		if ( dao.insertPost(vo)==1 ) {
			StringBuffer msg = new StringBuffer("<script>");
			msg.append("alert('제출했습니다.');")
			.append("location='submitList.ap'");
			msg.append("</script>");
			return msg.toString();
		}
		return null;
	}

}
