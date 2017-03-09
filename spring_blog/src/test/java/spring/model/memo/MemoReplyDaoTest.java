package spring.model.memo;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

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

public class MemoReplyDaoTest {

	private static BeanFactory beans;
	public static MemoReplyDao mrdao;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		System.out.println("@BeforeClass : setUpBeforeClass()");
		Resource resource = new ClassPathResource("blog.xml");
		beans = new XmlBeanFactory(resource);
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		System.out.println("@AfterClass : tearDownAfterClass()");
	}

	@Before
	public void setUp() throws Exception {
		System.out.println("@Before : setUp()");
		mrdao = (MemoReplyDao) beans.getBean("mrdao");
	}

	@After
	public void tearDown() throws Exception {
		System.out.println("@After : tearDown()");
	}

	@Test
	@Ignore
	public void testRcount() {
		System.out.println("@Test : testRcount()");
		assertEquals(mrdao.rcount(1102), 1);
	}

	@Test
	@Ignore
	public void testCreate() {
		System.out.println("@Test : testCreate()");
		MemoReplyDto dto = new MemoReplyDto();
		dto.setMemono(1501);
		dto.setContent("가나다라마바사");
		dto.setId("c8c8");
		assertTrue(mrdao.create(dto));
	}

	@Test
	@Ignore
	public void testRead() {
		System.out.println("@Test : testRead()");
		MemoReplyDto dto = mrdao.read(18);
		assertNotNull(dto);
	}

	@Test
	@Ignore
	public void testUpdate() {
		System.out.println("@Test : testUpdate()");
		MemoReplyDto dto = new MemoReplyDto();
		dto.setContent("북패자식");
		dto.setRnum(18);
		assertTrue(mrdao.update(dto));
	}

	@Test
	@Ignore
	public void testList() {
		System.out.println("@Test : testList()");
		Map map = new HashMap();
		map.put("memono", 1501);
		map.put("sno", 1);
		map.put("eno", 5);
		List<MemoReplyDto> list = mrdao.list(map);
		assertEquals(list.size(), 3);
	}

	@Test
	@Ignore
	public void testTotal() {
		System.out.println("@Test : testTotal()");
		int memono = 1501;
		int cnt = mrdao.total(memono);
		assertEquals(cnt, 3);
	}

	@Test
	@Ignore
	public void testDelete() {
		System.out.println("@Test : testDelete()");
		assertTrue(mrdao.delete(14));
	}

	@Test
	@Ignore
	public void testBdelete() throws Exception {
		System.out.println("@Test : testBdelete()");
		int memono = 1501;
		assertEquals(mrdao.bdelete(memono), 4);
	}

}