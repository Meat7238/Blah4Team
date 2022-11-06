//package com.douzone.blah.security;
//
//import java.util.ArrayList;
//import java.util.List;
//import java.util.Map;
//
//import org.apache.ibatis.session.SqlSession;
//import org.mybatis.spring.SqlSessionTemplate;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.core.GrantedAuthority;
//import org.springframework.security.core.authority.SimpleGrantedAuthority;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.core.userdetails.UsernameNotFoundException;
//
//import com.douzone.blah.model.User2DTO;
//
////로그인 처리 클래스
//public class UserAuthenticationService implements UserDetailsService {
//
//	@Autowired
//	private SqlSession sqlSession;
//
//	public UserAuthenticationService() {
//	}
//
//	public UserAuthenticationService(SqlSessionTemplate sqlSession) {
//		this.sqlSession = sqlSession;
//	}
//
//	@Override
//	public UserDetails loadUserByUsername(String user_id) throws UsernameNotFoundException {
//		// 사용자 아이디 확인
//		Map<String, Object> user = sqlSession.selectOne("selectUser", user_id);
//		// 아이디가 없으면 예외 발생
//		if (user == null)
//			throw new UsernameNotFoundException(user_id);
//
//		// 사용권한 목록
//		List<GrantedAuthority> authority = new ArrayList<>();
//		authority.add(new SimpleGrantedAuthority(user.get("AUTHORITY").toString())); // 필드명은 대문자로
//		return new User2DTO(user.get("USERNAME").toString(), user.get("PASSWORD").toString(),
//				(Integer) Integer.valueOf(user.get("ENABLED").toString()) == 1, true, true, true, authority,
//				user.get("USERNAME").toString());
//	}
//
//}
