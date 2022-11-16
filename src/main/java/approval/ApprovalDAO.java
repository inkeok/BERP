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
		return sql.selectList("approval.approvalList", email);
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
		return sql.selectOne("approval.submitListDetail", map);
	}
	
}
