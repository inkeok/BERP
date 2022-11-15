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
	
	@RequestMapping("/lockerList.ap")
	public String lockerList(String email, Model model) {
		model.addAttribute("lockerList", dao.lockerList(email));
		return "side/approval/lockerList";
	}
	
	@RequestMapping("/post.ap")
	public String post() {
		return "side/approval/post";
	}
	
	@RequestMapping("/insertPost.ap")
	public String insertPost(Ing_tableVO vo, String email) {
		dao.insertPost(vo);
		return "redirect:submitList.ap?email="+email;
	}
	
	@RequestMapping("/insertLocker.ap")
	public String insertLocker(Ing_tableVO vo, String email) {
		
		dao.insertLocker(vo);
		return "redirect:lockerList.ap?email="+email;
	}
}
