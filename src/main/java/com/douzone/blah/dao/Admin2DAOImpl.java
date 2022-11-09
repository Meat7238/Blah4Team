package com.douzone.blah.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.douzone.blah.model.Admin2DTO;

@Component
public class Admin2DAOImpl implements Admin2DAO {

  @Autowired
  private SqlSession sqlSession;

  @Override
  public List<Admin2DTO> getAdinnList(HashMap map) {
    // TODO Auto-generated method stub
    return null;
  }

  @Override
  public int deleteAdmin(String user_num) {
    // TODO Auto-generated method stub
    return 0;
  }

  @Override
  public void insertAdmin(Admin2DTO dto) {
    // TODO Auto-generated method stub

  }

  @Override
  public int insertAdmin(Map<String, String> map) {
    // TODO Auto-generated method stub
    return 0;
  }

  @Override
  public List<Admin2DTO> submit( Map<String, String> map) {
     return sqlSession.getMapper(Admin2DAO.class).submit(map);
  }


}
