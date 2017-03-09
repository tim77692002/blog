package spring.model.team;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.utility.blog.DBClose;
import spring.utility.blog.DBOpen;

@Repository
public class TeamDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int total(String col, String word) {
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		return sqlSession.selectOne("team.total", map);
	}

	public List<TeamDto> list(Map map) {

		return sqlSession.selectList("team.list", map);
	}

	public boolean delete(int no) {
		boolean flag = false;
		int cnt = sqlSession.update("team.delete", no);
		if (cnt > 0)
			flag = true;
		return flag;
	}

	public boolean update(TeamDto dto) {
		boolean flag = false;
		int cnt = sqlSession.update("team.update", dto);
		if (cnt > 0)
			flag = true;
		return flag;
	}

	public TeamDto read(int no) {

		return sqlSession.selectOne("team.read", no);
	}

	public boolean create(TeamDto dto) {
		boolean flag = false;
		int cnt = sqlSession.insert("team.create", dto);
		if (cnt > 0)
			flag = true;
		return flag;
	}
}
