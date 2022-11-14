package work;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.hanul.berp.EmpController;

import emp.EmpVO;



@Repository
public class WorkDAO {
	@Autowired @Qualifier("bteam") private SqlSession sql;
	
public List<WorkDAO> work_list(){
		
		return sql.selectList("work.list");
	}
	
	public WorkVO workInfo(String id) {
		
		return sql.selectOne("work.workInfo", id);
	}

	
	public int work_end_input(WorkVO wVo) {
		
		return sql.update("work.end_work",wVo);
	}
	
	
	public int work_start_input(WorkVO wVo) {
		
		return sql.update("work.start_work", wVo);
	}

	public EmpVO empInfo(String id) {
		
		return sql.selectOne("work.empInfo", id);
	}
	

	
}
