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
  private User2DAO User2DAO;

  @RequestMapping("/admin")
  public String adminHandler(HttpServletRequest request) {

      HashMap map = new HashMap();

      List<User2DTO> list = User2DAO.getAllUserList(map);
      request.setAttribute("list", list);

      return "admin/editMember";
  }

}
