package spring.model.bbs;

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

public class BbsDaoTest {

	private static BeanFactory beans;
	private static BbsDao bdao;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		// 까먹기 쉽다. 꼭 써줘야 한다.
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

		bdao = (BbsDao) beans.getBean("bdao");
	}

	@After
	public void tearDown() throws Exception {
		System.out.println("@After : tearDown()");
	}

	// 빨간색이뜨면 자식글이 존재함 -> 삭제 불가능
	// 녹색이 뜨면 자식글 없음 -> 삭제 가능
	@Test
	@Ignore
	public void testCheckRefno() {
		System.out.println("@Test : testCheckRefno()");
		int bbsno = 116;
		assertTrue(bdao.checkRefno(bbsno));
	}

	@Test
	//@Ignore
	public void testTotal() {
		System.out.println("@Test : testTotal()");
		//assertEquals(bdao.total("", ""), 63); // 총 갯수
		assertEquals(bdao.total("wname", "박제"), 1); // 조건에 맞는것 갯수
		
	}

	@Test
	@Ignore
	public void testCreateReply() {
		System.out.println("@Test : testCreateReply()");
		BbsDto dto = bdao.readReply(144);
		dto.setTitle("수정 삭제 금지!!!!");
		dto.setContent("하지 말라고@@@@");
		dto.setPasswd("1234");
		dto.setFilename("No.txt");
		dto.setWname("NoMan");
		Map map = new HashMap();
		map.put("grpno", dto.getGrpno());
		map.put("ansnum", dto.getAnsnum());
		bdao.upAnsnum(map);
		assertTrue(bdao.createReply(dto));
	}

	@Test
	@Ignore
	public void testUpAnsnum() {
		// 리턴형이 없어서 테스트하기 힘듬. create에서 같이 테스트 해야한다.
	}

	@Test
	@Ignore
	public void testReadReply() {
		System.out.println("@Test : testReadReply()");
		// 번호에 해당하는 내용과 일치해야 녹색
		BbsDto dto = bdao.readReply(144);
		assertEquals(dto.getGrpno(), 89);
		assertEquals(dto.getIndent(), 0);
		assertEquals(dto.getAnsnum(), 0);
		assertEquals(dto.getTitle(), "프로젝트 진행순서");
	}

	@Test
	@Ignore
	public void testDelete() {
		System.out.println("@Test : testDelete()");
		// testCheckRefno에서 삭제가능한지 확인 후, 삭제가능한 글의 번호를 가져온다.
		int bbsno = 113;
		assertTrue(bdao.delete(bbsno));
	}

	@Test
	@Ignore
	public void testUpdate() {
		System.out.println("@Test : testUpdate()");
		BbsDto dto = new BbsDto();
		dto.setBbsno(102);
		dto.setWname("백2원");
		dto.setTitle("제목 백2원");
		dto.setContent("48545464緊");
		dto.setFilename("msms.avi");
		dto.setFilesize(158188);
		assertTrue(bdao.update(dto));
	}

	@Test
	@Ignore
	public void testPassCheck() {
		// 파라미터값 : map , 리턴형 : boolean
		System.out.println("@Test : testPassCheck()");
		Map map = new HashMap();
		map.put("bbsno", 113);
		map.put("passwd", "1234");
		assertTrue(bdao.passCheck(map));
	}

	@Test
	@Ignore
	public void testRead() {
		System.out.println("@Test : testRead()");
		bdao.upViewcnt(52);
		BbsDto dto = bdao.read(52);
		assertNotNull(dto);
	}

	@Test
	@Ignore
	public void testUpViewcnt() {
		// 리턴형이 없어서 테스트하기 힘듬. read에서 같이 테스트 해야한다.
	}

	@Test
	@Ignore
	public void testList() {
		System.out.println("@Test : testList()");
		Map map = new HashMap();
		map.put("col", "wname");
		map.put("word", "");
		map.put("sno", 1);
		map.put("eno", 10);
		List<BbsDto> list = bdao.list(map);
		assertEquals(list.size(), 10); //조건에 맞는 갯수
	}

	@Test
	@Ignore
	public void testCreate() {
		System.out.println("@Test : testCreate()");
		BbsDto dto = new BbsDto();
		dto.setWname("육육이");
		dto.setTitle("2/15");
		dto.setContent("1+2");
		dto.setPasswd("1234");
		dto.setFilename("damir.png");
		dto.setFilesize(1500);
		assertTrue(bdao.create(dto));
	}

}