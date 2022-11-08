package com.douzone.blah.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.douzone.blah.model.Admin2DTO;

public interface Admin2DAO {

  //관리자 조회
  public List<Admin2DTO> getAdinnList(HashMap map);// 전체조회

  //관리자 삭제
  public int deleteAdmin(String user_num);

  //관리자 추가
  public void insertAdmin(Admin2DTO dto);

  //회원가입 처리
  public int insertAdmin(Map<String, String> map);

  //로그인
  public List<Admin2DTO> submit( Map<String, String> map);

}
