package com.douzone.blah.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.douzone.blah.dao.PostDAO;
import com.douzone.blah.model.PostDTO;

@Controller
public class searchController {
	
	@Resource
	private PostDAO postDAOImpl;
	

	/*
	 * @RequestMapping("/search") public String search(HttpServletRequest request,
	 * int pg){ String column = request.getParameter("column"); String keyvalue =
	 * request.getParameter("keyvalue");
	 * 
	 * Map<String, String> map = new HashMap<>(); // collection map.put("column",
	 * column); // column : title or writer or contnet map.put("keyvalue",
	 * keyvalue); System.out.println(map+"검색중"); System.out.println(keyvalue);
	 * List<PostDTO> list = postDAOImpl.getSearchList(map);
	 * request.setAttribute("list", list); request.setAttribute("pg",pg);
	 * 
	 * return "board/board"; }
	 */

}
