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

	public List<User2DTO> getSearchList(Map<String, String> map);	// 검색

	// 회원가입
	public int insertUser(Map<String, String> map);

	// 회원가입 아이디 중복 확인
	public int idDupleCheck(String user_id);

	// 회원가입 이메일 중복 확인
	public int emailDupleCheck(String user_email);

	// 이메일 인증 키 부여
	int updateMailKey(Map<String, Object> map) throws Exception;

	// 이메일 인증 후 계정 활성화
	int updateMailAuth(Map<String, Object> map) throws Exception;

	// 이메일 인증 안한 계정 처리
	int emailAuthFail(String id) throws Exception;

	// 로그인
	public Map<String, Object> selectUser(String user_id);

	// 마이페이지 회원 정보 조회
	public Map<String, Object> showMemberInfo(String user_id);

	// 마이페이지 회원 정보 수정
	public int editMemberInfo(Map<String, String> map);

	// 게시글 작성한 회원 ID얻기
	public String getUserID(int string);

	// userId -> userNum
	public String getUserNum(String user);

	// user수 count
	public int getUserCount();

	// user의 post수 count
	public int getUserPostCount(String user_num);

	// user 권한 update
	public int updateAuthority(Map<String, String> map);

}
