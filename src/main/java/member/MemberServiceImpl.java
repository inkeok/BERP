package member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired private MemberDAO dao;

	@Override
	public int member_join(MemberVO vo) {
		return dao.member_join(vo);
	}

	@Override
	public MemberVO member_login(String id, String pw) {
		return dao.member_login(id, pw);
	}

	@Override
	public int member_id_check(String id) {
		return dao.member_id_check(id);
	}
	
	@Override
	public List<MemberVO> member_list() {
		return dao.member_list();
	}

	@Override
	public int member_salt_pw(MemberVO vo) {
		return dao.member_salt_pw(vo);
	}

	@Override
	public List<MemberVO> member_admin() {
		return dao.member_admin();
	}

}
