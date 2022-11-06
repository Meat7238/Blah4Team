package com.douzone.blah.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.douzone.blah.dao.PostDAO;
import com.douzone.blah.dao.PostReviewDAO;
import com.douzone.blah.model.PostDTO;
import com.douzone.blah.model.PostReviewDTO;

@Controller
public class PostController {

	@Resource
	private PostDAO postDAOImpl;
	
	@Resource
	private PostReviewDAO postReviewDAOImpl;
	
	// 게시글 목록
	@RequestMapping("/board")
	public String list(HttpServletRequest request) {
		
		int pg=1;
		String strPg = request.getParameter("pg");
		
		if(strPg!=null){
			pg = Integer.parseInt(strPg);			
		}
		int rowSize = 10;
		int start = (pg*rowSize)-(rowSize -1);
		int end = pg*rowSize;
		
		int total = postDAOImpl.getPostCount(); //총 게시물수
		System.out.println("시작 : "+start +" 끝:"+end);
		System.out.println("글의 수 : "+total);
		
		int allPage = (int) Math.ceil(total/(double)rowSize); //페이지수
		//int totalPage = total/rowSize + (total%rowSize==0?0:1);
		System.out.println("페이지수 : "+ allPage);
		
		int block = 10; //한페이지에 보여줄  범위 << [1] [2] [3] [4] [5] [6] [7] [8] [9] [10] >>
		int fromPage = ((pg-1)/block*block)+1;  //보여줄 페이지의 시작
		//((1-1)/10*10)
		int toPage = ((pg-1)/block*block)+block; //보여줄 페이지의 끝
		if(toPage> allPage){ // 예) 20>17
			toPage = allPage;
		}

		HashMap map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		List<PostDTO> list = postDAOImpl.getPostList(map);
		request.setAttribute("list", list);
		request.setAttribute("pg",pg);
		request.setAttribute("allPage",allPage);
		request.setAttribute("block",block);
		request.setAttribute("fromPage",fromPage);
		request.setAttribute("toPage",toPage);

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
	public String read(int post_num, Model model, int pg) {

		postDAOImpl.updateHit(post_num);
		PostDTO dto = postDAOImpl.getPost(post_num);
		model.addAttribute("b", dto);
		model.addAttribute("pg", pg);
		
		List<PostReviewDTO> reviewList = postReviewDAOImpl.getPostReview(post_num);
		model.addAttribute("reviewList", reviewList);
		
		return "board/readform";
	}

	// 게시글 삭제
	@RequestMapping("/delete")
	public String delete(PostDTO dto, int pg) {
		int result = postDAOImpl.deletePost(dto);
		String res = "redirect:/board?pg="+pg;
		if(result == 0) {
			res = "fail";
		}
		return res;
	}
	
	// 게시글 수정
	@RequestMapping("/updateform")
	public String updateform(int post_num, Model model, int pg) {
		PostDTO dto = postDAOImpl.getPost(post_num);
		model.addAttribute("b", dto);
		model.addAttribute("pg", pg);
		return "board/updateform";
	}
	@RequestMapping("/update")
	public String update(PostDTO dto, int pg) {
		int result = postDAOImpl.updatePost(dto);
		String res= "redirect:/board?pg="+pg;
		System.out.println(result);
		return res;
	}
	
	// 댓글 작성
	@RequestMapping("/review")
	public String insertPostReview(PostReviewDTO dto, int post_num, int pg) {
		System.out.println("댓글왓어용");
		postReviewDAOImpl.insertPostReview(dto);
		return "redirect:/readform?post_num="+post_num+"&pg="+pg;
	}

}
