package com.douzone.blah.dao;

import java.util.HashMap;
import java.util.List;

import com.douzone.blah.model.PostDTO;

public interface PostDAO {

	public List<PostDTO> getPostList(HashMap map);
}
