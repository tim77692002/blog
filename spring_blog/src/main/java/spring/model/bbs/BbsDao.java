package spring.model.bbs;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BbsDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	// junit 테스트를 하려면 setter 생성이 필요함.
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	/**
	 * 부모글인지 확인해서 부모글이면 (true) 삭제 불가능.
	 * 
	 * @param bbsno
	 *            - 삭제하려는 글번호
	 * @return true - 부모글번호 / false - 부모글번호 아님
	 */
	public boolean checkRefno(int bbsno) {
		boolean flag = false;
		int cnt = sqlSession.selectOne("bbs.checkRefno", bbsno);
		if (cnt > 0)
			flag = true;
		return flag;
	}

	public int total(String col, String word) {
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		return sqlSession.selectOne("bbs.total", map);
	}

	public boolean createReply(BbsDto dto) {
		boolean flag = false;
		int cnt = sqlSession.insert("bbs.createReply", dto);
		if (cnt > 0)
			flag = true;
		return flag;
	}

	public void upAnsnum(Map map) {
		sqlSession.update("bbs.upAnsnum", map);
	}

	public BbsDto readReply(int bbsno) {
		return sqlSession.selectOne("bbs.readReply", bbsno);
	}

	public boolean delete(int bbsno) {
		boolean flag = false;
		int cnt = sqlSession.delete("bbs.delete", bbsno);
		if (cnt > 0)
			flag = true;
		return flag;
	}

	public boolean update(BbsDto dto) {
		boolean flag = false;
		int cnt = sqlSession.update("bbs.update", dto);
		if (cnt > 0)
			flag = true;
		return flag;
	}

	public boolean passCheck(Map map) {
		boolean flag = false;
		int cnt = sqlSession.selectOne("bbs.passCheck", map);
		if (cnt > 0)
			flag = true;
		return flag;
	}

	public BbsDto read(int bbsno) {
		return sqlSession.selectOne("bbs.read", bbsno);
	}

	public void upViewcnt(int bbsno) {
		sqlSession.update("bbs.upViewcnt", bbsno);
	}

	public List<BbsDto> list(Map map) {
		return sqlSession.selectList("bbs.list", map);
	}

	public boolean create(BbsDto dto) {
		boolean flag = false;
		int cnt = sqlSession.insert("bbs.create", dto);
		if (cnt > 0)
			flag = true;
		return flag;
	}
}