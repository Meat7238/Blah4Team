package com.douzone.blah.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.douzone.blah.dao.CorpDAO;
import com.douzone.blah.dao.CorpDAOImpl;
import com.douzone.blah.model.CorpDTO;
import com.douzone.blah.model.CorpreviewDTO;

@Controller
public class CorpController {

	@Resource
	private CorpDAO corpDAOImpl;

//	@RequestMapping("/corplist")
//	public String list(HttpServletRequest request) {
//		HashMap map = new HashMap();
//		List<CorpDTO> corplist = corpDAOImpl.getCorpList(map);
//		request.setAttribute("corplist", corplist);
//		return "corplist";
//	}

	@RequestMapping(value = "/corpreviewhome", method = RequestMethod.GET)
	public String corpreviewhome(HttpServletRequest request) {
		return "corpreviewhome";
	}

	@RequestMapping(value = "/corpreviewhome", method = RequestMethod.POST)
	public String editList(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String keyvalue = request.getParameter("keyvalue");
		List<CorpDTO> corplist = corpDAOImpl.searchCorp(keyvalue);

		request.setAttribute("corplist", corplist);

		return "corpreviewhome";

	}

	@RequestMapping("/corpreviewintro")
	public String corpreviewintro(String corpnum, Model model) {

		CorpDTO dto = corpDAOImpl.corpDetail(corpnum);

		model.addAttribute("corplist", dto);

		return "corpreviewintro";

	}

	@RequestMapping("/corpreviewmain")
	public String corpreviewmain(String corpreviewnum, Model model) {

		CorpreviewDTO dto = corpDAOImpl.corpReview(corpreviewnum);

		model.addAttribute("corplist", dto);

		return "corpreviewmain";

	}

	@RequestMapping("/corpreviewwriteform")
	public String corpreviewwriteform(HttpServletRequest request) {
		return "corpreviewwriteform";
	}

	@RequestMapping("/corpreview")
	public String corpreview(CorpreviewDTO dto) {
		corpDAOImpl.insertReview(dto);
		return "redirect:/corpreviewmain";
	}

}