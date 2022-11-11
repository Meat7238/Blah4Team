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
	public void insertPostReview(HashMap map) {
		PostReviewDAO postReviewDAO = sqlSession.getMapper(PostReviewDAO.class);
		
		postReviewDAO.insertPostReview(map);
	}

	// 댓글 번호 가져오기
	@Override
	public int getReviewNum(int post_num) {
		PostReviewDAO postReviewDAO = sqlSession.getMapper(PostReviewDAO.class);
		return postReviewDAO.getReviewNum(post_num);
	}

	// 댓글 입력한 id 가져오기
	@Override
	public String getReviewId(int post_num) {
		PostReviewDAO postReviewDAO = sqlSession.getMapper(PostReviewDAO.class);
		return postReviewDAO.getReviewId(post_num);
	}
	
}
