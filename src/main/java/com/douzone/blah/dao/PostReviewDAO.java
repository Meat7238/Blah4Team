package com.douzone.blah.dao;

import java.util.HashMap;
import java.util.List;

import com.douzone.blah.model.PostReviewDTO;

public interface PostReviewDAO {

	//댓글 조회
	public List<PostReviewDTO> getPostReview(int post_num);
	
	//댓글 작성
	public void insertPostReview(HashMap map);
	
}
