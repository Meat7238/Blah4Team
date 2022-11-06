package com.douzone.blah.dao;

import java.util.HashMap;
import java.util.List;
import com.douzone.blah.model.ReportPDTO;

public interface ReportPDAO {


  // 신고된 게시판 목록
  public List getReportP(HashMap map);

  // 게시판 신고하기
  public void inserReportP(ReportPDTO dto);

  // 신고된 게시판 처리하기
  public int updateReportP(ReportPDTO dto);

}
