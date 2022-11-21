package approval;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import emp.EmpVO;

@Repository
public class ApprovalDAO {
@Autowired @Qualifier("bteam") private SqlSession sql;

	public List<Ing_tableVO> submitList(String email) {
		return sql.selectList("approval.submitList", email);
	}
	
	public List<Ing_tableVO> lockerList(String email) {
		return sql.selectList("approval.lockerList", email);
	}
	
	public List<Ing_tableVO> receiveList(String email) {
		List<Ing_tableVO> list = sql.selectList("approval.receiveList", email);
		return list;
	}
	public List<Result_tableVO> approvalList(String email) {
		List<Result_tableVO> list = sql.selectList("approval.approvalList", email);
		return list;
	}
	
	public int insertPost(Ing_tableVO vo) {
		return sql.insert("approval.insertPost", vo);
	}
	
	public int insertResult(Ing_tableVO vo) {
		return sql.insert("approval.insertResult", vo);
	}
			
	public int insertLocker(Ing_tableVO vo) {
		return sql.insert("approval.insertLocker", vo);
	}
	
	public List<EmpVO> departmentEmployee(String department_name){
		return sql.selectList("approval.departmentEmployee", department_name);
	}
	
	public Ing_tableVO submitListDetail(int no, String email) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("no", no+"");
		//Ing_tableVO vo = sql.selectOne("approval.submitListDetail", map);
		return sql.selectOne("approval.submitListDetail", map);
	}
	
	public Ing_tableVO lockerListDetail(int no, String email) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("no", no+"");
		Ing_tableVO vo = sql.selectOne("approval.lockerListDetail", map);		
		return vo;
	}
	
	//ing_table 목록 중 하나 삭제
	public int deleteIng(int ing_no) {
		return sql.delete("approval.deleteIng", ing_no);
	}
	
	public Ing_tableVO receiveListDetail(int no, String email) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("no", no+"");
		return sql.selectOne("approval.receiveListDetail", map);
	}
	
	//처리 상태 select tag에 쓰일 리스트 read
	public List<Object> document_checks() {
		return sql.selectList("approval.document_checks");
	}
	
	public int insertResultEnd(Ing_tableVO vo) {
		return sql.insert("approval.insertResultEnd", vo);
	}
	
//	public int insertResult(Ing_tableVO vo) {
//		return sql.insert("approval.insertResult", vo);
//	}
	
//	public int updateIng(Ing_tableVO vo) {
//		return sql.insert("approval.updateIng", vo);
//	}
	
}
