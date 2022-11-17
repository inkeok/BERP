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
	
	public List<Ing_tableVO> approvalList(String email) {
		List<Ing_tableVO> list = sql.selectList("approval.approvalList", email);
		return list;
	}
	
	public int insertPost(Ing_tableVO vo) {
		return sql.insert("approval.insertPost", vo);
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
	public int deleteLockerOne(int ing_no) {
		return sql.delete("approval.deleteLockerOne", ing_no);
	}
	
	public Ing_tableVO approvalListDetail(int no, String email) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("no", no+"");
		return sql.selectOne("approval.approvalListDetail", map);
	}
	
}
