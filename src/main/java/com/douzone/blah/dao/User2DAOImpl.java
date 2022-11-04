package com.douzone.blah.dao;

import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.douzone.blah.model.User2DTO;

@Component
public class User2DAOImpl implements User2DAO {

  @Autowired
  private SqlSession sqlSession;



  @Override
  public void insertUser2(User2DTO dto) {
    // TODO Auto-generated method stub

  }

  @Override
  public List<User2DTO> getAllUserList(HashMap map) {
    return sqlSession.getMapper(User2DAO.class).getAllUserList(map);
  }

  @Override
  public int updateUser2(User2DTO dto) {
    // TODO Auto-generated method stub
    return 0;
  }

  @Override
  public int deleteUser2(String user_num) {
    return sqlSession.delete("deleteUser2", user_num);
  }

}
