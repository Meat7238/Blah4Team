package com.douzone.blah.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.douzone.blah.model.User2DTO;

public interface User2DAO {
  //회원에 대한 전체조회,추가,수정,삭제
  public void insertUser2(User2DTO dto); //추가
  public List<User2DTO> getAllUserList(HashMap map);//전체조회
  public int updateUser2(User2DTO dto); //수정
  public int deleteUser2(String user_num); //삭제
  public List<User2DTO> getSearchList(Map<String, String> map);


}
