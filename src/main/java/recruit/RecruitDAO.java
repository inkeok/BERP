package recruit;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository

public class RecruitDAO {

	@Autowired private SqlSession sql;
	
	public void delete(String recruit_num) {
		sql.delete("recruit.delete", recruit_num);
		
	}
	
	public String currval() {
		return sql.selectOne("recruit.currval");
	}
	
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
	
	public void recruit_update(RecruitVO vo) {
		sql.update("recruit.update", vo);
	}

}
