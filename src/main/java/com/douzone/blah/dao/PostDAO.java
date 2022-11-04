package com.douzone.blah.dao;

import java.util.HashMap;
import java.util.List;

import com.douzone.blah.model.PostDTO;

public interface PostDAO {

	//게시글 목록
	public List<PostDTO> getPostList(HashMap map);
	
	//글 쓰기
	public void insertPost(PostDTO dto);
	
	//글 삭제
	public int deletePost(PostDTO dto);
	
	//글 읽기
	public PostDTO getPost(int post_num);
}
