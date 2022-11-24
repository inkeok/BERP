package com.hanul.berp;

import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import emp.EmpVO;
import member.MemberDAO;

import notice.NoticeDAO;
import notice.NoticePageVO;
import notice.NoticeVO;

@Controller
public class NoticeController {

	@Autowired private MemberDAO member;
	@Autowired NoticeDAO dao;
	
	//게시판 리스트 
	@RequestMapping("/list.no")
	public String noticeList(Model model, HttpSession session) {
		List<NoticeVO> list =dao.notice_list();
		
		//로그인처리
		int id = 20221016;
		String pw = "0000";
		EmpVO vo = member.checkLogin(id, pw);
		session.setAttribute("loginInfo", vo);
		
		model.addAttribute("list",list);
		return "notice/list";
	}
	
	@RequestMapping("/new.no")
	public String newNotice() {
		
		return "notice/new";
	}
	
	@RequestMapping("/insert.no")
	public String insertNotice(NoticeVO vo, MultipartFile file, HttpServletRequest request) {
		if( ! file.isEmpty() ) {
			vo.setFile_name(file.getOriginalFilename());
			vo.setFile_path(fileUpload("notice", file, request));
		}
		dao.notice_insert(vo);
		
			return "redirect:list.no";
	}
	
	@RequestMapping("/detail.no")
	public String detailNotice(Model model, int notice_num) {
		dao.notice_read(notice_num);
		
		NoticeVO vo = dao.notice_detail(notice_num);
		
		model.addAttribute("vo",vo);
		model.addAttribute("crlf", "\r\n");
		return "notice/detail";
	}
	
	@RequestMapping("/modify.no")
	public String modifyNotice (Model model, int notice_num) {
		NoticeVO vo = dao.notice_detail(notice_num);
		
		model.addAttribute("vo", vo);
		
		return "notice/modify";
	}
	
	@RequestMapping("/update.no")
	public String update(NoticeVO vo,
			String file_name, MultipartFile file, HttpServletRequest request) 
					throws Exception{
		
		
		NoticeVO notice = dao.notice_detail(vo.getNotice_num());
		
		if( file.isEmpty() ) {
		
			if( file_name.isEmpty() ) {
				
				attachedFile_delete(notice.getFile_path(), request);
				
			}else {
			
				vo.setFile_name( notice.getFile_name() );
				vo.setFile_path( notice.getFile_path() );
			}
			
		}else {
			
			vo.setFile_name( file.getOriginalFilename() );
			vo.setFile_path( fileUpload("notice", file, request) );	
			
			
			attachedFile_delete( notice.getFile_path(), request );
		}
	
		dao.notice_update(vo);
		
		//응답화면연결
		return "redirect:detail.no?notice_num=" + vo.getNotice_num();
	}
	
	
	@RequestMapping("/delete.no")
	public String delete(int notice_num, HttpServletRequest request) throws Exception {
		
		NoticeVO vo = dao.notice_detail(notice_num);
		//해당 공지글을 db에서 삭제하는 처리
		if( dao.notice_delete(notice_num)==1) {
			//첨부파일이 있었던 경우 해당 물리적 파일 삭제
			attachedFile_delete(vo.getFile_path(), request);
		}
		
		
		//응답화면 연결
		return "redirect:list.no";
		
		
		
	}
	
	
	//////////////파일저장처리 

	public String fileUpload(String category, MultipartFile file, HttpServletRequest request) {

		String path

				= "d://app" + request.getContextPath();

		String upload = "/upload/" + category + new SimpleDateFormat("/yyyy/MM/dd").format(new Date());

		path += upload;

		File folder = new File(path);
		if (!folder.exists())
			folder.mkdirs();

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
			if( file_path != null ) {
				//DB: http://localhost/smart/upload/notice/2022/10/21/80984d3_kakao_login.zip
				//실제: D:\\app\\smart\\upload\\notice\\2022\\10\\21\\abc.txt
				file_path = file_path.replace( appURL(request)
											, "d://app/" + request.getContextPath() );
				File file = new File( file_path );
				if( file.exists() ) file.delete();
			}
		}
		
		
		//파일다운로드
		public boolean fileDownload(String file_name, String file_path
								, HttpServletRequest request
								, HttpServletResponse response) throws Exception{
			//http://localhost/smart/upload/notice/2022/10/21/80984d3_kakao_login.zip
			//D:\\app\\smart\\upload\\notice\\2022\\10\\21\\abc.txt
			file_path = file_path.replace(
							appURL(request), "d://app/" + request.getContextPath() );
			
			//다운로드할 파일객체 생성		
			File file = new File( file_path );
			if( ! file.exists() ) return false;
			
			//text/html, image/png,  xlxs, .....
			String mime 
				= request.getSession().getServletContext().getMimeType(file_path);
			response.setContentType(mime);		
			
			file_name = URLEncoder.encode( file_name, "utf-8" );
			file_name = file_name.replaceAll("\\+", "%20");//.replaceAll("?", "%36");
			
			response.setHeader("content-disposition"
						, "attachment; filename="+ file_name); //첨부되어진 파일을 내려받도록 처리
			
			ServletOutputStream out = response.getOutputStream();
			FileCopyUtils.copy( new FileInputStream(file), out );
			out.flush();
			return true;
		}
		
	
}
