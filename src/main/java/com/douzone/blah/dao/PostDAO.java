package com.douzone.blah.dao;

import java.util.HashMap;
import java.util.List;
import com.douzone.blah.model.PostDTO;

public interface PostDAO {

	//게시글 목록
	public List getPostList(HashMap map);

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
	
}
