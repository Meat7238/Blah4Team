package com.douzone.blah.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.douzone.blah.dao.CorpDAO;
import com.douzone.blah.dao.User2DAO;
import com.douzone.blah.model.CorpDTO;
import com.douzone.blah.model.CorpreviewDTO;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class CorpController {

	@Resource
	private CorpDAO corpDAOImpl;

	@Resource
	private User2DAO user2DAOImpl;

//	@RequestMapping("/corplist")
//	public String list(HttpServletRequest request) {
//		HashMap map = new HashMap();
//		List<CorpDTO> corplist = corpDAOImpl.getCorpList(map);
//		request.setAttribute("corplist", corplist);
//		return "corplist";
//	}

	@RequestMapping(value = "/corpreviewhome", method = RequestMethod.GET)
	public String corpreviewhome(HttpServletRequest request) {
		return "/corp/corpreviewhome";
	}

	@RequestMapping(value = "/corpreviewhome", method = RequestMethod.POST)
	public String editList(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String keyvalue = request.getParameter("keyvalue");
		List<CorpDTO> corplist = corpDAOImpl.searchCorp(keyvalue);

		request.setAttribute("corplist", corplist);

		return "/corp/corpreviewhome";

	}

	@RequestMapping("/corpreviewintro")
	public String corpreviewintro(String corpnum, Model model) {

		CorpDTO dto = corpDAOImpl.corpDetail(corpnum);

		model.addAttribute("corplist", dto);

		return "/corp/corpreviewintro";

	}

//	@RequestMapping("/corpreviewmain")
//	public String corpreviewmain(String corpreviewnum, Model model) {
//
//		model.addAttribute("corplist", corpDAOImpl.corpReview(corpreviewnum));
//
//		return "corpreviewmain";
//
//	}

	@RequestMapping("/corpreviewmain")
	public String corpreviewmain(String corpreviewnum, HttpServletRequest request) {
		List<Map<String, Object>> corpReiviewList = corpDAOImpl.corpReview(corpreviewnum);
		log.warn("받아온 값 : " + corpReiviewList);
		request.setAttribute("corplist", corpReiviewList);
//		model.addAttribute("corplist", corpDAOImpl.corpReview(corpreviewnum));
		return "/corp/corpreviewmain";

	}

	@RequestMapping(value = "/corpreviewwriteform", method = RequestMethod.GET)
	public String corpreviewwriteform(HttpServletRequest request) {
		String corpNum = request.getParameter("corp");
//		Map<String, String> map = new HashMap<>();
//		map.put("corpNum", corpNum);
//		System.out.println("dao진입전 map : " + map.get("corpNum"));
//		String corpName = corpDAOImpl.readcorp(map);
//		System.out.println(corpName);
//		request.setAttribute("corpName", corpName);
		request.setAttribute("corpreview_corpnum", corpNum);

		System.out.println(corpNum);

		return "/corp/corpreviewwriteform";
	}

	@RequestMapping(value = "/corpreview", method = RequestMethod.POST)
	public String corpreview(CorpreviewDTO dto, HttpServletRequest request) {

		System.out.println("여기오니 ===========> ");
		System.out.println("dto 정보"+dto);
//		request.setAttribute("corpreviewnum", dto.getCorpreview_corpnum());
//		System.out.println("리뷰번호!===>" + request.getAttribute("corpreviewnum"));
		
		corpDAOImpl.insertReview(dto);

		System.out.println("들어갔니? ===========> ");
		
		
		return "/corp/corpreviewwriteform";
//		return "redirect:/corpreviewmain";
	}

}