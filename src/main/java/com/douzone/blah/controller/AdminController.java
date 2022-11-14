package com.douzone.blah.controller;


import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.douzone.blah.dao.Admin2DAO;

@Controller
public class AdminController {

  @Resource
  private Admin2DAO admin2DAOImpl;

  //로그인폼 이동
  @RequestMapping(value = "/adminLogin", method = RequestMethod.GET )
  public String form() {
      return "admin/adminLoginForm";
  }
  //로그인 실행
  @RequestMapping(value = "/adminLogin", method = RequestMethod.POST)
  public String submit(HttpServletRequest request,HttpSession session) {
    request.setAttribute("no",0);
    String id = request.getParameter("id");
    String pwd = request.getParameter("pwd");
    Map<String, String> map = new HashMap<>();
    map.put("admin_id", id);
    System.out.println(map);
    String admin_password = admin2DAOImpl.submit(map);

    System.out.println(admin_password);
    if(admin_password.equals(pwd)){
      session.setAttribute("admin_id", id);
      return "admin/admin";
    }
    request.setAttribute("no",1);
    return "admin/adminLoginForm";
  }

  //로그아웃
  @RequestMapping("/adminLogout")
  public String out(HttpSession session) {
      session.invalidate(); //세션 정보 종료
      return "home";

  }
  

  
}
