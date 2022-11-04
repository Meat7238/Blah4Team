package com.douzone.blah.dao;

import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.douzone.blah.model.PostDTO;

@Component
public class PostDAOImpl implements PostDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<PostDTO> getPostList(HashMap map) {
		PostDAO postDAO = sqlSession.getMapper(PostDAO.class);
		return postDAO.getPostList(map);
	}

	@Override
	public void insertPost(PostDTO dto) {
		PostDAO postDAO = sqlSession.getMapper(PostDAO.class);
		postDAO.insertPost(dto);
	}

	@Override
	public int deletePost(PostDTO dto) {
		PostDAO postDAO = sqlSession.getMapper(PostDAO.class);
		return postDAO.deletePost(dto);
	}

	@Override
	public PostDTO getPost(int post_num) {
		PostDAO postDAO = sqlSession.getMapper(PostDAO.class);
		return postDAO.getPost(post_num);
	}

}
