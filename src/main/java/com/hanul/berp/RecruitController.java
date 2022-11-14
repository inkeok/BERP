
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
import org.springframework.web.multipart.MultipartFile;


import recruit.CommonCodeVO;
import recruit.RecruitDAO;
import recruit.RecruitVO;

@Controller
public class RecruitController {
	@Autowired
	RecruitDAO dao;
	
	// 공지글상세화면 요청
	@RequestMapping("/detail.rec")
	public String info(Model model, String recruit_num) {		
		
		// 해당 공지글 정보를 DB에서 조회해와
		//RecruitVO recruit = dao.recruit_info(recruit_num);
		// 화면에 출력할 수 있도록 Model 에 attribute 로 담는다
		model.addAttribute("vo", dao.recruit_info(recruit_num));
		
		// 응답화면연결
		return "recruit/info";
	}

	@RequestMapping("/list.rec")
	public String recruitList(Model model) {
		List<RecruitVO> recruit = dao.recruit_list();
		model.addAttribute("recruitList", recruit);
		
		return "recruit/list";
	}
	
	@RequestMapping("/new.rec")
	public String board(Model model) {	
		List<CommonCodeVO> code = dao.recruit_pattern();
		List<RecruitVO> recruit = dao.recruit_list();
		
		model.addAttribute("code", code);
		model.addAttribute("recruitList", recruit);
		
		return "recruit/new";
	}
	
	@RequestMapping("/insert.rec")
	public String insert(RecruitVO vo, MultipartFile file, HttpServletRequest request) {
		// 첨부파일이 있는 경우
		if (!file.isEmpty()) {
			vo.setFile_name(file.getOriginalFilename());
			vo.setFile_path(fileUpload("recruit", file, request));
		}

		// 화면에서 입력한 정보를 DB에 신규저장한 후
		dao.recruit_insert(vo);
		// 응답화면연결
		return "redirect:list.rec";
	}

	// 파일업로드
	public String fileUpload(String category, MultipartFile file, HttpServletRequest request) {
		// upload/profile/2022/10/20/abc.txt
		// upload/notice/2022/10/20/abc.png
		// 업로드 위치: D:\Study_Spring\Workspace\.meta....pps\smart\resources
		String path
//			= request.getSession().getServletContext().getRealPath("resources");
				= "d://app" + request.getContextPath();

		// /upload/profile/2022/10/20
		String upload = "/upload/" + category + new SimpleDateFormat("/yyyy/MM/dd").format(new Date());

		// D:\Study_Spring\Wor...pps\smart\resources/upload/profile/2022/10/20
		path += upload;

		// 폴더가 있는지 확인해서 없으면 폴더를 생성한다
		File folder = new File(path);
		if (!folder.exists())
			folder.mkdirs();

		// 업로드하는 파일명을 고유한 아이디를 붙여 저장한다: ajlh2348-ahflhq_abc.txt
		String filename = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();

		try {
			file.transferTo(new File(path, filename));
		} catch (Exception e) {
		}

		// /upload/profile/2022/10/20/ajlh2348-ahflhq_abc.txt
		// -> http://localhost/smart/upload/profile/2022/10/20/ajlh2348-ahflhq_abc.txt
		return appURL(request) + upload + "/" + filename;
	}

	public String appURL(HttpServletRequest request) {
		// http://localhost/smart/join : URL
		// /join : servletPath
		// -> http://localhost/smart
		return request.getRequestURL().toString().replace(request.getServletPath(), "");
	}
	
}
