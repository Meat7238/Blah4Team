package com.douzone.blah.security;

import java.io.IOException;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

		// 세션
		WebAuthenticationDetails web = (WebAuthenticationDetails) auth.getDetails();
		// 권한 리스트
		List<GrantedAuthority> authList = (List<GrantedAuthority>) auth.getAuthorities();

		// 디폴트 URI
		String uri = "/";

		// login button uri
		String prevPage = (String) request.getSession().getAttribute("prevPage");
		if (prevPage != null) request.getSession().removeAttribute("prevPage");

		// 로그인 실패 후 로그인 성공 시 홈페이지로 돌아가기
		if (prevPage.equals("http://192.168.110.40:8080/blah/loginForm?error"))  uri = "/blah/";
		if (prevPage.equals("http://192.168.110.40:8080/blah/loginForm"))  uri = "/blah/";
//		// intercept uri
//		else if (savedRequest != null) uri = savedRequest.getRedirectUrl();
		// 직접 로그인 페이지로 접속한 것
		else if (prevPage != null && !prevPage.equals("")) uri = prevPage;

		// 로그인 성공시 보낼 uri
		response.sendRedirect(uri);
	}

}
