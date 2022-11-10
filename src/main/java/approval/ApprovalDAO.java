package approval;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
public class ApprovalDAO {
@Autowired @Qualifier("bteam") private SqlSession sql;

	public List<ApprovalVO> saveList(String employee_id) {
		return sql.selectList("approval.saveList", employee_id);
	}

	public List<ApprovalVO> submitList(String employee_id) {
		return sql.selectList("approval.submitList", employee_id);
	}
}
