package mypage;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

public class MyPageDAO {
	@Autowired @Qualifier("bteam") private SqlSession sql;

}
