package com.douzone.blah.controller;

import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.douzone.blah.dao.RecruitDAO;
import com.douzone.blah.model.RecruitDTO;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class RecruitController {

	@Resource
	private RecruitDAO recruitDAO;

	// 검색 전 매핑
	@GetMapping("/recruitMain")
	public String RecruitPage() {
		return "/recruit/recruit";
	}

	// 검색 처리
	@GetMapping("/recruitSelect")
	public String searchRecruit(@RequestParam("corp_name") String corp_name, HttpServletRequest request,
			HttpServletResponse response) throws ParseException {
		List<Map<String, Object>> recruitInfo = recruitDAO.selectRecruit(corp_name);

		request.setAttribute("list", recruitInfo);

		return "/recruit/recruit";
	}

	// 공고 조회
	@RequestMapping(value = "admin/recruit", method = RequestMethod.GET)
	public String Recruit(HttpServletRequest request) {
		HashMap map = new HashMap();
		List<RecruitDTO> list = recruitDAO.getRecruitList(map);
		System.out.println(list);
		request.setAttribute("recruitlist", list);
		return "admin/Recruit";
	}

	// 공고 작성
	@RequestMapping(value = "admin/RecruitWriteform", method = RequestMethod.GET)
	public void Recruit() {
	}
}
