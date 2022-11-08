package com.douzone.blah.dao;

import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.douzone.blah.model.NoticeDTO;

@Component
public class NoticeDAOImpl implements NoticeDAO {

  @Autowired
  private SqlSession sqlSession;
//공지목록
  @Override
  public List<NoticeDTO> getNoticeList(HashMap map) {
    NoticeDAO noticeDAO = sqlSession.getMapper(NoticeDAO.class);
    return noticeDAO.getNoticeList(map);
  }
//공지쓰기
  @Override
  public void insertNotice(NoticeDTO dto) {
    NoticeDAO noticeDAO = sqlSession.getMapper(NoticeDAO.class);
    noticeDAO.insertNotice(dto);
  }
  // 공지읽기
  @Override
  public NoticeDTO getNotice(int notice_num) {
    NoticeDAO noticeDAO = sqlSession.getMapper(NoticeDAO.class);
    return noticeDAO.getNotice(notice_num);
  }
  // 공지삭제
  @Override
  public int deleteNotice(NoticeDTO dto) {
    NoticeDAO noticeDAO = sqlSession.getMapper(NoticeDAO.class);
    return noticeDAO.deleteNotice(dto);
  }
//조회수 증가
  @Override
  public void updateHit(int post_num) {
    NoticeDAO noticeDAO = sqlSession.getMapper(NoticeDAO.class);
    noticeDAO.updateHit(post_num);
  }
//공지 수정
  @Override
  public int updateNotice(NoticeDTO dto) {
    NoticeDAO noticeDAO = sqlSession.getMapper(NoticeDAO.class);
    return noticeDAO.updateNotice(dto);
  }
//공지글 수 count
  @Override
  public int getNoticeCount() {
    NoticeDAO noticeDAO = sqlSession.getMapper(NoticeDAO.class);
    return noticeDAO.getNoticeCount();
  }


}
