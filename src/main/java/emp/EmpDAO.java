package emp;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
public class EmpDAO {
	@Autowired @Qualifier("bteam") private SqlSession sql;
	
	public List<EmpVO> employee_list(){
		
		return sql.selectList("emp.list");
	}

}
