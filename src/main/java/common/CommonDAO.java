package common;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommonDAO {
	@Autowired private SqlSession sql;
	
	public List<CommonVO> Common_list() {
		return sql.selectList("com.comList");
	}
}
