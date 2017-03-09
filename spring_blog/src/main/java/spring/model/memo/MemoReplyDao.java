package spring.model.memo;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.model.IReplyDao;

@Repository
public class MemoReplyDao implements IReplyDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int rcount(int memono){
	    return sqlSessionTemplate.selectOne("memoreply.rcount", memono);
	}

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	public boolean create(MemoReplyDto dto) {
		boolean flag = false;

		int cnt = (Integer) sqlSessionTemplate.insert("memoreply.create", dto);
		if (cnt > 0)
			flag = true;

		return flag;
	}

	public MemoReplyDto read(int rnum) {

		return (MemoReplyDto) sqlSessionTemplate.selectOne("memoreply.read", rnum);

	}

	public boolean update(MemoReplyDto dto) {
		boolean flag = false;

		int cnt = sqlSessionTemplate.update("memoreply.update", dto);
		if (cnt > 0)
			flag = true;

		return flag;
	}

	public List<MemoReplyDto> list(Map map) {

		return sqlSessionTemplate.selectList("memoreply.list", map);
	}

	public int total(int bbsno) {
		return (Integer) sqlSessionTemplate.selectOne("memoreply.total", bbsno);
	}

	public boolean delete(int rnum) {
		boolean flag = false;
		int cnt = sqlSessionTemplate.delete("memoreply.delete", rnum);
		if (cnt > 0)
			flag = true;

		return flag;
	}

	/** 하나의 글의 여러댓글들 삭제 */
	// 글을 삭제할때 그 글에 달린 댓글을 한번에 삭제
	public int bdelete(int bbsno) throws Exception {
		return sqlSessionTemplate.delete("memoreply.bdelete", bbsno);

	}
}