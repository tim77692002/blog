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

public class MemoDaoTest {

	private static BeanFactory beans;
	private static MemoDao mdao;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		Resource resource = new ClassPathResource("blog.xml");
		beans = new XmlBeanFactory(resource);
		System.out.println("@BeforeClass : setUpBeforeClass()");
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		System.out.println("@AfterClass : tearDownAfterClass()");
	}

	@Before
	public void setUp() throws Exception {
		System.out.println("@Before : setUp()");
		mdao = (MemoDao) beans.getBean("mdao");
	}

	@After
	public void tearDown() throws Exception {
		System.out.println("@After : tearDown()");
	}

	@Test
	@Ignore
	public void testTotal() {
		System.out.println("@Test @Ignore : testTotal()");
		// assertEquals(mdao.total("", ""), 16);
		assertEquals(mdao.total("title", "152"), 1);
	}

	@Test
	@Ignore
	public void testUpViewcnt() {
		// 리턴형이 없어서 테스트하기 힘듬. read에서 같이 테스트 해야한다.
	}

	@Test
	@Ignore
	public void testDelete() {
		System.out.println("@Test @Ignore : testDelete()");
		int memono = 1602;
		assertTrue(mdao.delete(memono));
	}

	@Test
	@Ignore
	public void testUpdate() {
		System.out.println("@Test @Ignore : testUpdate()");
		MemoDto dto = new MemoDto();
		dto.setMemono(1602);
		dto.setTitle("수정된 제목");
		dto.setContent("수 정 된 내 용");
		assertTrue(mdao.update(dto));
	}

	@Test
	@Ignore
	public void testRead() {
		System.out.println("@Test @Ignore : testRead()");
		mdao.upViewcnt(1602);
		MemoDto dto = mdao.read(1602);
		assertNotNull(dto);
	}

	@Test
	@Ignore
	public void testCreate() {
		System.out.println("@Test @Ignore : testCreate()");
		MemoDto dto = new MemoDto();
		dto.setTitle("20170215");
		dto.setContent("1446");
		assertTrue(mdao.create(dto));
	}

	@Test
	@Ignore
	public void testList() {
		System.out.println("@Test @Ignore : testList()");
		Map map = new HashMap();
		map.put("col", "title");
		map.put("word", "");
		map.put("sno", 1);
		map.put("eno", 5);
		List<MemoDto> list = mdao.list(map);
		assertEquals(list.size(), 5);
	}
}