package com.douzone.blah.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.douzone.blah.dao.RecruitDAO;

@Controller
public class MemberController {
	@Resource
	private RecruitDAO recruitDAO;

	// 검색 전 매핑
	@GetMapping("/member")
	public String RecruitPage() {
		return "/member/member";
	}

}
