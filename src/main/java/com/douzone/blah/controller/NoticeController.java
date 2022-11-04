package com.douzone.blah.controller;

import java.util.HashMap;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.douzone.blah.dao.NoticeDAO;
import com.douzone.blah.model.NoticeDTO;

@Controller
public class NoticeController {

  @Resource
  private NoticeDAO noticeDAOImpl;

  @RequestMapping("/admin/notice")
  public String NoticeList(HttpServletRequest request) {
    HashMap map = new HashMap();
    List<NoticeDTO> list = noticeDAOImpl.getNoticeList(map);
    request.setAttribute("noticelist", list);
    System.out.println(list);
    return "admin/notice";
  }

  @RequestMapping("/admin/notice/delete")
  public String delete(HttpServletRequest request,NoticeDTO dto) {
    String num = request.getParameter("notice_num");
    int cnt = noticeDAOImpl.deleteNotice(num);
    String res = "redirect:/admin/notice";
    if(cnt==0) {
      res="fail";
    }
    return res;
  }
}
