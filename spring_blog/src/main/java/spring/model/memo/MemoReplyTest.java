package spring.model.memo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

public class MemoReplyTest {

	public static void main(String[] args) {
		Resource resource = new ClassPathResource("blog.xml");

		BeanFactory beans = new XmlBeanFactory(resource);

		MemoReplyDao dao = (MemoReplyDao) beans.getBean("mrdao");

		// create(dao);
		// read(dao);
		// update(dao);
		// list(dao);
		total(dao);
		delete(dao);
		total(dao);

	}

	private static void total(MemoReplyDao dao) {
		int memono = 1201;
		int total = dao.total(memono);
		p("total:" + total);

	}

	private static void delete(MemoReplyDao dao) {

		if (dao.delete(3)) {
			p("성공");
		} else {
			p("실패");
		}

	}

	private static void list(MemoReplyDao dao) {
		int sno = 1;
		int eno = 5;
		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("memono", 1201);

		List<MemoReplyDto> list = dao.list(map);

		for (int i = 0; i < list.size(); i++) {
			MemoReplyDto dto = list.get(i);

			p(dto);
			p("-------------------");
		}

	}

	private static void update(MemoReplyDao dao) {
		MemoReplyDto dto = dao.read(2);
		dto.setContent("구단도 피해잡니다!");

		if (dao.update(dto)) {
			p("성공");
			dto = dao.read(2);
			p(dto);
		} else {
			p("실패");
		}

	}

	private static void read(MemoReplyDao dao) {
		MemoReplyDto dto = dao.read(2);
		p(dto);

	}

	private static void p(MemoReplyDto dto) {
		p("번호:" + dto.getRnum());
		p("내용:" + dto.getContent());
		p("아이디:" + dto.getId());
		p("글번호:" + dto.getMemono());
		p("등록날짜:" + dto.getRegdate());

	}

	private static void create(MemoReplyDao dao) {

		MemoReplyDto dto = new MemoReplyDto();
		dto.setId("pancake");// member table에서 id가져오기
		dto.setContent("우리도 피해잡니다.");
		dto.setMemono(1201);// memo table에서 존재하는 글번호 가져오기
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