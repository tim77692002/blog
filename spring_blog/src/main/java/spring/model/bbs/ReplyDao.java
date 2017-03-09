package spring.model.bbs;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.model.IReplyDao;

@Repository
public class ReplyDao  implements IReplyDao{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public int rcount(int bbsno) {
		return sqlSessionTemplate.selectOne("reply.rcount", bbsno);
	}

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	public boolean create(ReplyDto dto) {
		boolean flag = false;

		int cnt = (Integer) sqlSessionTemplate.insert("reply.create", dto);
		if (cnt > 0)
			flag = true;

		return flag;
	}

	public ReplyDto read(int rnum) {

		return (ReplyDto) sqlSessionTemplate.selectOne("reply.read", rnum);

	}

	public boolean update(ReplyDto dto) {
		boolean flag = false;

		int cnt = sqlSessionTemplate.update("reply.update", dto);
		if (cnt > 0)
			flag = true;

		return flag;
	}

	public List<ReplyDto> list(Map map) {

		return sqlSessionTemplate.selectList("reply.list", map);
	}

	public int total(int bbsno) {
		return (Integer) sqlSessionTemplate.selectOne("reply.total", bbsno);
	}

	public boolean delete(int rnum) {
		boolean flag = false;
		int cnt = sqlSessionTemplate.delete("reply.delete", rnum);
		if (cnt > 0)
			flag = true;

		return flag;
	}

	/** 하나의 글의 여러댓글들 삭제 */
	// 글을 삭제할때 그 글에 달린 댓글을 한번에 삭제
	public int bdelete(int bbsno) throws Exception {
		return sqlSessionTemplate.delete("reply.bdelete", bbsno);

	}
}