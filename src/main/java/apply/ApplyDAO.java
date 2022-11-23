package apply;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import recruit.CommonCodeVO;
import recruit.RecruitVO;

@Repository
public class ApplyDAO {

	@Autowired private SqlSession sql;
	
	public List<ApplyVO> applicant_list() {
		return sql.selectList("apply.applicant_list");
	}
	
	public List<ApplyVO> applicant_list(String recruit_num) {
		return sql.selectList("apply.applicant_list_num",recruit_num);
	}
	
	public List<ApplyVO> pass_list() {
		return sql.selectList("apply.pass_list");
	}
	
	public List<ApplyVO> pass_list(String recruit_num) {
		return sql.selectList("apply.pass_list_num");
	}
	
	
	public List<apply.RecruitVO> recruit_num () {
		return sql.selectList("apply.recruit_num");
	}
	
	
	public void apply_update(ApplyVO vo) {
		
		sql.update("apply.update", vo);
	}
	
	public void apply_update_check(int apply_num, String apply_check) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("apply_check", apply_check);
		map.put("apply_num", apply_num);
		sql.update("apply.update_check", map);
	}
	
	
	public int apply_phone_check(String apply_phone) {
		return sql.selectOne("apply.phone_check", apply_phone);
	}
	
	
	public void delete(int apply_num) {
		sql.delete("apply.delete", apply_num);
	}
	
	
	public List<RecruitVO> recruit_list(){
		
		return sql.selectList("apply.recruit_list");
	}
	public List<RecruitVO> recruit_list(String employee_pattern){
		
		return sql.selectList("apply.recruit_list_code", employee_pattern);
	}
	
	public List<CommonCodeVO> recruit_pattern(){
		
		return sql.selectList("apply.recruit_pattern");
	}
	
	public int apply_insert(ApplyVO vo) {
		return sql.insert("apply.insert", vo);
	}
	
	public int currval() {
		return sql.selectOne("apply.currval");
		
	}
	
	public ApplyVO apply_info(int apply_num) {
		return sql.selectOne("apply.apply_info", apply_num);
	}
	public apply.RecruitVO recruit_info(String recruit_num) {
		return sql.selectOne("apply.recruit_info", recruit_num);
	}
	
	public ApplyVO apply_info(String apply_phone, String apply_pw) {
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("apply_pw", apply_pw);
		map.put("apply_phone", apply_phone);
		
		return sql.selectOne("apply.apply_check", map);
	}
	
	/////////////////////////////////////////////
	
	
}
