package com.douzone.blah.dao;

import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.douzone.blah.model.ReportPDTO;

@Component
public class ReportPDAOImpl implements ReportPDAO {

  @Autowired
  private SqlSession sqlSession;

  // 신고된 게시판 목록
  @Override
  public List getReportP(HashMap map) {
    ReportPDAO reportPDAO = sqlSession.getMapper(ReportPDAO.class);
    return reportPDAO.getReportP(map);
  }

  // 게시판 신고하기
  @Override
  public void inserReportP(ReportPDTO dto) {
    // TODO Auto-generated method stub

  }

  // 신고된 게시판 처리하기
  @Override
  public int updateReportP(ReportPDTO dto) {
    ReportPDAO reportPDAO = sqlSession.getMapper(ReportPDAO.class);
    return reportPDAO.updateReportP(dto);
  }

}
