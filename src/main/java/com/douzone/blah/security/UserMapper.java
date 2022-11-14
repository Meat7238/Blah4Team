package com.douzone.blah.security;

import java.util.Map;

public interface UserMapper {
	
	// 회원가입
	public int insertUser(Map<String, String> map);
	
	// 로그인
	public Map<String, Object> selectUser(String user_id);
}
