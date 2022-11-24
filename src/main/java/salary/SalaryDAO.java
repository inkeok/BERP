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
		List<SalaryVO> salaryList = sql.selectList("salary.salaryList");
		return salaryList;
	}
	
	public int andInsertBonus(HashMap<String, Object> map) {
		int res = sql.insert("salary.andInsertBonus", map);
		return res;
	}
	
	public List<BonusVO> andBonusList(){
		List<BonusVO> bonusList = sql.selectList("salary.andBonusList");
		return bonusList;
	}
	public int andCommissionSave(int employee_id, int commission_pct){
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("employee_id", employee_id+"");
		map.put("commission_pct", commission_pct+"");
		int res = sql.update("salary.andCommissionSave", map);
		return res;
	}
	public int andSalarySave(int employee_id, int salary){
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("employee_id", employee_id+"");
		map.put("salary", salary+"");
		int res = sql.update("salary.andSalarySave", map);
		return res;
	}
	
	
	public SalaryVO andMySalaryVo(int employee_id) {
		SalaryVO vo = sql.selectOne("salary.andMySalaryVo", employee_id); 
		return vo;
	}
	
	public List<BonusVO> andMyBonusList(int employee_id) {
		List<BonusVO> list = sql.selectList("salary.andMyBonusList", employee_id);
		return list;
	}
}
