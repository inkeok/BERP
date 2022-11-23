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

	public List<SalaryVO> SalaryList() {
		return sql.selectList("salary.salaryList");
	}
	
	public int andInsertBonus(HashMap<String, Object> map) {
		return sql.insert("salary.andInsertBonus", map);
	}
}
