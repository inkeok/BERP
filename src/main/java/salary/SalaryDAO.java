package salary;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;


@Repository
public class SalaryDAO {
	@Autowired @Qualifier("bteam") private SqlSession sql;
	
	public List<SalaryVO> salary_List() {
		return sql.selectList("salary.saList");
	}
	public List<SalEmpVO> employee_list(){
		return sql.selectList("salary.empList");
	}
	//부서목록조회
	public List<SalEmpVO> departments() {
		return sql.selectList("salary.departments");
	}
	public List<SalEmpVO> employee_list_d(int department_id){
		return sql.selectList("salary.empList_d",department_id);
	}
	public SalEmpVO mod_info(int employee_id) {
		return sql.selectOne("salary.modInfo", employee_id);
	}
	public void update_salary(SalEmpVO vo) {
		sql.update("salary.update_salary", vo);
	}
	public int insert_bonus(SalEmpVO vo) {
		return sql.insert("salary.insert_bonus", vo);
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
