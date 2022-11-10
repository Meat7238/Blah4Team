package com.douzone.blah.controller;

import java.security.Principal;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.douzone.blah.dao.RecruitDAO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MemberController {
	@Resource
	private RecruitDAO recruitDAO;

	// 검색 전 매핑
	@GetMapping("/member")
	public String RecruitPage(Principal principal, HttpServletRequest request) {
		log.warn(principal.getName());
		request.setAttribute("username", principal.getName());
		return "/member/member";
	}
	
}
