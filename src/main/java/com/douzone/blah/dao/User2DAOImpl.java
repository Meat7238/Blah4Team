package com.douzone.blah.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import com.douzone.blah.model.User2DTO;

@Component
public class User2DAOImpl implements User2DAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	

	// 유저 추가
	@Override
	public void insertUser2(User2DTO dto) {
		// TODO Auto-generated method stub

	}

	// 유저 정보 수정
	@Override
	public int updateUser2(User2DTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 유저 삭제
	@Override
	public int deleteUser2(String user_num) {
		return sqlSession.delete("deleteUser2", user_num);
	}

	// 유저 전체 조회
	@Override
	public List<User2DTO> getAllUserList(HashMap map) {
		return sqlSession.getMapper(User2DAO.class).getAllUserList(map);
	}

	// 특정유저조회
	@Override
	public List<User2DTO> getSearchList(Map<String, String> map) {
		return sqlSession.getMapper(User2DAO.class).getSearchList(map);
	}

	// 회원가입
	@Override
	public int insertUser(Map<String, String> map) {
		return sqlSession.insert("insertUser", map);
	}

	// 로그인 SQL
	@Override
	public Map<String, Object> selectUser(String user_id) {
		return sqlSession.selectOne("selectUser", user_id);
	}
	
	// 마이페이지 회원 정보 조회
	public Map<String, Object> showMemberInfo(String user_id){
		return sqlSession.selectOne("showMemberInfo", user_id);
	}
	
	// 마이페이지 회원 정보 수정
	public int editMemberInfo(Map<String, String> map) {
		return sqlSession.update("editMemberInfo", map);
	}

}
