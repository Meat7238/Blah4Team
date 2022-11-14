package com.douzone.blah.service;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.douzone.blah.dao.User2DAO;
import com.douzone.blah.model.User2DTO;
import com.douzone.blah.service.mail.MailHandler;
import com.douzone.blah.service.mail.TempKey;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class UserService {

	@Autowired
	User2DAO user2dao;
	
	// 정규 표현식 검사 로직
	public String patternCheck(User2DTO user2dto) {

		if (!emailPatternCheck(user2dto))	// 이메일 정규표현식 불일치
			return "emailError";
		else if (!idPatternCheck(user2dto))	// 아이디 정규표현식 불일치
			return "IdError";
		else if (!passwordPatternCheck(user2dto))
			return "passwordError";			// 비밀번호 정규표현식 불일치
		return "cleared";
	}
	
	// 정규 표현식 검사 로직- 세부 함수 :이메일 정규표현식 검사
	public boolean emailPatternCheck(User2DTO user2dto) {
		Pattern emailPattern = Pattern.compile(
				"^([A-Z|a-z|0-9](\\.|_){0,1})+[A-Z|a-z|0-9]\\@([A-Z|a-z|0-9])+((\\.){0,1}[A-Z|a-z|0-9]){2}\\.[a-z]{2,3}$");
		return emailPattern.matcher(user2dto.getUser_email()).matches();
	}

	// 정규 표현식 검사 로직- 세부 함수 : 아이디 정규표현식 검사
	public boolean idPatternCheck(User2DTO user2dto) {

		Pattern idPattern = Pattern.compile(
				"^[a-z0-9]{5,12}$");
		return idPattern.matcher(user2dto.getUser_id()).matches();
	}

	// 정규 표현식 검사 로직- 세부 함수 : 비밀번호 정규표현식 검사
	public boolean passwordPatternCheck(User2DTO user2dto) {
		Pattern passwordPattern = Pattern.compile(
				"^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,20}$");
		return passwordPattern.matcher(user2dto.getUser_password()).matches();
	}

	// 중복 확인 로직
	public String dupleCheck(User2DTO user2dto) {
		if (!idDupleCheck(user2dto))
			return "idDuple";
		else if (!emailDupleCheck(user2dto)) {
			System.out.println(emailDupleCheck(user2dto));
			return "emailDuple";
		}

		return "cleared";
	} 

	// 중복 확인 로직 - 세부 함수 : 아이디 중복 확인 method
	public boolean idDupleCheck(User2DTO user2dto) {
		int result = user2dao.idDupleCheck(user2dto.getUser_id());
		boolean check = (result == 1)?false:true;	//중복이면 false
		return check;
	}
	
	// 중복 확인 로직 - 세부 함수 : 이메일 중복 확인 method
	public boolean emailDupleCheck(User2DTO user2dto) {
		int result = user2dao.emailDupleCheck(user2dto.getUser_email());
		boolean check = (result == 1)?false:true;	//중복이면 false
		return check;
	}
	
	
}
