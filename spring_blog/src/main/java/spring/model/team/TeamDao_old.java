package spring.model.team;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import spring.utility.blog.DBClose;
import spring.utility.blog.DBOpen;

@Repository
public class TeamDao_old {

	public boolean updateFile(Map map) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		String filename = (String) map.get("filename");
		int no = (Integer) map.get("no");
		StringBuffer sql = new StringBuffer();
		sql.append(" update team set filename = ? where no = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());

			pstmt.setString(1, filename);
			pstmt.setInt(2, no);

			int cnt = pstmt.executeUpdate();

			if (cnt > 0)
				flag = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}
		return flag;
	}

	public int total(String col, String word) {
		int total = 0;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();

		sql.append(" select count(*) from team ");

		if (word.trim().length() > 0)
			sql.append(" where " + col + " like '%'||?||'%' ");

		try {
			pstmt = con.prepareStatement(sql.toString());

			if (word.trim().length() > 0)
				pstmt.setString(1, word);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				total = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}

		return total;
	}

	public List<TeamDto> list(Map map) {
		List<TeamDto> list = new ArrayList<TeamDto>();
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String col = (String) map.get("col");
		String word = (String) map.get("word");
		int sno = (Integer) map.get("sno");
		int eno = (Integer) map.get("eno");

		StringBuffer sql = new StringBuffer();

		sql.append(" select no, name, phone, skill, filename, r ");
		sql.append(" from( ");
		sql.append(" 	select no, name, phone, skill, filename, rownum r ");
		sql.append(" 	from( ");
		sql.append(" 		select no, name, phone, skill, filename from team ");

		if (word.trim().length() > 0)
			sql.append(" 	where " + col + " like '%'||?||'%' ");

		sql.append(" 		order by no desc ");
		sql.append(" 	) ");
		sql.append(" )where r>=? and r<=? ");

		try {
			pstmt = con.prepareStatement(sql.toString());

			int i = 1; // i가 0 부터면 밑에서 ++i, i가 1부터면 i++

			if (word.trim().length() > 0)
				pstmt.setString(i++, word);

			pstmt.setInt(i++, sno);
			pstmt.setInt(i++, eno);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				TeamDto dto = new TeamDto();
				dto.setNo(rs.getInt("no"));
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone"));
				dto.setSkillstr(rs.getString("skill"));
				dto.setFilename(rs.getString("filename"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}

		return list;
	}

	public boolean delete(int no) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();

		sql.append(" delete from team where no = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);

			int cnt = pstmt.executeUpdate();
			if (cnt > 0)
				flag = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}

		return flag;
	}

	public boolean update(TeamDto dto) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" update team set phone = ?, zipcode = ?, address1 = ?, address2 = ?, skill = ?, hobby = ? ");

		if (dto.getFilename().trim().length() > 0)
			sql.append(", filename = ? ");

		sql.append(" where no = ? ");

		try {
			int i = 0; // 1로 지정하면 밑에 ++i 가 아니라 i++을 써야 한다.
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(++i, dto.getPhone());
			pstmt.setString(++i, dto.getZipcode());
			pstmt.setString(++i, dto.getAddress1());
			pstmt.setString(++i, dto.getAddress2());
			pstmt.setString(++i, dto.getSkillstr());
			pstmt.setString(++i, dto.getHobby());

			if (dto.getFilename().trim().length() > 0)
				pstmt.setString(++i, dto.getFilename());

			pstmt.setInt(++i, dto.getNo());

			int cnt = pstmt.executeUpdate();

			if (cnt > 0)
				flag = true;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}

		return flag;
	}

	public TeamDto read(int no) {
		TeamDto dto = null;

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();

		sql.append(" select * from team where no = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto = new TeamDto();
				dto.setNo(rs.getInt("no"));
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone"));
				dto.setZipcode(rs.getString("zipcode"));
				dto.setAddress1(rs.getString("address1"));
				dto.setAddress2(rs.getString("address2"));
				dto.setSkillstr(rs.getString("skill"));
				dto.setHobby(rs.getString("hobby"));
				dto.setGender(rs.getString("gender"));
				dto.setFilename(rs.getString("filename"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}

		return dto;
	}

	public boolean create(TeamDto dto) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(
				" insert into TEAM (no,name,gender,phone,zipcode,address1,address2,skill,hobby,filename) values ((select nvl(max(no),0)+1 from TEAM),?,?,?,?,?,?,?,?,?) ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getGender());
			pstmt.setString(3, dto.getPhone());
			pstmt.setString(4, dto.getZipcode());
			pstmt.setString(5, dto.getAddress1());
			pstmt.setString(6, dto.getAddress2());
			pstmt.setString(7, dto.getSkillstr());
			pstmt.setString(8, dto.getHobby());
			pstmt.setString(9, dto.getFilename());

			int cnt = pstmt.executeUpdate();

			if (cnt > 0) {
				flag = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}
		return flag;
	}
}
