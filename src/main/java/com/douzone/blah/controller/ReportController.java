package com.douzone.blah.controller;

import java.util.HashMap;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.douzone.blah.dao.ReportPDAO;
import com.douzone.blah.model.ReportPDTO;

@Controller
public class ReportController {

  @Resource
  private ReportPDAO reportPDAOImpl;

  // 게시글 신고사항 보기
  @RequestMapping("admin/ManageReport")
  public String reportPostList(HttpServletRequest request) {
    HashMap map = new HashMap();
    List<ReportPDTO> plist = reportPDAOImpl.getReportP(map);
    request.setAttribute("reportPostList", plist);
    System.out.println(plist);
    return "admin/ManageReport";
  }

//  // 공지사항 삭제
//  @RequestMapping("/admin/notice/delete")
//  public String delete(NoticeDTO dto) {
//    int cnt = noticeDAOImpl.deleteNotice(dto);
//    String res = "redirect:/admin/notice";
//    if (cnt == 0) {
//      res = "fail";
//    }
//    return res;
//  }
//// 공지사항 수정
//@RequestMapping(value = "/admin/noticeUpdate", method = RequestMethod.GET)
//public String noticeUpdate(int notice_num, Model model) {
//  NoticeDTO dto = noticeDAOImpl.getNotice(notice_num);
//  model.addAttribute("p", dto);
//  return "admin/noticeUpdate";
//}
//@RequestMapping(value = "/admin/noticeUpdate", method = RequestMethod.POST)
//public String noticeUpdate(NoticeDTO dto) {
//
//  System.out.println("update : " + dto);
//  int result = noticeDAOImpl.updateNotice(dto);
//  System.out.println("result : " + result);
//  if(result ==0) {
//    return "fail";
//  }
//  return "redirect:/admin/notice";
//}

//// 공지사항 작성
//@RequestMapping(value = "admin/writeform", method = RequestMethod.GET)
//public String writeform() {
//    return "admin/writeform";
//}
//@RequestMapping(value = "admin/writeform", method = RequestMethod.POST)
//public String writeform(NoticeDTO dto) {
//  System.out.println(dto);
//  noticeDAOImpl.insertNotice(dto);
//  return "redirect:notice";
//}
//

}
