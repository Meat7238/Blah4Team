package com.douzone.blah.service;

import java.util.regex.Matcher;
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

		if (!emailPatternCheck(user2dto))
			return "emailError";
		else if (!idPatternCheck(user2dto))
			return "IdError";
		else if (!passwordPatternCheck(user2dto))
			return "passwordError";

		return "cleared";
	}

	public boolean emailPatternCheck(User2DTO user2dto) {
		// 이메일 정규표현식
		Pattern emailPattern = Pattern.compile(
				"^([A-Z|a-z|0-9](\\.|_){0,1})+[A-Z|a-z|0-9]\\@([A-Z|a-z|0-9])+((\\.){0,1}[A-Z|a-z|0-9]){2}\\.[a-z]{2,3}$");

		log.warn("패턴 : " + emailPattern);
		log.warn("true/false : " + emailPattern.matcher(user2dto.getUser_email()).matches());
		return emailPattern.matcher(user2dto.getUser_email()).matches();
	}

	public boolean idPatternCheck(User2DTO user2dto) {
		// 아이디 정규표현식
		Pattern idPattern = Pattern.compile(
				"^[a-z0-9]{5,12}$");

		log.warn("패턴 : " + idPattern);
		log.warn("true/false : " + idPattern.matcher(user2dto.getUser_id()).matches());
		return idPattern.matcher(user2dto.getUser_id()).matches();
	}

	public boolean passwordPatternCheck(User2DTO user2dto) {
		// 패스웨드 정규표현식
		Pattern passwordPattern = Pattern.compile(
				"^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,20}$");

		log.warn("패턴 : " + passwordPattern);
		log.warn("true/false : " + passwordPattern.matcher(user2dto.getUser_password()).matches());
		return passwordPattern.matcher(user2dto.getUser_password()).matches();
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
