package com.douzone.blah.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.douzone.blah.model.ReportCrDTO;
import com.douzone.blah.model.ReportPDTO;
import com.douzone.blah.model.ReportPrDTO;

@Component
public class ReportDAOImpl implements ReportDAO {

  @Autowired
  private SqlSession sqlSession;


  // 신고된 게시판 목록
  @Override
  public List getReportP(HashMap map) {
    ReportDAO reportPDAO = sqlSession.getMapper(ReportDAO.class);
    return reportPDAO.getReportP(map);
  }

  // 게시판 신고하기
  @Override
  public void insertReportP(ReportPDTO dto) {
    // TODO Auto-generated method stub

  }

  // 신고된 게시판 처리하기
  @Override
  public int updateReportP(Map<String, String> map) {
    ReportDAO reportPDAO = sqlSession.getMapper(ReportDAO.class);
    return reportPDAO.updateReportP(map);
  }

  // 신고된 댓글 목록
  @Override
  public List getReportPr(HashMap map) {
    ReportDAO reportPrDAO = sqlSession.getMapper(ReportDAO.class);
    return reportPrDAO.getReportPr(map);
  }

  // 댓글 신고하기
  @Override
  public void insertReportPr(ReportPrDTO dto) {
    // TODO Auto-generated method stub

  }

  // 신고된 댓글 처리하기
  @Override
  public int updateReportPr(Map<String, String> map2) {
    ReportDAO reportPrDAO = sqlSession.getMapper(ReportDAO.class);
    return reportPrDAO.updateReportPr(map2);
  }
  // 리뷰 신고수 count

  //신고된 리뷰 목록
  @Override
  public List getReportCr(HashMap map3) {
    ReportDAO reportCrDAO = sqlSession.getMapper(ReportDAO.class);
    return reportCrDAO.getReportCr(map3);
  }

  //리뷰 신고하기
  @Override
  public void insertReportCr(ReportCrDTO dto3) {
    // TODO Auto-generated method stub

  }

  //신고된 리뷰 처리하기
  @Override
  public int updateReportCr(Map<String, String> map3) {
    ReportDAO reportCrDAO = sqlSession.getMapper(ReportDAO.class);
    return reportCrDAO.updateReportCr(map3);
  }


  // 게시판 신고수 count
  @Override
  public int getReportPCount() {
    ReportDAO reportPDAO = sqlSession.getMapper(ReportDAO.class);
    return reportPDAO.getReportPCount();
  }

  // 댓글 신고수 count
  @Override
  public int getReportPrCount() {
    ReportDAO reportPrDAO = sqlSession.getMapper(ReportDAO.class);
    return reportPrDAO.getReportPCount();
  }

  // 리뷰 신고수 count
  @Override
  public int getReportCrCount() {
    ReportDAO reportCrDAO = sqlSession.getMapper(ReportDAO.class);
    return reportCrDAO.getReportPCount();
  }

}
