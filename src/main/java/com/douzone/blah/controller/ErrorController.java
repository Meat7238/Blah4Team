package com.douzone.blah.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ErrorController {

	// 검색 전 매핑
	@GetMapping("/error")
	public String RecruitPage() {
		return "/error/access-error";
	}
}
