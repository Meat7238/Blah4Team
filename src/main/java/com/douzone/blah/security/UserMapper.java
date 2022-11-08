package com.douzone.blah.security;

import java.util.Map;

public interface UserMapper {
	
	public int insertUser(Map<String, String> map);
	public Map<String, Object> selectUser(String user_id);
}
