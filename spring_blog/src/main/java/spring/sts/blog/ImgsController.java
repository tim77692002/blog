package spring.sts.blog;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.img.ImgDao;
import spring.model.img.ImgDto;
import spring.utility.blog.Utility;

@Controller
public class ImgsController {

	@Autowired
	private ImgDao dao;

	@RequestMapping(value = "/img/reply", method = RequestMethod.POST)
	public String reply(String nowPage, String col, String word, ImgDto dto, Model model, HttpServletRequest request) {

		String basePath = request.getRealPath("/img/storage");
		int filesize = (int) dto.getFnameMF().getSize();
		String fname = "";
		if (filesize > 0) {
			fname = Utility.saveFile(dto.getFnameMF(), basePath);
		}
		dto.setFname(fname);

		Map map = new HashMap();
		map.put("grpno", dto.getGrpno());
		map.put("ansnum", dto.getAnsnum());
		dao.upAnsnum(map);

		boolean flag = dao.createReply(dto);

		if (flag) {
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("word", word);
			model.addAttribute("col", col);
			return "redirect:./list";
		} else {
			return "error";
		}
	}

	@RequestMapping(value = "/img/reply", method = RequestMethod.GET)
	public String reply(int no, Model model) {
		model.addAttribute("dto", dao.readReply(no));
		return "/img/reply";
	}

	@RequestMapping(value = "/img/delete", method = RequestMethod.POST)
	public String delete(HttpServletRequest request, int no, Model model, String passwd, String oldfile, String col,
			String word, String nowPage) {

		String basePath = request.getRealPath("/img/storage");

		Map map = new HashMap();
		map.put("no", no);
		map.put("passwd", passwd);

		boolean pflag = dao.passCheck(map);

		if (pflag) {
			if (dao.delete(no)) {
				Utility.deleteFile(basePath, oldfile);
			}
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("col", col);
			model.addAttribute("word", word);
			return "redirect:./list";
		} else {
			return "passwdError";
		}
	}

	@RequestMapping(value = "/img/delete", method = RequestMethod.GET)
	public String delete(int no, Model model) {
		model.addAttribute("flag", dao.checkRefno(no));
		return "/img/delete";
	}

	@RequestMapping(value = "/img/update", method = RequestMethod.POST)
	public String update(ImgDto dto, HttpServletRequest request, Model model, String col, String word, String nowPage,
			String oldfile) {
		String basePath = request.getRealPath("/img/storage");

		Map map = new HashMap();
		map.put("no", dto.getNo());
		map.put("passwd", dto.getPasswd());
		boolean pflag = dao.passCheck(map);

		if (pflag) {
			int filesize = (int) dto.getFnameMF().getSize();
			String fname = "";
			if (filesize > 0) {
				Utility.deleteFile(basePath, oldfile);
				fname = Utility.saveFile(dto.getFnameMF(), basePath);
			}
			dto.setFname(fname);
			boolean flag = dao.update(dto);
			if (flag) {
				model.addAttribute("col", col);
				model.addAttribute("word", word);
				model.addAttribute("nowPage", nowPage);
				return "redirect:./list";
			} else {
				return "/img/update";
			}
		} else {
			return "passwdError";
		}
	}

	@RequestMapping(value = "/img/update", method = RequestMethod.GET)
	public String update(int no, Model model) {
		model.addAttribute("dto", dao.read(no));
		return "img/updateForm";
	}

	@RequestMapping(value = "/img/create", method = RequestMethod.POST)
	public String create(ImgDto dto, HttpServletRequest request) {
		String basePath = request.getRealPath("/img/storage");
		int filesize = (int) dto.getFnameMF().getSize();
		String fname = "";
		if (filesize > 0) {
			fname = Utility.saveFile(dto.getFnameMF(), basePath);
		}
		dto.setFname(fname);
		if (dao.create(dto)) {
			return "redirect:./list";
		} else {
			return "error";
		}
	}

	@RequestMapping(value = "/img/create", method = RequestMethod.GET)
	public String create() {
		return "/img/create";
	}

	@RequestMapping("/img/read")
	public String read(Model model, int no, String col, String word, String nowPage, HttpServletRequest request) {

		ImgDto dto = dao.read(no);

		Map map = dao.imgRead(no);
		BigDecimal[] noArr = { ((BigDecimal) map.get("PRE_NO2")), ((BigDecimal) map.get("PRE_NO1")),
				((BigDecimal) map.get("NO")), ((BigDecimal) map.get("NEX_NO1")), ((BigDecimal) map.get("NEX_NO2")) };

		String[] files = { ((String) map.get("PRE_FILE2")), ((String) map.get("PRE_FILE1")),
				((String) map.get("FNAME")), ((String) map.get("NEX_FILE1")), ((String) map.get("NEX_FILE2"))

		};

		String content = dto.getContent().replaceAll("\r\n", "<br>");
		dto.setContent(content);

		model.addAttribute("col", col);
		model.addAttribute("word", word);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("dto", dto);
		model.addAttribute("no", no);
		model.addAttribute("files", files);
		model.addAttribute("noArr", noArr);

		return "/img/read";
	}

	@RequestMapping("/img/list")
	public String list(HttpServletRequest request) {
		// 검색============================================
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));

		if (col.equals("total")) {
			word = "";
		}
		// paging 관련=======================================
		int nowPage = 1;// 현재 보고 있는 페이지
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		int recordPerPage = 5;// 한 페이지 보여줄 갯수

		// DB에서 가져올 순번=====================================
		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;

		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);

		int total = dao.total(col, word);
		List<ImgDto> list = dao.list(map);
		String paging = Utility.paging3(total, nowPage, recordPerPage, col, word);
		// Iterator<ImgDto> iter = list.iterator();

		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("paging", paging);
		request.setAttribute("list", list);

		return "/img/list";
	}

}
