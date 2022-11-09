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
    int pg1 = 1, pg2 = 1, pg3 = 1;
    String strPg1 = request.getParameter("pg1");
    String strPg2 = request.getParameter("pg2");
    String strPg3 = request.getParameter("pg3");
    if (strPg1 != null) {
      pg1 = Integer.parseInt(strPg1);
    }
    if (strPg2 != null) {
      pg2 = Integer.parseInt(strPg2);
    }
    if (strPg3 != null) {
      pg3 = Integer.parseInt(strPg3);
    }
    int rowSize1 = 10, rowSize2 = 10, rowSize3 = 10;
    int start1 = (pg1 * rowSize1) - (rowSize1 - 1);
    int end1 = pg1 * rowSize1;
    int start2 = (pg2 * rowSize2) - (rowSize2 - 1);
    int end2 = pg2 * rowSize2;
    int start3 = (pg3 * rowSize3) - (rowSize3 - 1);
    int end3 = pg3 * rowSize3;

    int total1 = reportDAOImpl.getReportPCount(); // 총 게시물수
    int total2 = reportDAOImpl.getReportPrCount(); // 총 게시물수
    int total3 = reportDAOImpl.getReportCrCount(); // 총 게시물수

    int allPage1 = (int) Math.ceil(total1 / (double) rowSize1); // 페이지수
    int allPage2 = (int) Math.ceil(total2 / (double) rowSize2); // 페이지수
    int allPage3 = (int) Math.ceil(total3 / (double) rowSize3); // 페이지수

    int block1 = 5, block2 = 5, block3 = 5;
    int fromPage1 = ((pg1 - 1) / block1 * block1) + 1; // 보여줄 페이지의 시작
    int fromPage2 = ((pg2 - 1) / block2 * block2) + 1; // 보여줄 페이지의 시작
    int fromPage3 = ((pg3 - 1) / block3 * block3) + 1; // 보여줄 페이지의 시작
    int toPage1 = ((pg1 - 1) / block1 * block1) + block1; // 보여줄 페이지의 끝
    int toPage2 = ((pg2 - 1) / block2 * block2) + block2; // 보여줄 페이지의 끝
    int toPage3 = ((pg3 - 1) / block3 * block3) + block3; // 보여줄 페이지의 끝
    if (toPage1 > allPage1) {
      toPage1 = allPage1;
    }
    if (toPage2 > allPage2) {
      toPage2 = allPage2;
    }
    if (toPage3 > allPage3) {
      toPage3 = allPage3;
    }
    HashMap map1 = new HashMap();
    map1.put("start1", start1);
    map1.put("end1", end1);
    List<ReportPDTO> plist = reportDAOImpl.getReportP(map1);
    request.setAttribute("reportPostList", plist);
    request.setAttribute("pg1", pg1);
    request.setAttribute("allPage1", allPage1);
    request.setAttribute("block1", block1);
    request.setAttribute("fromPage1", fromPage1);
    request.setAttribute("toPage1", toPage1);
    // System.out.println(plist);

    HashMap map2 = new HashMap();
    map2.put("start2", start2);
    map2.put("end2", end2);

    List<ReportPrDTO> prlist = reportDAOImpl.getReportPr(map2);
    request.setAttribute("reportPostReviewList", prlist);
    request.setAttribute("pg2", pg2);
    request.setAttribute("allPage2", allPage2);
    request.setAttribute("block2", block2);
    request.setAttribute("fromPage2", fromPage2);
    request.setAttribute("toPage2", toPage2);
    // System.out.println(prlist);

    HashMap map3 = new HashMap();
    map3.put("start3", start3);
    map3.put("end3", end3);

    List<ReportCrDTO> crlist = reportDAOImpl.getReportCr(map3);
    request.setAttribute("reportcopReviewList", crlist);
    request.setAttribute("pg3", pg3);
    request.setAttribute("allPage3", allPage3);
    request.setAttribute("block3", block3);
    request.setAttribute("fromPage3", fromPage3);
    request.setAttribute("toPage3", toPage3);
    return "admin/ManageReport";
  }

  // 신고사항 처리하기
  @RequestMapping(value = "/admin/ManageReport", method = RequestMethod.POST)
  public String reportPostUpdate(HttpServletRequest request) throws ServletException, IOException {
    String p_result = request.getParameter("reportp_result");
    String p_num = request.getParameter("reportp_num");
    String admin_id = request.getParameter("admin_id");
    System.out.println(admin_id);
    Map<String, String> resultP = new HashMap<>();
    resultP.put("reportp_result", p_result);
    resultP.put("reportp_num", p_num);
    resultP.put("admin_id", admin_id);

    System.out.println(resultP);
    if (p_result != null) {
      int turn = reportDAOImpl.updateReportP(resultP);
      if (turn == 0) {
        return "fail";
      }
    }
    String pr_result = request.getParameter("reportpr_result");
    String pr_num = request.getParameter("reportpr_num");
    Map<String, String> resultPr = new HashMap<>();
    resultPr.put("reportpr_result", pr_result);
    resultPr.put("reportpr_num", pr_num);
    resultPr.put("admin_id", admin_id);
    System.out.println("resultPr : " + resultPr);
    if (pr_result != null) {
      int turn = reportDAOImpl.updateReportPr(resultPr);
      if (turn == 0) {
        return "fail";
      }
    }
    String cr_result = request.getParameter("reportcr_result");
    String cr_num = request.getParameter("reportcr_num");
    Map<String, String> resultCr = new HashMap<>();
    resultCr.put("reportcr_result", cr_result);
    resultCr.put("reportcr_num", cr_num);
    resultCr.put("admin_id", admin_id);
    System.out.println("resultCr : " + resultCr);
    if (cr_result != null) {
      int turn = reportDAOImpl.updateReportCr(resultCr);
      if (turn == 0) {
        return "fail";
      }
    }
    return "redirect:/admin/ManageReport";
  }
}
