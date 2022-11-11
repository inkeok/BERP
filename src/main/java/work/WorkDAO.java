package work;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;



@Repository
public class WorkDAO {
	@Autowired @Qualifier("bteam") private SqlSession sql;
	
public List<WorkDAO> work_list(){
		
		return sql.selectList("work.list");
	}
	
	
}
