package spring.model.memo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemoService {
	@Autowired
	private MemoDao dao;
	@Autowired
	private MemoReplyDao rdao;

	public void delete(int memono) throws Exception {
		rdao.bdelete(memono); // 댓글들 삭제
		dao.delete(memono); // 댓글을 가진 부모글 삭제(부모레코드)
	}
}