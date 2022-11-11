package com.douzone.blah.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.douzone.blah.dao.PostDAO;
import com.douzone.blah.dao.PostReviewDAO;
import com.douzone.blah.dao.User2DAO;
import com.douzone.blah.model.PostDTO;
import com.douzone.blah.model.PostReviewDTO;

@Controller
public class PostController {

	@Resource
	private PostDAO postDAOImpl;

	@Resource
	private PostReviewDAO postReviewDAOImpl;
	
	@Resource
	private User2DAO user2DAOImpl;

	// 게시글 목록
	@RequestMapping("/board")
	public String list(HttpServletRequest request, PostDTO dto) {
		String result = request.getParameter("category");
		System.out.println(result);

		
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


		if(result == null) {

			String category1 = "블라블라";
			String category2 = "주식투자";
			String category3 = "썸,연애";
			String category4 = "회사생활";
			String category5 = "이직,커리어";
			String category6 = "결혼,육아";
			String category7 = "홍보";
			String category8 = "취미생활";
			String category9 = "우리회사 채용해요";

			List<Map<String, Object>> list1 = postDAOImpl.getPostList1(category1);
			List<Map<String, Object>> list2 = postDAOImpl.getPostList1(category2);
			List<Map<String, Object>> list3 = postDAOImpl.getPostList1(category3);
			List<Map<String, Object>> list4 = postDAOImpl.getPostList1(category4);
			List<Map<String, Object>> list5 = postDAOImpl.getPostList1(category5);
			List<Map<String, Object>> list6 = postDAOImpl.getPostList1(category6);
			List<Map<String, Object>> list7 = postDAOImpl.getPostList1(category7);
			List<Map<String, Object>> list8 = postDAOImpl.getPostList1(category8);
			List<Map<String, Object>> list9 = postDAOImpl.getPostList1(category9);
			
			request.setAttribute("list1", list1);
			request.setAttribute("list2", list2);
			request.setAttribute("list3", list3);
			request.setAttribute("list4", list4);
			request.setAttribute("list5", list5);
			request.setAttribute("list6", list6);
			request.setAttribute("list7", list7);
			request.setAttribute("list8", list8);
			request.setAttribute("list9", list9);
			request.setAttribute("pg",pg);

			return "board/post";

		}else {
			pg=1;
			strPg = request.getParameter("pg");

			if(strPg!=null){
				pg = Integer.parseInt(strPg);
			}
			rowSize = 10;
			start = (pg*rowSize)-(rowSize -1);
			end = pg*rowSize;

			total = postDAOImpl.getPostCountCategory(result); //카테고리 게시물수

			allPage = (int) Math.ceil(total/(double)rowSize); //페이지수

			block = 10;
			fromPage = ((pg-1)/block*block)+1;
			toPage = ((pg-1)/block*block)+block;
			if(toPage> allPage){
				toPage = allPage;
			}

			HashMap map = new HashMap();
			map.put("start", start);
			map.put("end", end);
			map.put("post_category", result);

			List<Map<String, Object>> list = postDAOImpl.getPostList(map);

			request.setAttribute("list", list);
			request.setAttribute("pg",pg);
			request.setAttribute("allPage",allPage);
			request.setAttribute("block",block);
			request.setAttribute("fromPage",fromPage);
			request.setAttribute("toPage",toPage);
			request.setAttribute("category", result);

			return "board/board";

		}
	}

	// 게시글 쓰기
	@RequestMapping("/writeform")
	public String writeform(HttpServletRequest request, Principal principal) {
		String user = principal.getName();
		String user_num = user2DAOImpl.userId(user);	// id -> num변환
		System.out.println(user_num+"입니다");
		
		request.setAttribute("user_num", user_num);
		return "board/writeform";
	}

	@RequestMapping("/write")
	public String write(HttpServletRequest request, PostDTO dto) {
		String userid = request.getParameter("writer");
		postDAOImpl.insertPost(dto);
		return "redirect:/board";
	}

	// 게시글 하나 읽기
	@RequestMapping("/readform")
	public String read(HttpServletRequest request, int post_num, Model model, int pg) {

		postDAOImpl.updateHit(post_num);
//		int postreview_postnum = request.getParameterValues(postreview_postnum);
//		postDAOImpl.updateReviewCount(postreview_postnum);

		String user_id = user2DAOImpl.getUserID(post_num);
		System.out.println(user_id+"입니다");
		request.setAttribute("user_id", user_id);
		
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
	public String updateform(int post_num, Model model, int pg, Principal principal) {
		PostDTO dto = postDAOImpl.getPost(post_num);
		model.addAttribute("b", dto);
		model.addAttribute("pg", pg);
		System.out.println(principal.getName());
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
		postReviewDAOImpl.insertPostReview(dto);
		return "redirect:/readform?post_num="+post_num+"&pg="+pg;
	}

	@RequestMapping("/search")
	public String search(HttpServletRequest request, int pg){
		String column = request.getParameter("column");
		String keyvalue = request.getParameter("keyvalue");

		Map<String, String> map = new HashMap<>(); // collection
		map.put("column", column); // column : title or writer or contnet
		map.put("keyvalue", keyvalue);
		System.out.println(keyvalue);
		List<PostDTO> list = postDAOImpl.getSearchList(map);
		request.setAttribute("list", list);
		request.setAttribute("pg",pg);

		return "board/board";
	}

}
