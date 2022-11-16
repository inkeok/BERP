package com.hanul.berp;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import apply.ApplyDAO;
import apply.ApplyVO;
import recruit.CommonCodeVO;
import recruit.RecruitVO;

@Controller
public class ApplyController {

	@Autowired ApplyDAO dao;
	
	@RequestMapping("/insert.apply")
	
	public String insert(ApplyVO vo, MultipartFile file, HttpServletRequest request) {
		
		// 첨부파일이 있는 경우
		if (!file.isEmpty()) {
			vo.setFile_name(file.getOriginalFilename());
			vo.setFile_path(fileUpload("recruit", file, request));
		}
		//★★★recruit_num <받아서 보내줘야됨
		dao.apply_insert(vo);
		//int apply_num = dao.currval();
		
		//return "redirect:detail.apply?apply_num=" + apply_num;
		return "redirect:applyList.apply";
	}
	
	
	@RequestMapping("/fillout.apply")
	public String fillout(String recruit_num, Model model) {
		//List<ApplyVO> vo = dao.
		
		return "apply/fillout";
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
}
