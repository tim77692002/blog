package spring.model.bbs;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BbsService {
	@Autowired
	private BbsDao dao;
	@Autowired
	private ReplyDao rdao;

	public void delete(int bbsno) throws Exception {
		rdao.bdelete(bbsno); // 댓글들 삭제
		dao.delete(bbsno); // 댓글을 가진 부모글 삭제(부모레코드)
	}
}