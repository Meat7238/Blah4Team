package com.douzone.blah.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AccountExpiredException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.douzone.blah.security.domain.UserDetailsVO;

public class UserAuthProvider extends DaoAuthenticationProvider {
	@Autowired
	// DB의 값을 가져다주는 커스터마이징 클래스
	UserDetailsServiceCustom userDetailsServcie;

	// 패스워드 암호화 객체
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	

	public UserAuthProvider(UserDetailsServiceCustom userDetailsServcie, BCryptPasswordEncoder passwordEncoder) {
		super();
		this.userDetailsServcie = userDetailsServcie;
		this.passwordEncoder = passwordEncoder;
	}

	@Override
	// 인증 로직
	public Authentication authenticate(Authentication authentication)
			throws AuthenticationException {

		/* 사용자가 입력한 정보 */
		String user_id = authentication.getName();
		String user_password = (String) authentication.getCredentials();

		/* DB에서 가져온 정보 (커스터마이징 가능) */
		UserDetailsVO userDetails = (UserDetailsVO) userDetailsServcie
				.loadUserByUsername(user_id);

		
		
		/* 인증 진행 */
		
		// DB에 정보가 없는 경우 예외 발생 (아이디/패스워드 잘못됐을 때와 동일한 것이 좋음)
		// ID 및 PW 체크해서 안맞을 경우 (matches를 이용한 암호화 체크를 해야함)
		if (userDetails == null || !user_id.equals(userDetails.getUsername())
				|| !passwordEncoder.matches(user_password, userDetails.getPassword())) {

			throw new BadCredentialsException(user_id);

		// 계정 정보 맞으면 나머지 부가 메소드 체크 (이부분도 필요한 부분만 커스터마이징 하면 됨)
		// 잠긴 계정일 경우
		} else if (!userDetails.isAccountNonLocked()) {
			throw new LockedException(user_id);

		// 비활성화된 계정일 경우
		} else if (!userDetails.isEnabled()) {
			throw new DisabledException(user_id);

		// 만료된 계정일 경우
		} else if (!userDetails.isAccountNonExpired()) {
			throw new AccountExpiredException(user_id);

		// 비밀번호가 만료된 경우
		} else if (!userDetails.isCredentialsNonExpired()) {
			throw new CredentialsExpiredException(user_id);
		}

		// 다 썼으면 패스워드 정보는 지워줌 (객체를 계속 사용해야 하므로)
		userDetails.setUser_workspace(null);

		/* 최종 리턴 시킬 새로만든 Authentication 객체 */
		Authentication newAuth = new UsernamePasswordAuthenticationToken(
				userDetails, null, userDetails.getAuthorities());

		return newAuth;
	}

	@Override
	// 위의 authenticate 메소드에서 반환한 객체가 유효한 타입이 맞는지 검사
	// null 값이거나 잘못된 타입을 반환했을 경우 인증 실패로 간주
	public boolean supports(Class<?> authentication) {

		// 스프링 Security가 요구하는 UsernamePasswordAuthenticationToken 타입이 맞는지 확인
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}
}