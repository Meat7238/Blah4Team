package com.douzone.blah.security;

import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.WebAuthenticationDetails;

import com.douzone.blah.dao.User2DAO;

import lombok.extern.log4j.Log4j;

@Log4j
public class UserLoginSuccessHandler implements AuthenticationSuccessHandler {
	
	@Resource
	private User2DAO user2DAOImpl;

	// 로그인 처리가 성공했을 때의 코드
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth)
			throws IOException, ServletException {
		System.out.println("로그인 석세스 핸들러**");
		// IP, 세션 ID
		WebAuthenticationDetails web = (WebAuthenticationDetails) auth.getDetails();
		System.out.println("IP : " + web.getRemoteAddress());
		System.out.println("Session ID : " + web.getSessionId());

		// 인증 ID
		System.out.println("name : " + auth.getName());

		// 권한 리스트
		List<GrantedAuthority> authList = (List<GrantedAuthority>) auth.getAuthorities();
		System.out.print("권한 : ");
		for (int i = 0; i < authList.size(); i++) {
			System.out.println(authList.get(i).getAuthority() + " , i =  " + i);
		}

		// 접속한 페이지로 돌려보내기 위한 uri
		String prevPage = (String) request.getSession().getAttribute("prevPage");
		System.out.println("prevPage" + prevPage);
		// 세션 Attribute 확인
		Enumeration<String> list = request.getSession().getAttributeNames();
		while (list.hasMoreElements()) {
			System.out.println(list.nextElement());
		}
		
		
		// 로그인 성공시 보낼 uri
		response.sendRedirect(prevPage);
	}

}
