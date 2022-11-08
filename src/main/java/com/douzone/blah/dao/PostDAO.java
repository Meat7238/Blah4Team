package com.douzone.blah.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.douzone.blah.model.PostDTO;

public interface PostDAO {

	//게시글 목록
	public List getPostList(HashMap map);
	//게시글 전체목록
	public List getPostListAll(HashMap map);
	//카테고리별 분류
	public List getPostList1(String category);

	//글 쓰기
	public void insertPost(PostDTO dto);

	//글 삭제
	public int deletePost(PostDTO dto);

	//글 읽기
	public PostDTO getPost(int post_num);

	// 글 수정
	public int updatePost(PostDTO dto);

	// 조회수 증가
	public void updateHit(int post_num);

	// 글의 수
	public int getPostCount();

	// 댓글 개수
	//public void updateReviewCount(@Param("post_num") Long post_num, @Param("amount") int amount);

	// 게시글 검색
	public List<PostDTO> getSearchList(Map<String, String> map);

	// 카테고리 게시물 수
	public int getPostCountCategory(String category);
}
