package com.douzone.blah.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.douzone.blah.dao.User2DAO;
import com.douzone.blah.model.User2DTO;

@Controller
public class UserController {

	@Resource
	private User2DAO user2DAOImpl;

	@Autowired
	private PasswordEncoder passwordEncoder;
	
	
	@Autowired
	public UserController(PasswordEncoder passwordEncoder) {
		super();
		this.passwordEncoder = passwordEncoder;
	}

	@RequestMapping("/admin")
	public String adminHandler(HttpServletRequest request) {
		return "admin/admin";
	}

	// 유저 편집 페이지
	@RequestMapping(value = "/admin/edit", method = RequestMethod.GET)
	public String editList(HttpServletRequest request) {
		HashMap map = new HashMap();
		List<User2DTO> list = user2DAOImpl.getAllUserList(map);
		request.setAttribute("list", list);
		return "admin/editMember";
	}

	@RequestMapping(value = "/admin/edit", method = RequestMethod.POST)
	public String editList(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String column = request.getParameter("column");
		String keyvalue = request.getParameter("keyvalue");
		System.out.println(column + " / " + keyvalue);

		Map<String, String> map = new HashMap<>();
		map.put("column", column);
		map.put("keyvalue", keyvalue);

		List<User2DTO> list = user2DAOImpl.getSearchList(map);
		if (list != null) {
			request.setAttribute("list", list);
			System.out.println(list);
			return "admin/editMember";
		} else {
			return "fail";
		}
	}

	// 유저 삭제
	@RequestMapping("/admin/edit/delete")
	public String delete(HttpServletRequest request, User2DTO dto) {
		String num = request.getParameter("num");
		System.out.println(num);
		int cnt = user2DAOImpl.deleteUser2(num);
		String res = "redirect:/admin/edit";
		if (cnt == 0) {
			res = "fail";
		}
		return res;
	}

	// 로그인 페이지로 이동
	@GetMapping("/login/loginForm")
	public String logIn() {
		return "login/loginForm";
	}

	// 회원가입 페이지로 이동
	@RequestMapping("/join/join")
	public String join() {
		return "join/join";
	}
	

	// 회원가입 처리
	@PostMapping("/join/joinAction")
	public String insertUser(@RequestParam("user_id") String user_id, @RequestParam("user_password") String user_password, @RequestParam("user_email") String user_email, 
			@RequestParam("user_nick") String user_nick, @RequestParam("user_jobgroup") String user_jobgroup, @RequestParam("user_workspace") String user_workspace) {
		// 비밀번호 암호화
		System.out.println("컨트롤러 오케이");
		Map<String, String> map = new HashMap<>();
		map.put("user_id", user_id);
		map.get("user_id");
		System.out.println("id까지");
		map.put("user_password", passwordEncoder.encode(user_password));
		System.out.println("암호화 오케이");
		map.put("user_nick", user_nick);
		map.put("user_email", user_email);
		map.put("user_jobgroup", user_jobgroup);
		map.put("user_workspace", user_workspace);
		System.out.println("입력완료!");
		// affected rows, 영향을 받은 행의 수가 리턴됨
		int result = user2DAOImpl.insertUser(map);
		System.out.println("insert끝");
		return "/login/loginForm"; // login.jsp로 이동
	}

}
