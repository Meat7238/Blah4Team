package com.douzone.blah.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.douzone.blah.model.PostReviewDTO;

@Component
public class PostReviewDAOImpl implements PostReviewDAO {
	
	@Autowired
	private SqlSession sqlSession;

	// 댓글 조회
	@Override
	public List<PostReviewDTO> getPostReview(int post_num) {
		PostReviewDAO postReviewDAO = sqlSession.getMapper(PostReviewDAO.class);
		return postReviewDAO.getPostReview(post_num);
	}

	// 댓글 작성
	@Override
	public void insertPostReview(PostReviewDTO dto) {
		PostReviewDAO postReviewDAO = sqlSession.getMapper(PostReviewDAO.class);
		
		postReviewDAO.insertPostReview(dto);
	}
	
}
