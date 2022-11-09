//package com.douzone.blah.security;
//
//import org.springframework.security.core.Authentication;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.web.authentication.WebAuthenticationDetails;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//@Controller
//public class loginController {
//	
//	@RequestMapping("/login")
//	public String login(Authentication authentication) {
//		System.out.println("로그인 컨트롤러**");
//
//		if (authentication != null) {
//			System.out.println("타입정보 : " + authentication.getClass());
//			
//			// 세션 정보 객체 반환
//			WebAuthenticationDetails web = (WebAuthenticationDetails)authentication.getDetails();
//			System.out.println("세션ID : " + web.getSessionId());
//			System.out.println("접속IP : " + web.getRemoteAddress());
//
//			// UsernamePasswordAuthenticationToken에 넣었던 UserDetails 객체 반환
//			UserDetails userVO = (UserDetails) authentication.getPrincipal();
//			System.out.println("ID정보 : " + userVO.getUsername());
//		}
//		
//		return "/";
//	}
//
//}
