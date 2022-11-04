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
	private PostDAO postDAOImpl;
	
	// 게시글 목록
	@RequestMapping("/board")
	public String list(HttpServletRequest request) {

		HashMap map = new HashMap();
		List<PostDTO> list = postDAOImpl.getPostList(map);
		request.setAttribute("list", list);

		return "/board/board";
	}

	// 게시글 쓰기
	@RequestMapping("/writeform")
	public String writeform() {
		return "board/writeform";
	}

	@RequestMapping("/write")
	public String write(PostDTO dto) {
		postDAOImpl.insertPost(dto);
		return "redirect:/board";
	}

	// 게시글 하나 읽기
	@RequestMapping("/readform")
	public String read(int post_num, Model model) {

		postDAO.updateHit(post_num);
		PostDTO dto = postDAO.getPost(post_num);
		PostDTO dto = postDAOImpl.getPost(post_num);
		model.addAttribute("b", dto);
		return "board/readform";
	}

	// 게시글 삭제
	@RequestMapping("/delete")
	public String delete(PostDTO dto) {
		int result = postDAOImpl.deletePost(dto);
		String res = "redirect:/board";
		if(result == 0) {
			res = "fail";
		}
		return res;
	}
	
	// 게시글 수정
	@RequestMapping("/updateform")
	public String updateform(int post_num, Model model) {
		PostDTO dto = postDAO.getPost(post_num);
		model.addAttribute("b", dto);
		return "board/updateform";
	}
	@RequestMapping("/update")
	public String update(PostDTO dto) {
		int result = postDAO.updatePost(dto);
		String res= "redirect:/board";
		System.out.println(result);
		return res;
	}

}
