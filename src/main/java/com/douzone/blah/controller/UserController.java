package com.douzone.blah.controller;

import java.util.HashMap;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.douzone.blah.dao.User2DAO;
import com.douzone.blah.model.User2DTO;


@Controller
public class UserController {

  @Resource
  private User2DAO user2DAOImpl;



  @RequestMapping("/admin")
  public String adminHandler(HttpServletRequest request) {
      return "admin/admin";
  }

  @RequestMapping("/admin/edit")
  public String list(HttpServletRequest request) {

    HashMap map = new HashMap();

    List<User2DTO> list = user2DAOImpl.getAllUserList(map);
    request.setAttribute("list", list);

    return "admin/editMember";
  }
  @RequestMapping("/admin/edit/delete")
  public String delete(HttpServletRequest request,User2DTO dto) {
    String num = request.getParameter("num");
    System.out.println(num);
    int cnt =user2DAOImpl.deleteUser2(num);
    System.out.println("여기까지 정상실행");
    String res = "redirect:/admin/edit";
    if(cnt ==0) {
      res = "fail";
    }
    return res;
  }

//  @GetMapping("/login/member")
//  public void logIn() {
//	  System.out.println("call logIn()");
//  }


}
