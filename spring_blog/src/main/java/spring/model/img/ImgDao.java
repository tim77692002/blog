package spring.model.img;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.utility.blog.DBClose;
import spring.utility.blog.DBOpen;

@Repository
public class ImgDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public boolean delete(int no) {
		boolean flag = false;
		int cnt = sqlSession.delete("img.delete", no);
		if (cnt > 0)
			flag = true;
		return flag;
	}

	public ImgDto readReply(int no) {
		return sqlSession.selectOne("img.readReply", no);
	}

	public boolean createReply(ImgDto dto) {
		boolean flag = false;
		int cnt = sqlSession.insert("img.createReply", dto);
		if (cnt > 0)
			flag = true;
		return flag;

	}

	public void upAnsnum(Map map) {
		sqlSession.update("img.upAnsnum", map);
	}

	public boolean checkRefno(int no) {
		boolean flag = false;
		int cnt = sqlSession.selectOne("img.checkRefno", no);
		if (cnt > 0)
			flag = true;
		return flag;
	}

	public boolean update(ImgDto dto) {
		boolean flag = false;
		int cnt = sqlSession.update("img.update", dto);
		if (cnt > 0)
			flag = true;
		return flag;
	}

	public boolean passCheck(Map map) {
		boolean flag = false;
		int cnt = sqlSession.selectOne("img.passCheck", map);
		if (cnt > 0)
			flag = true;
		return flag;
	}

	public boolean create(ImgDto dto) {
		boolean flag = false;
		int cnt = sqlSession.insert("img.create", dto);
		if (cnt > 0)
			flag = true;
		return flag;
	}

	public Map imgRead(int no) {
		return sqlSession.selectOne("img.imgRead", no);
	}

	public void upViewcnt(int no) {
		sqlSession.update("img.upViewcnt", no);
	}

	public int total(String col, String word) {
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		return sqlSession.selectOne("img.total", map);
	}

	public ImgDto read(int no) {
		return sqlSession.selectOne("img.read", no);
	}

	public List<ImgDto> list(Map map) {
		return sqlSession.selectList("img.list", map);
	}

}