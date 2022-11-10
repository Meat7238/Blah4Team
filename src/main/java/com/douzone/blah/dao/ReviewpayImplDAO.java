//package com.douzone.blah.dao;
//
//import java.util.HashMap;
//import java.util.List;
//
//import org.apache.ibatis.session.SqlSession;
//import org.springframework.beans.factory.annotation.Autowired;
//
//import com.douzone.blah.model.ReviewpayDTO;
//
//public class ReviewpayImplDAO implements ReviewpayDAO {
//
//	@Autowired
//	private SqlSession sqlSession;
//	
//	@Override
//	public List<ReviewpayDTO> getReviewPay(HashMap map) {
//		ReviewpayDAO reviewpayDAO = sqlSession.getMapper(ReviewpayDAO.class);
//		return reviewpayDAO.getReviewPay(map);
//	}
//	
//	
//	
//}
