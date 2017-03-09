package spring.sts.blog;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.address.AddressDao;
import spring.model.address.AddressDto;
import spring.utility.blog.Utility;

@Controller
public class AddressController {

	@Autowired
	private AddressDao dao;

	@RequestMapping(value = "/address/update", method = RequestMethod.GET)
	public String update(int no, Model model) {
		model.addAttribute("dto", dao.read(no));
		return "/address/update";
	}

	@RequestMapping(value = "/address/update", method = RequestMethod.POST)
	public String update(AddressDto dto, String nowPage, String col, String word, Model model) {
		boolean flag = dao.update(dto);
		if (flag) {
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("col", col);
			model.addAttribute("word", word);
			return "redirect:./list";
		} else {
			return "error";
		}
	}

	@RequestMapping("/address/delete")
	public String delete(int no, Model model, String nowPage, String col, String word) {
		boolean flag = (dao.delete(no));
		if (flag) {
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("col", col);
			model.addAttribute("word", word);
			return "redirect:./list";
		} else {
			return "error";
		}
	}

	@RequestMapping(value = "/address/create", method = RequestMethod.POST)
	public String create(AddressDto dto) {
		boolean flag = dao.create(dto);
		if (flag) {
			return "redirect:./list";
		} else {
			return "error";
		}
	}

	@RequestMapping(value = "/address/create", method = RequestMethod.GET)
	public String create() {
		return "/address/create";
	}

	@RequestMapping("/address/read")
	public String read(int no, Model model) {
		AddressDto dto = dao.read(no);
		model.addAttribute("dto", dto);
		return "/address/read";
	}

	@RequestMapping("/address/list")
	public String list(HttpServletRequest request) {
		// --검색관련
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));

		if (col.equals("total")) // 전체 선택시
			word = "";

		// 페이징 관련
		int nowPage = 1; // 현재 페이지, 변경 가능
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		int recordPerPage = 10; // 한 페이지당 보여줄 레코드의 갯수

		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;

		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);

		List<AddressDto> list = dao.list(map);
		Iterator<AddressDto> iter = list.iterator();

		int total = dao.total(col, word);

		String paging = Utility.paging3(total, nowPage, recordPerPage, col, word);

		request.setAttribute("list", list);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("paging", paging);

		return "/address/list";
	}
}
