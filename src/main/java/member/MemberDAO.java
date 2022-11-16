package member;

import java.util.ArrayList;
import java.util.HashMap;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;



@Repository
public class MemberDAO {
	@Autowired private SqlSession sql;

	public int insert(MemberVO vo) {
	      return sql.insert("member.insert", vo);
	   }
	
	//회원가입 때 아이디 중복체크
	public int checkId(String id) {
		return sql.selectOne("member.checkId", id);
	}
	
	//로그인할 때 아이디와 비밀번호 체크
	public MemberVO checkLogin(String id, String pw) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pw", pw);
		return sql.selectOne("member.checkLogin", map);
	}
	
	
	////////////////////////////////////////////////////////////////////////
	public int andInsert(ArrayList<JoinDTO> list) {
		return sql.insert("member.insert", list);
	}
	
}//class
