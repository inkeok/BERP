package member;

import java.util.List;

public interface MemberService {
	//CRUD(Create, Read,  Update, Delete)
	int member_join(MemberVO vo); 				//회원가입시 회원정보 신규저장
	int member_id_check(String id);				//아이디 중복확인
	MemberVO member_login(String id, String pw);//로그인처리시 아이디/비번 일치하는 회원정보조회

	List<MemberVO> member_admin(); 				//관리자 회원 조회
	List<MemberVO> member_list(); 				//관리자모드: 전체 회원목록 조회
	int member_salt_pw(MemberVO vo); 	//암호화하지 않은 비밀번호를 암호화해서 저장
}
