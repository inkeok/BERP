package recruit;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository

public class RecruitDAO {

	@Autowired private SqlSession sql;
	
	
	public List<RecruitVO> recruit_list(){
		
		return sql.selectList("recruit.list");
	}
	
	public int recruit_insert(RecruitVO vo) {
		return sql.insert("recruit.insert", vo);
	}
	
	public List<CommonCodeVO> recruit_pattern(){
	
		return sql.selectList("recruit.pattern");
	}
	
	public RecruitVO recruit_info(String recruit_num) {
		
		return sql.selectOne("recruit.detail", recruit_num);
	}

}
