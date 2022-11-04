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
    // TODO Auto-generated method stub

  }

  @Override
  public NoticeDTO getNotice(int notice_num) {
    // TODO Auto-generated method stub
    return null;
  }

  @Override
  public int deleteNotice(String notice_num) {
    NoticeDAO noticeDAO = sqlSession.getMapper(NoticeDAO.class);
    return noticeDAO.deleteNotice(notice_num);
  }


}
