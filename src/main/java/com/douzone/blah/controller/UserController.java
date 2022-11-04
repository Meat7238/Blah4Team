package com.douzone.blah.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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


  // @GetMapping("/login/member")
  // public void logIn() {
  // System.out.println("call logIn()");
  // }

}
