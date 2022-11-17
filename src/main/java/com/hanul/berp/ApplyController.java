package com.hanul.berp;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import apply.ApplyDAO;
import apply.ApplyVO;
import member.MemberVO;
import recruit.CommonCodeVO;
import recruit.RecruitVO;

@Controller
public class ApplyController {

	@Autowired ApplyDAO dao;

	@ResponseBody @RequestMapping("/phone_check")
	public boolean id_check(String apply_phone) {
		//아이디가 db에 존재하는지 확인한 후 : 
		//1이면 사용불가(중복/false),0사용가넝(true)
			
		//true/false로 반환 
		
		return dao.apply_phone_check(apply_phone)==1 ? false:true;
		
	}
	
	@ResponseBody
	@RequestMapping("/application_detail") // ★ResponseBody<login.jsp
	public boolean login(String apply_phone, String apply_pw, HttpSession session) {
				
		ApplyVO vo = dao.apply_info(apply_phone, apply_pw);
				
		return vo == null ? false : true;

	}
		
	//화면요청
	@RequestMapping("/application.apply")
	public String application( Model model) {
				
		return "side/apply/application_check";
	}
	
	
	@RequestMapping("/delete.apply")
	public String delete(int apply_num) {
		dao.delete(apply_num);
		
		return "redirect:applyList.apply";
	}
	
	  
	@RequestMapping("/detail.apply") 
	public String detail (String apply_phone, String apply_pw,Model model) {
	 
		
		ApplyVO vo = dao.apply_info(apply_phone, apply_pw);
		 
		 model.addAttribute("vo",vo);
		  
	 return "apply/detail"; 
	  
	}
	 
	/*
	@RequestMapping(value="/insert.apply", produces="text/html; charset=utf-8")	
	public String insert( String recruit_num,RecruitVO recruit 
			,Model model ,ApplyVO vo, MultipartFile file, HttpServletRequest request) {
		
		if (!file.isEmpty()) {
			vo.setFile_name(file.getOriginalFilename());
			vo.setFile_path(fileUpload("apply", file, request));
		}
		
		StringBuffer msg = new StringBuffer();
		dao.apply_insert(vo);
		if(dao.apply_insert(vo)==1) {
			msg.append("alert('회원가입을 축하합니다^^'); location='")
			 .append( request.getContextPath() ).append("'");			
		}else {
			msg.append("alert('회원가입에 실패했습니다ㅠㅠ'); history.go(-1);");

		}
			
		msg.append("</script>");
		
		
		
		return msg.toString();
		//return "redirect:applyList.apply";
	}
	
	
	@RequestMapping("/fillout.apply")
	public String fillout(String recruit_num,String recruit_title, 
			 Model model) {
		
		
		//vo.setRecruit_num(recruit.get)
		apply.RecruitVO recruit = dao.recruit_info(recruit_num);
		//model.addAttribute("recruit",recruit);
		model.addAttribute("recruit",recruit);
		
		return "apply/fillout";
	}
	
	*/
	@RequestMapping("/applyList.apply")
	public String recruitList(Model model, @RequestParam(defaultValue="all") String employee_pattern) {
		//사원조회
		List<RecruitVO> recruit ;
		
		//코드 목록 조회
		List<CommonCodeVO> code = dao.recruit_pattern();

		if(employee_pattern.equalsIgnoreCase("all")) {
			recruit = dao.recruit_list();
		}else {
			recruit = dao.recruit_list(employee_pattern);
		}
		
		
		model.addAttribute("recruitList", recruit);
		model.addAttribute("code", code);
		model.addAttribute("code_value", employee_pattern);
		
		
		return "apply/applyList";
	}
	
	// 파일업로드
		public String fileUpload(String category, MultipartFile file, HttpServletRequest request) {
			
			String path

					= "d://app" + request.getContextPath();

			
			String upload = "/upload/" + category + new SimpleDateFormat("/yyyy/MM/dd").format(new Date());

			
			path += upload;

			
			File folder = new File(path);
			if (!folder.exists())
				folder.mkdirs();

			// 업로드하는 파일명을 고유한 아이디를 붙여 저장한다: ajlh2348-ahflhq_abc.txt
			String file_name = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();

			try {
				file.transferTo(new File(path, file_name));
			} catch (Exception e) {
			}

			
			return appURL(request) + upload + "/" + file_name;
		}

		public String appURL(HttpServletRequest request) {
			
			return request.getRequestURL().toString().replace(request.getServletPath(), "");
		}
		//첨부되어진 물리적 파일 삭제
		public void attachedFile_delete(String file_path, HttpServletRequest request) {
			if (file_path != null) {
				
				file_path = file_path.replace(appURL(request), "d://app/" + request.getContextPath());
				File file = new File(file_path);
				if (file.exists())
					file.delete();
			}
		}
		
		
		
	
		 
		  @RequestMapping("/insert.apply")	
	public String insert( String recruit_num,RecruitVO recruit 
			,Model model ,ApplyVO vo, MultipartFile file, HttpServletRequest request) {
		
		// 첨부파일이 있는 경우
		if (!file.isEmpty()) {
			vo.setFile_name(file.getOriginalFilename());
			vo.setFile_path(fileUpload("apply", file, request));
		}
		//★★★recruit_num <받아서 보내줘야됨
		//dao.apply_info(recruit_num);
		//vo.setRecruit_num(recruit.getRecruit_num());
		//model.addAttribute("vo",dao.apply_insert(vo));
		
		dao.apply_insert(vo);
		//int apply_num = dao.currval();		
		String apply_phone = vo.getApply_phone();
		String apply_pw = vo.getApply_pw();
		
		return "redirect:detail.apply?apply_phone=" + apply_phone+"&apply_pw="+apply_pw;
		//return "redirect:applyList.apply";
	}
	
	
	@RequestMapping("/fillout.apply")
	public String fillout(String recruit_num,String recruit_title, 
			 Model model) {
		
		
		//vo.setRecruit_num(recruit.get)
		apply.RecruitVO recruit = dao.recruit_info(recruit_num);
		//model.addAttribute("recruit",recruit);
		model.addAttribute("recruit",recruit);
		
		return "apply/fillout";
	}
	
		  
		 
}
