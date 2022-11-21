package work;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.hanul.berp.EmpController;

import emp.DepartmentVO;
import emp.EmpVO;



@Repository
public class WorkDAO {
	@Autowired @Qualifier("bteam") private SqlSession sql;
	
	/*
	 * public List<WorkDAO> work_list(){
	 * 
	 * return sql.selectList("work.list"); }
	 */
	
	public WorkVO workInfo(String id) {
		
		return sql.selectOne("work.workInfo", id);
	}

	
	public int work_end_input(String end_work) {
		
		System.out.println(end_work+"dao");
		return sql.update("work.end_work",end_work);
	}
	
	
	public int work_start_input(String start_work) {
		
		return sql.insert("work.start_work", start_work);
	}

	public EmpVO empInfo(String id) {
		
		return sql.selectOne("work.empInfo", id);
	}
	
	public List<WorkResultVO> rList() {
		
		return sql.selectList("work.list");
	}
	public List<WorkResultVO> holiday_list() {
		
		return sql.selectList("work.holiday_list");
	}

	public List<CommonCodeVO> codeList(){
		
		return sql.selectList("work.codeList");
	}
	public int holiday_submit(HolidayVO vo){
		
		return sql.insert("holiday_submit", vo);
	}
	
	public List<HolidayResultVO> holiday_submit_list(){
		
		return sql.selectList("work.holiday_submit_list");
	}
	public List<HolidayVO> holidayList(){
		
		return sql.selectList("work.holidayList");
	}
	
	public List<DepartmentVO> departments(){
		
		return sql.selectList("work.departments");
	}
	
	public List<WorkResultVO> department_work(int department_id) {
		return sql.selectList("work.department_work", department_id);
	}
	
	public List<WorkResultVO> department_work() {
		return sql.selectList("work.department_work");
	}
	
	
	public WorkPageVO tenList(WorkPageVO page) { // 글의 총건수를 조회
		page.setTotalList(sql.selectOne("work.total", page)); // 공지글 10건 조회
		page.setList(sql.selectList("board.list", page));
		return page;
	}
	

	
}
