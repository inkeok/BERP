package common;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.google.gson.JsonElement;

@Repository
public class CommonDAO {
	@Autowired private SqlSession sql;
//	public List<CommonVO> Common_list() {
	/*
	code_title : 인사코드, 	code_value : 문서코드,	code_used : 고용형태코드,	code_name : 근무코드	 
	 */
//	코드 전체 목록 가져오기
	public List<CommonVO> common_list() {
		return sql.selectList("com.codelist");
	}
	//선택한 코드 전체 목록
	public List<CommonVO> common_list(CommonVO vo, String code) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("vo", vo);
		map.put("code", code);
		return sql.selectList("com.codelist_select", map);
	}
	
//	인사코드 드롭다운
	public List<CommonVO> personal_code() {
		return sql.selectList("com.personal_code");
	}

//	문서코드 드롭다운
	public List<CommonVO> document_code() {
		return sql.selectList("com.document_code");
	}
	
//	고용형태코드 드롭다운
	public List<CommonVO> employee_code() {
		return sql.selectList("com.employee_code");
	}
//	
//	public List<CommonVO> document_list(String code_title) {
//		return sql.selectList("com.document_list", code_title);
//	근무구분코드 드롭다운
	public List<CommonVO> work_code() {
		return sql.selectList("com.work_code");
	}
	
	public CommonVO code_detail(String code_value) {
		return sql.selectOne("com.detail", code_value);
	}

	public void code_update(CommonVO vo) {
		sql.update("com.update", vo);
	}
	
	public void delete(String code_value) {
		sql.delete("com.delete", code_value);
	}
	
	public CommonVO check_code(String code_name) {
		return sql.selectOne("com.check_code", code_name);
	}
	/////////////////////////////////////////////////////////////////////////
	public List<CommonVO> and_rec_list() {
		return sql.selectList("com.andSelect");
	}
	
	public List<CommonVO> and_code_spinnerList() {
		return sql.selectList("com.andSpinnerList");
	}
	
	
	  public List<CommonVO> and_code_spinner_valuelist(String title) {
		  return sql.selectList("com.andSpinnerValuelist", title); 
		  }
	 
	

	
}