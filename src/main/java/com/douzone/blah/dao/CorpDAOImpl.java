package com.douzone.blah.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.douzone.blah.model.CorpDTO;
import com.douzone.blah.model.CorpreviewDTO;

@Component
public class CorpDAOImpl implements CorpDAO {

	@Autowired
	private SqlSession sqlSession;

//	@Override
//	public List<CorpDTO> getCorpList(HashMap map) {
//		CorpDAO corpDAO = sqlSession.getMapper(CorpDAO.class);
//		return corpDAO.getCorpList(map);
//	}

	@Override
	public List<CorpDTO> searchCorp(String corp_num) {
		CorpDAO corpDAO = sqlSession.getMapper(CorpDAO.class);
		return corpDAO.searchCorp(corp_num);
	}

	@Override
	public CorpDTO corpDetail(String corp_num) {
		CorpDAO corpDAO = sqlSession.getMapper(CorpDAO.class);
		return corpDAO.corpDetail(corp_num);
	}

	@Override
	public CorpreviewDTO corpReview(String corpreviewnum) {
		CorpDAO corpDAO = sqlSession.getMapper(CorpDAO.class);
		return corpDAO.corpReview(corpreviewnum);
	}

	@Override
	public void insertReview(CorpreviewDTO dto) {

		CorpDAO corpDAO = sqlSession.getMapper(CorpDAO.class);
		corpDAO.insertReview(dto);

	}
}