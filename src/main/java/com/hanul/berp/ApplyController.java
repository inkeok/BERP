package com.hanul.berp;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
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

import com.google.gson.Gson;

import apply.ApplyDAO;
import apply.ApplyVO;
import member.MemberVO;
import recruit.CommonCodeVO;
import recruit.RecruitVO;

@Controller
public class ApplyController {

	@Autowired ApplyDAO dao;
	
	@RequestMapping("/pass.apply")
	public String pass (ApplyVO vo ,String file_name, MultipartFile file, 
			HttpServletRequest request, int apply_num, String apply_check) {
	
		
		//ApplyVO apply = dao.apply_info(vo.getApply_num());
	
		dao.apply_update_check(apply_num, apply_check);
		
		
		return "redirect:applycantList.apply";
		
	}
	
	
	
	@RequestMapping("/check.apply") 
	public String admin_check(int apply_num, Model model) {
		ApplyVO vo = dao.apply_info(apply_num);
		model.addAttribute("vo",vo);
		
		
		return "apply/check";
	}
	
	
	
	@RequestMapping("/pass_check.apply")
	public String pass_checkList(Model model, @RequestParam(defaultValue="all") String recruit_num) {
		
		//지원자 조회
		List<ApplyVO> applicants;
		
		//채용공고 번호 조회
		List<apply.RecruitVO> recruit_list = dao.recruit_num();
		
		
		if(recruit_num.equalsIgnoreCase("all")) {
			//전체 지원자 리스트 조회recruits = 
			applicants = dao.pass_list();
		}else {
			//s선택
			applicants = dao.pass_list(recruit_num);
		}
		
		model.addAttribute("applicants", applicants);
		model.addAttribute("recruit_list", recruit_list);
		model.addAttribute("recruit_num", recruit_num);
		
		
		return "apply/pass_check";
	}
	
	@RequestMapping("/applicantList.apply")
	public String applicantList(Model model, @RequestParam(defaultValue="all") String recruit_num) {
		
		//지원자 조회
		List<ApplyVO> applicants;
		
		//채용공고 번호 조회
		List<apply.RecruitVO> recruit_list = dao.recruit_num();
		
		
		if(recruit_num.equalsIgnoreCase("all")) {
			//전체 지원자 리스트 조회recruits = 
			applicants = dao.applicant_list();
		}else {
			//s선택
			applicants = dao.applicant_list(recruit_num);
		}
		
		model.addAttribute("applicants", applicants);
		model.addAttribute("recruit_list", recruit_list);
		model.addAttribute("recruit_num", recruit_num);
		
		
		return "apply/applicantList";
	}

	@RequestMapping("/update.apply")
	public String update (ApplyVO vo ,String file_name, MultipartFile file, 
			HttpServletRequest request, int apply_num) throws Exception {
		
		ApplyVO apply = dao.apply_info(vo.getApply_num());
		
		if( file.isEmpty() ) {
			//첨부파일이 없는 경우
			if( file_name.isEmpty() ) {							
				attachedFile_delete(apply.getFile_path(), request);
				
			}else {
				//파일명이 있는 경우
				//원래 첨부파일이 있었고, 그 파일을 그대로 사용하는 경우
				vo.setFile_name(apply.getFile_name());
				vo.setFile_path(apply.getFile_path());
				
			}
			
		}else {
			//첨부파일이 있는 경우
			vo.setFile_name( file.getOriginalFilename() );
			vo.setFile_path( fileUpload("apply", file, request) );	
			
			//원래 첨부파일이 있었다면 물리적파일을 삭제
			attachedFile_delete( apply.getFile_path(), request );
		}
		
		
		dao.apply_update(vo);
		
		
		return "redirect:detail.apply?apply_num=" +apply_num;
		
	}
	
	@RequestMapping("/modify.apply")
	public String modify_apply(int apply_num, Model model) {
		ApplyVO vo = dao.apply_info(apply_num);
		model.addAttribute("vo",vo);
		
		
		return "apply/modify";
	}

	@ResponseBody @RequestMapping("/phone_check")
	public boolean id_check(String apply_phone) {
		//아이디가 db에 존재하는지 확인한 후 : 
		//1이면 사용불가(중복/false),0사용가넝(true)
			
		//true/false로 반환 
		
		return dao.apply_phone_check(apply_phone)==1 ? false:true;
		
	}
	
	@ResponseBody
	@RequestMapping("/application_detail") // ★ResponseBody
	public Object login(String apply_phone, String apply_pw, HttpSession session) {
				
		ApplyVO vo = dao.apply_info(apply_phone, apply_pw);
				
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("apply_num", vo == null? null : vo.getApply_num());
				map.put("exist", vo == null ? false : true);
		return map;

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
	public String detail (int apply_num,Model model) {
	 
		
		ApplyVO vo = dao.apply_info(apply_num);
		 
		 model.addAttribute("vo",vo);
		  
	 return "apply/detail"; 
	  
	}
	 
	
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
		
		
		dao.apply_insert(vo);
		int apply_num = dao.currval();		
		//String apply_phone = vo.getApply_phone();
		//String apply_pw = vo.getApply_pw();
		//int apply_num = vo.getApply_num();
		
		
		return "redirect:detail.apply?apply_num="+apply_num;
		//return "redirect:detail.apply?apply_phone=" + apply_phone+"&apply_pw="+apply_pw;
		
	}
	
	
	@RequestMapping("/fillout.apply")
	public String fillout(String recruit_num,String recruit_title, 
			 Model model) {
		
		
		//vo.setRecruit_num(recruit.get)
		//model.addAttribute("recruit",recruit);
		apply.RecruitVO recruit = dao.recruit_info(recruit_num);
		model.addAttribute("recruit",recruit);
		
		return "apply/fillout";
	}
	
		 ////////////////////////////////////////////////////
 
}
