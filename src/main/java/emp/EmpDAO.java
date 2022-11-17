package emp;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
public class EmpDAO {

	@Autowired private SqlSession sql;
	
	//정보화면창
	public EmpVO emp_info(int employee_id) {
		return sql.selectOne("emp.info", employee_id);
	}
	
	//직급조회
	public List<EmpVO> position() {
		return sql.selectList("emp.position");
	}
	
	//회사코드조회
	public List<CompanyVO> company() {
		return sql.selectList("emp.company"); 
	}

	//사원목록조회
	public List<EmpVO> employee_list(){
		return sql.selectList("emp.empList");
	}
	
	//부서목록조회
	public List<DepartmentVO> departments() {
		return sql.selectList("emp.departments");
	}
	
	//사원정보저장
	public void employee_insert(EmpVO vo) {
		sql.insert("emp.insert", vo);
		
	}
	
	
	public void employee_update(EmpVO vo) {
		sql.update("emp.update", vo);
	}

	public void employee_delete(int employee_id) {
		// TODO Auto-generated method stub
		
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////

	public List<EmpVO> andEmp_list() {
		
		return sql.selectList("emp.empList");
	}
	public List<EmpVO> andEmp_department_list(){
		return sql.selectList("emp.andDepartments");
	}
	
	public List<EmpVO> andEmp_company_list(){
		return sql.selectList("emp.andCompany");
	}
	public List<EmpVO> andEmp_position_list(){
		return sql.selectList("emp.andPosition");
	}

	public List<DepartmentVO> andEmp_depatment_list(){
		return sql.selectList("emp.departments");
	}
}
