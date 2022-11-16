package apply;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import recruit.CommonCodeVO;
import recruit.RecruitVO;

@Repository
public class ApplyDAO {

	@Autowired private SqlSession sql;
	
	public List<RecruitVO> recruit_list(){
		
		return sql.selectList("apply.recruit_list");
	}
	public List<RecruitVO> recruit_list(String employee_pattern){
		
		return sql.selectList("apply.recruit_list_code", employee_pattern);
	}
	
	public List<CommonCodeVO> recruit_pattern(){
		
		return sql.selectList("apply.recruit_pattern");
	}
	
	public void apply_insert(ApplyVO vo) {
		sql.selectOne("apply.insert");
	}
	
	public int currval() {
		return sql.selectOne("apply.currval");
		
	}
	
}
