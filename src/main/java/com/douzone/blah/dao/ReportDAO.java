package com.douzone.blah.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.douzone.blah.model.ReportCrDTO;
import com.douzone.blah.model.ReportPDTO;
import com.douzone.blah.model.ReportPrDTO;

public interface ReportDAO {

  // 게시판 신고수 count
  public int getReportPCount();

  // 신고된 게시판 목록
  public List getReportP(HashMap map);

  // 게시판 신고하기
  public void insertReportP(ReportPDTO dto);

  // 신고된 게시판 처리하기
  public int updateReportP(Map<String, String> map);



  // 댓글 신고수 count
  public int getReportPrCount();

  // 신고된 댓글 목록
  public List getReportPr(HashMap map2);

  // 댓글 신고하기
  public void insertReportPr(ReportPrDTO dto2);

  // 신고된 댓글 처리하기
  public int updateReportPr(Map<String, String> map2);



  // 리뷰 신고수 count
  public int getReportCrCount();

  // 신고된 리뷰 목록
  public List getReportCr(HashMap map3);

  // 리뷰 신고하기
  public void insertReportCr(ReportCrDTO dto3);

  // 신고된 리뷰 처리하기
  public int updateReportCr(Map<String, String> map3);

}
