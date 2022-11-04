package com.douzone.blah.controller;

import java.util.HashMap;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.douzone.blah.dao.NoticeDAO;
import com.douzone.blah.model.NoticeDTO;

@Controller
public class NoticeController {

  @Resource
  private NoticeDAO noticeDAOImpl;

  // 공지사항 수정페이지 진입
  @RequestMapping(value = "/admin/noticeUpdate", method = RequestMethod.GET)
  public String noticeUpdate(int notice_num, Model model) {
    NoticeDTO dto = noticeDAOImpl.getNotice(notice_num);
    model.addAttribute("p", dto);
    return "admin/noticeUpdate";
  }

  // 공지사항 수정사항 반영
  @RequestMapping(value = "/admin/noticeUpdate", method = RequestMethod.POST)
  public String noticeUpdate(NoticeDTO dto) {

    System.out.println("update : " + dto);
    int result = noticeDAOImpl.updateNotice(dto);
    System.out.println("result : " + result);
    if(result ==0) {
      return "fail";
    }
    return "redirect:/admin/notice";
  }

  // 공지사항 보기
  @RequestMapping("/admin/notice")
  public String editNoticeList(HttpServletRequest request) {
    HashMap map = new HashMap();
    List<NoticeDTO> list = noticeDAOImpl.getNoticeList(map);
    request.setAttribute("noticelist", list);
    System.out.println(list);
    return "admin/notice";
  }

  // 공지사항 하나 보기
  @RequestMapping("/admin/noticeDetail")
  public String editDetail(int notice_num, Model model) {
    noticeDAOImpl.updateHit(notice_num);
    NoticeDTO dto = noticeDAOImpl.getNotice(notice_num);
    model.addAttribute("p", dto);
    return "admin/noticeDetail";
  }

  // 공지사항 삭제
  @RequestMapping("/admin/notice/delete")
  public String delete(HttpServletRequest request, NoticeDTO dto) {
    String num = request.getParameter("notice_num");
    int cnt = noticeDAOImpl.deleteNotice(num);
    String res = "redirect:/admin/notice";
    if (cnt == 0) {
      res = "fail";
    }
    return res;
  }


}
