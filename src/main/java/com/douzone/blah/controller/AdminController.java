package com.douzone.blah.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.douzone.blah.dao.Admin2DAO;
import com.douzone.blah.model.Admin2DTO;

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
  @RequestMapping(value = "/adminlogin", method = RequestMethod.POST)
  public String submit(HttpServletRequest request,HttpSession session) {
    String id = request.getParameter("id");
    String pwd = request.getParameter("pwd");
    Map<String, String> map = new HashMap<>();
    map.put("admin2_id", id);
    map.put("admin2_password", pwd);
    System.out.println(map);
    String viewPage = "admin/adminLogin";
    List<Admin2DTO> list = admin2DAOImpl.submit(map);
    System.out.println(list);
//    if(list != null){
//      session.setAttribute("admin2_id", id);
//      viewPage = "admin";
//    }
    return viewPage;
  }
}
