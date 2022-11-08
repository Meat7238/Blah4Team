package com.douzone.blah.dao;

import java.util.HashMap;
import java.util.List;
import com.douzone.blah.model.NoticeDTO;

public interface NoticeDAO {


  // 공지목록
  public List getNoticeList(HashMap map);

  // 공지쓰기
  public void insertNotice(NoticeDTO dto);

  // 공지삭제
  public int deleteNotice(NoticeDTO dto);

  // 공지읽기
  public NoticeDTO getNotice(int notice_num);

  // 공지 수정
  public int updateNotice(NoticeDTO dto);

  // 조회수 증가
  public void updateHit(int notice_num);

  // 공지글 수 count
  public int getNoticeCount();
}
