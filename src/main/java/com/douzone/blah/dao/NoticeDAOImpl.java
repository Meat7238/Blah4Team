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

  @Override
  public List<NoticeDTO> getNoticeList(HashMap map) {
    NoticeDAO noticeDAO = sqlSession.getMapper(NoticeDAO.class);
    return noticeDAO.getNoticeList(map);
  }

  @Override
  public void insertNotice(NoticeDTO dto) {
    NoticeDAO noticeDAO = sqlSession.getMapper(NoticeDAO.class);
    noticeDAO.insertNotice(dto);
  }

  @Override
  public NoticeDTO getNotice(int notice_num) {
    NoticeDAO noticeDAO = sqlSession.getMapper(NoticeDAO.class);
    return noticeDAO.getNotice(notice_num);
  }

  @Override
  public int deleteNotice(NoticeDTO dto) {
    NoticeDAO noticeDAO = sqlSession.getMapper(NoticeDAO.class);
    return noticeDAO.deleteNotice(dto);
  }

  @Override
  public void updateHit(int post_num) {
    NoticeDAO noticeDAO = sqlSession.getMapper(NoticeDAO.class);
    noticeDAO.updateHit(post_num);
  }

  @Override
  public int updateNotice(NoticeDTO dto) {
    NoticeDAO noticeDAO = sqlSession.getMapper(NoticeDAO.class);
    return noticeDAO.updateNotice(dto);
  }


}
