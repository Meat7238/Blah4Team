package com.douzone.blah.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import lombok.extern.log4j.Log4j;


@Component
@Log4j
public class RecruitDAOImpl implements RecruitDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Map<String, Object>> selectRecruit(String corp_name) {
		List<Map<String, Object>> result = sqlSession.selectList("com.douzone.blah.dao.RecruitDAO.selectRecruit", corp_name);
		return result;
	}

  @Override
  public List getRecruitList(HashMap map) {
    RecruitDAO recruitDAO = sqlSession.getMapper(RecruitDAO.class);
    return recruitDAO.getRecruitList(map);
  }

}


