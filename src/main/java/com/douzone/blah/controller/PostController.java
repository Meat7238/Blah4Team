package com.douzone.blah.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.douzone.blah.dao.PostDAO;
import com.douzone.blah.model.PostDTO;

@Controller
public class PostController {

	@Resource
	private PostDAO postDAO;
	
	@RequestMapping("/board")
	public String list(HttpServletRequest request) {
		
		HashMap map = new HashMap();
		List<PostDTO> list = postDAO.getPostList(map);	
		request.setAttribute("list", list);
		
		return "/board/board";
	}
	
	@RequestMapping("/writeform")
	public String writeform() {
		return "board/writeform";
	}
	
	@RequestMapping("/write")
	public String write(PostDTO dto) {
		postDAO.insertPost(dto);
		return "redirect:/board";
	}
	
	@RequestMapping("/readform")
	public String read(int post_num, Model model) {
		PostDTO dto = postDAO.getPost(post_num);
		model.addAttribute("b", dto);
		return "board/readform";
	}
	
	@RequestMapping("/delete")
	public String delete(PostDTO dto) {
		int result = postDAO.deletePost(dto);
		String res = "redirect:/board";
		if(result == 0) {
			res = "fail";
		}
		return res;
	}

}
