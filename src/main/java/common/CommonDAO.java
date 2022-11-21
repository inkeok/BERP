package common;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommonDAO {
	@Autowired private SqlSession sql;
	
	public List<CommonVO> Common_list() {
		return sql.selectList("com.codelist");
	}
	
	public List<CommonVO> document_list(String code_title) {
		return sql.selectList("com.document_list", code_title);
	}
}
