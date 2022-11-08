package com.douzone.blah.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.douzone.blah.model.PostDTO;

@Component
public class PostDAOImpl implements PostDAO {

	@Autowired
	private SqlSession sqlSession;

	// 게시판 목록
	@Override
	public List<PostDTO> getPostList(HashMap map) {
		PostDAO postDAO = sqlSession.getMapper(PostDAO.class);
		return postDAO.getPostList(map);
	}
	
	// 게시판 카테고리
		@Override
		public List getPostList1(String category) {
			PostDAO postDAO = sqlSession.getMapper(PostDAO.class);
			return postDAO.getPostList1(category);
		}

	// 게시글 작성
	@Override
	public void insertPost(PostDTO dto) {
		PostDAO postDAO = sqlSession.getMapper(PostDAO.class);
		postDAO.insertPost(dto);
	}

	// 게시글 삭제
	@Override
	public int deletePost(PostDTO dto) {
		PostDAO postDAO = sqlSession.getMapper(PostDAO.class);
		return postDAO.deletePost(dto);
	}

	// 글 상세보기
	@Override
	public PostDTO getPost(int post_num) {
		PostDAO postDAO = sqlSession.getMapper(PostDAO.class);
		return postDAO.getPost(post_num);
	}

	// 게시글 수정
	@Override
	public int updatePost(PostDTO dto) {
		PostDAO postDAO = sqlSession.getMapper(PostDAO.class);
		return postDAO.updatePost(dto);
	}

	// 조회수 업데이트
	@Override
	public void updateHit(int post_num) {
		PostDAO postDAO = sqlSession.getMapper(PostDAO.class);
		postDAO.updateHit(post_num);
	}

	// 게시글 수
	@Override
	public int getPostCount() {
		PostDAO postDAO = sqlSession.getMapper(PostDAO.class);
		return postDAO.getPostCount();
	}
	
	// 게시글 검색
	@Override
	public List<PostDTO> getSearchList(Map<String, String> map) {
		PostDAO postDAO = sqlSession.getMapper(PostDAO.class);
		return postDAO.getSearchList(map);
	}

	// 카테고리 페이징 위한 게시글 카운트
	@Override
	public int getPostCountCategory(String category) {
		PostDAO postDAO = sqlSession.getMapper(PostDAO.class);
		return postDAO.getPostCountCategory(category);
	}



//	@Override
//	public void updateReviewCount(Long post_num, int amount) {
//		PostDAO postDAO = sqlSession.getMapper(PostDAO.class);
//		postDAO.updateReviewCount(post_num, amount);
//	}


}
