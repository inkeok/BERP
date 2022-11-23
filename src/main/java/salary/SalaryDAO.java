package salary;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import emp.EmpVO;

@Repository
public class SalaryDAO {
	@Autowired @Qualifier("bteam") private SqlSession sql;
	
	
	public List<EmpVO> employee_list(){
		return sql.selectList("salary.empList");
	}
	
	
	
	
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////

	public List<SalaryVO> salaryList() {
		return sql.selectList("salary.salaryList");
	}
	
	public int andInsertBonus(HashMap<String, Object> map) {
		return sql.insert("salary.andInsertBonus", map);
	}
	
	public List<BonusVO> andBonusList(){
		return sql.selectList("salary.andBonusList");
	}
	public int andCommissionSave(int employee_id, int commission_pct){
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("employee_id", employee_id+"");
		map.put("commission_pct", commission_pct+"");
		return sql.update("salary.andCommissionSave", map);
	}
	public int andSalarySave(int employee_id, int salary){
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("employee_id", employee_id+"");
		map.put("salary", salary+"");
		return sql.update("salary.andSalarySave", map);
	}
}
