//package com.douzone.blah.controller;
//
//import java.security.Principal;
//import java.util.HashMap;
//import java.util.List;
//
//import javax.annotation.Resource;
//import javax.servlet.http.HttpServletRequest;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//import com.douzone.blah.dao.ReviewpayDAO;
//import com.douzone.blah.dao.User2DAO;
//import com.douzone.blah.model.ReviewpayDTO;
//
//@Controller
//public class ReviewpayController {
//
//	@Resource
//	private ReviewpayDAO reviewpayDAOImpl;
//
//	@Resource
//	private User2DAO user2DAOImpl;
//
//	@RequestMapping("/reviewpayhome")
//	public String reviewpayhome(HttpServletRequest request, Principal principal) {
//		HashMap map = new HashMap();
//		List<ReviewpayDTO> reviewpay = reviewpayDAOImpl.getReviewPay(map);
//		
//		String user_id = principal.getName();
//		System.out.println("아이디는 =========> "+user_id);
//
//		request.setAttribute("reviewpay", reviewpay);
//
//		return "/reviewpay/reviewpayhome";
//
//	}
//
//}
