package com.douzone.blah.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.douzone.blah.model.User2DTO;

public interface User2DAO {
	// 회원에 대한 전체조회,추가,수정,삭제
	public void insertUser2(User2DTO dto); // 추가

	public List<User2DTO> getAllUserList(HashMap map);// 전체조회

	public int updateUser2(User2DTO dto); // 수정

	public int deleteUser2(String user_num); // 삭제

	public List<User2DTO> getSearchList(Map<String, String> map);

	// 회원가입 처리
	public int insertUser(Map<String, String> map);

	// 로그인 처리
	public Map<String, Object> selectUser(String user_id);

}
