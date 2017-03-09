package spring.model.bbs;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

public class ReplyDaoTest {

	private static BeanFactory beans;
	public static ReplyDao dao;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		Resource resource = new ClassPathResource("blog.xml");
		beans = new XmlBeanFactory(resource);
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
		dao = (ReplyDao) beans.getBean("rdao");
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	@Ignore
	public void testRcount() {
		fail("Not yet implemented");
	}

	@Test
	@Ignore
	public void testSetSqlSessionTemplate() {
		fail("Not yet implemented");
	}

	@Test
	@Ignore
	public void testCreate() {
		ReplyDto dto = new ReplyDto();
		dto.setBbsno(113);
		dto.setContent("육육");
		dto.setId("pancake");
		assertTrue(dao.create(dto));
	}

	@Test
	@Ignore
	public void testRead() {
		ReplyDto dto = dao.read(18);
		assertNotNull(dto);
		/*
		 * assertEquals(dto.getBbsno(), 105); assertEquals(dto.getId(),
		 * "pancake"); assertEquals(dto.getContent(), "육육");
		 */
	}

	@Test
	@Ignore
	public void testUpdate() {
		ReplyDto dto = new ReplyDto();
		dto.setContent("육육-다미르");
		dto.setRnum(18);
		assertTrue(dao.update(dto));
	}

	@Test
	@Ignore
	public void testList() {
		Map map = new HashMap();
		map.put("bbsno", 105);
		map.put("sno", 1);
		map.put("eno", 5);
		List<ReplyDto> list = dao.list(map);
		assertEquals(list.size(), 4);
	}

	@Test
	@Ignore
	public void testTotal() { // rcount와 같음
		int bbsno = 105; // 글번호
		int cnt = dao.total(bbsno);
		assertEquals(cnt, 4); // 뒤에 4가 적힌 자리는 bbsno에 해당하는 댓글의 갯수
	}

	@Test
	@Ignore
	public void testDelete() {
		assertTrue(dao.delete(17)); // 삭제할 댓글의 번호(rnum)
	}

	@Test
	
	public void testBdelete() throws Exception {
		int bbsno = 113;
		assertEquals(dao.bdelete(bbsno), 2); // 삭제될 댓글의 갯수
	}

}
