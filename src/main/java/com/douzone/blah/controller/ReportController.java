package com.douzone.blah.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.douzone.blah.dao.ReportDAO;
import com.douzone.blah.model.ReportCrDTO;
import com.douzone.blah.model.ReportPDTO;
import com.douzone.blah.model.ReportPrDTO;

@Controller
public class ReportController {

  @Resource
  private ReportDAO reportDAOImpl;

  // 신고사항 보기
  @RequestMapping("admin/ManageReport")
  public String reportPostList(HttpServletRequest request) {
    HashMap map = new HashMap();
    List<ReportPDTO> plist = reportDAOImpl.getReportP(map);
    request.setAttribute("reportPostList", plist);
//    System.out.println(plist);

    HashMap map2 = new HashMap();
    List<ReportPrDTO> prlist = reportDAOImpl.getReportPr(map2);
    request.setAttribute("reportPostReviewList", prlist);
//    System.out.println(prlist);

    HashMap map3 = new HashMap();
    List<ReportCrDTO> crlist = reportDAOImpl.getReportCr(map3);
    request.setAttribute("reportcopReviewList", crlist);
    return "admin/ManageReport";
  }

  // 신고사항 처리하기
@RequestMapping(value = "/admin/ManageReport", method = RequestMethod.POST)
public String reportPostUpdate(HttpServletRequest request) throws ServletException, IOException{
  String p_result = request.getParameter("reportp_result");
  String p_num = request.getParameter("reportp_num");
  Map<String, String> resultP = new HashMap<>();
  resultP.put("reportp_result", p_result);
  resultP.put("reportp_num", p_num);
  System.out.println(resultP);
  if(p_result!=null) {
    int turn = reportDAOImpl.updateReportP(resultP);
    if(turn ==0) {
      return "fail";
    }
  }
  String pr_result = request.getParameter("reportpr_result");
  String pr_num = request.getParameter("reportpr_num");
  Map<String, String> resultPr = new HashMap<>();
  resultPr.put("reportpr_result", pr_result);
  resultPr.put("reportpr_num", pr_num);
  System.out.println("resultPr : "+resultPr);
  if(pr_result!=null) {
    int turn = reportDAOImpl.updateReportPr(resultPr);
    if(turn ==0) {
      return "fail";
    }
  }
  String cr_result = request.getParameter("reportcr_result");
  String cr_num = request.getParameter("reportcr_num");
  Map<String, String> resultCr = new HashMap<>();
  resultCr.put("reportcr_result", cr_result);
  resultCr.put("reportcr_num", cr_num);
  System.out.println("resultCr : "+resultCr);
  if(cr_result!=null) {
    int turn = reportDAOImpl.updateReportCr(resultCr);
    if(turn ==0) {
      return "fail";
    }
  }
  return "redirect:/admin/ManageReport";
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
