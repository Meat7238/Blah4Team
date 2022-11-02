package com.douzone.blah.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.douzone.blah.dao.PostDAO;
import com.douzone.blah.model.PostDTO;

@Controller
public class PostController {

	@Resource
	private PostDAO postDAO;
	
	@RequestMapping("/list")
	public String list(HttpServletRequest request) {
		
		HashMap map = new HashMap();
		
		List<PostDTO> list = postDAO.getPostList(map);	
		request.setAttribute("list", list);
		
		return "list";
	}

}
