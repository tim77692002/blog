package spring.model.bbs;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

public class ReplyTest {

	public static void main(String[] args) {
		Resource resource = new ClassPathResource("blog.xml");

		BeanFactory beans = new XmlBeanFactory(resource);

		ReplyDao dao = (ReplyDao) beans.getBean("rdao");

		// create(dao);
		// read(dao);
		// update(dao);
		 list(dao);
		// delete(dao);
		// total(dao);

	}

	private static void total(ReplyDao dao) {
		int bbsno = 105;
		int total = dao.total(bbsno);
		p("total:" + total);

	}

	private static void delete(ReplyDao dao) {

		if (dao.delete(2)) {
			p("성공");
		} else {
			p("실패");
		}

	}

	private static void list(ReplyDao dao) {
		int sno = 1;
		int eno = 5;
		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("bbsno", 105);

		List<ReplyDto> list = dao.list(map);

		for (int i = 0; i < list.size(); i++) {
			ReplyDto dto = list.get(i);

			p(dto);
			p("-------------------");
		}

	}

	private static void update(ReplyDao dao) {
		ReplyDto dto = dao.read(1);
		dto.setContent("아 식빵 무지달다. 이거 팬케이크 아니야? ");

		if (dao.update(dto)) {
			p("성공");
			dto = dao.read(1);
			p(dto);
		} else {
			p("실패");
		}

	}

	private static void read(ReplyDao dao) {
		ReplyDto dto = dao.read(1);
		p(dto);

	}

	private static void p(ReplyDto dto) {
		p("번호:" + dto.getRnum());
		p("내용:" + dto.getContent());
		p("아이디:" + dto.getId());
		p("글번호:" + dto.getBbsno());
		p("등록날짜:" + dto.getRegdate());

	}

	private static void create(ReplyDao dao) {

		ReplyDto dto = new ReplyDto();
		dto.setId("pancake");// member table에서 id가져오기
		dto.setContent("우리도 피해잡니다.");
		dto.setBbsno(105);// bbs table에서 존재하는 글번호 가져오기
		if (dao.create(dto)) {
			p("성공!!");
			p("====================================");
			list(dao);
		} else {
			p("실패");
		}

	}

	private static void p(String string) {
		System.out.println(string);

	}

}