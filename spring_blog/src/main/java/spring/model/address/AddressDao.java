package spring.model.address;

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
public class AddressDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int total(String col, String word) {
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		return sqlSession.selectOne("address.total", map);
	}

	public List<AddressDto> list(Map map) {
		return sqlSession.selectList("address.list", map);
	}

	public AddressDto read(int no) {
		return sqlSession.selectOne("address.read", no);
	}

	public boolean create(AddressDto dto) {
		boolean flag = false;
		int cnt = sqlSession.insert("address.create", dto);
		if (cnt > 0) {
			flag = true;
		}
		return flag;
	}

	public boolean update(AddressDto dto) {
		boolean flag = false;
		int cnt = sqlSession.update("address.update", dto);
		if (cnt > 0)
			flag = true;
		return flag;
	}

	public boolean delete(int no) {
		boolean flag = false;
		int cnt = sqlSession.delete("address.delete", no);
		if (cnt > 0)
			flag = true;
		return flag;
	}
}
