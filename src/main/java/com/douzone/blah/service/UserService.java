package com.douzone.blah.service;

import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.douzone.blah.dao.User2DAO;
import com.douzone.blah.model.User2DTO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class UserService {
	
	@Autowired
	User2DAO user2dao;
	
	// 에러 유무 및 유형 리턴
	public String patternCheck(User2DTO user2dto) {

		if(!emailPatternCheck(user2dto)) return "emailError";
		else if(!idPatternCheck(user2dto)) return "IdError";
		else if(!passwordPatternCheck(user2dto)) return "passwordError";
		
		return "cleared";
	}
	
	public boolean emailPatternCheck(User2DTO user2dto) {
		// 이메일 정규표현식
		String emailPattern = "/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i";
		log.warn(user2dto);
		log.warn(Pattern.matches(emailPattern, user2dto.getUser_email()));
		return Pattern.matches(emailPattern, user2dto.getUser_email());
	}

	public boolean idPatternCheck(User2DTO user2dto) {
		// 아이디 정규표현식
		String idPattern = "/^[a-z]+[a-z0-9]{5,19}$/g";
		log.warn(user2dto);
		log.warn(Pattern.matches(idPattern, user2dto.getUser_id()));
		return Pattern.matches(idPattern, user2dto.getUser_id());
	}

	public boolean passwordPatternCheck(User2DTO user2dto) {
		// 패스웨드 정규표현식
		String passwordPattern = "/^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\\\(\\\\)\\-_=+]).{8,16}$/";
		log.warn(user2dto);
		log.warn(Pattern.matches(passwordPattern, user2dto.getUser_password()));
		return Pattern.matches(passwordPattern, user2dto.getUser_password());
	}
	
	// 중복 확인 로직
	
//	// 아이디 중복 확인 로직
//	public boolean idDupleCheck(User2DTO user2dto) {
//		int result = user2dao.idDupleCheck(user2dto.getUser_id());
//		return 
//	}
//	
//	
//	// 이메일 중복 확인 로직
//	public boolean emailDupleCheck(User2DTO user2dto) {
//		int result = user2dao.idDupleCheck(user2dto.getUser_email());
//	}
}
