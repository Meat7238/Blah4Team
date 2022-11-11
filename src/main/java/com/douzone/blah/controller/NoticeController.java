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

  // 공지사항 수정
  @RequestMapping(value = "/admin/noticeUpdate", method = RequestMethod.GET)
  public String noticeUpdate(int notice_num, Model model) {
    NoticeDTO dto = noticeDAOImpl.getNotice(notice_num);
    model.addAttribute("p", dto);
    return "admin/noticeUpdate";
  }

  @RequestMapping(value = "/admin/noticeUpdate", method = RequestMethod.POST)
  public String noticeUpdate(NoticeDTO dto) {

    System.out.println("update : " + dto);
    int result = noticeDAOImpl.updateNotice(dto);
    System.out.println("result : " + result);
    if (result == 0) {
      return "fail";
    }
    return "redirect:/admin/notice";
  }

  // 공지사항 추가
  @RequestMapping(value = "admin/writeform", method = RequestMethod.GET)
  public String writeform() {
    return "admin/writeform";
  }

  @RequestMapping(value = "admin/writeform", method = RequestMethod.POST)
  public String writeform(NoticeDTO dto) {
    System.out.println(dto);
    noticeDAOImpl.insertNotice(dto);
    return "redirect:notice";
  }



  // 클라이언트 공지사항 보기
  @RequestMapping("/notice")
  public String NoticeList(HttpServletRequest request) {
    int pg = 1;
    String strPg = request.getParameter("pg");

    if (strPg != null) {
      pg = Integer.parseInt(strPg);
    }
    int rowSize = 10;
    int start = (pg * rowSize) - (rowSize - 1);
    int end = pg * rowSize;

    int total = noticeDAOImpl.getNoticeCount(); //총 게시물수
    System.out.println("시작 : "+start +" 끝:"+end);
    System.out.println("글의 수 : "+total);


    int allPage = (int) Math.ceil(total/(double)rowSize); //페이지수
    //int totalPage = total/rowSize + (total%rowSize==0?0:1);
    System.out.println("페이지수 : "+ allPage);

    int block = 10; //한페이지에 보여줄  범위 << [1] [2] [3] [4] [5] [6] [7] [8] [9] [10] >>
    int fromPage = ((pg-1)/block*block)+1;  //보여줄 페이지의 시작
    //((1-1)/10*10)
    int toPage = ((pg-1)/block*block)+block; //보여줄 페이지의 끝
    if(toPage> allPage){ // 예) 20>17
        toPage = allPage;
    }

    HashMap map = new HashMap();
    map.put("start", start);
    map.put("end", end);
    List<NoticeDTO> list = noticeDAOImpl.getNoticeList(map);
    request.setAttribute("noticelist", list);
    request.setAttribute("pg",pg);
    request.setAttribute("allPage",allPage);
    request.setAttribute("block",block);
    request.setAttribute("fromPage",fromPage);
    request.setAttribute("toPage",toPage);
    return "notice";
  }

  // 클라이언트 공지사항 상세 보기
  @RequestMapping("/noticeDetail")
  public String NoticeDetail(int notice_num, Model model) {
    noticeDAOImpl.updateHit(notice_num);
    NoticeDTO dto = noticeDAOImpl.getNotice(notice_num);
    model.addAttribute("p", dto);
    return "noticeDetail";
  }

  // 관리자 공지사항 보기
  @RequestMapping("/admin/notice")
  public String editNoticeList(HttpServletRequest request) {

    int pg = 1;
    String strPg = request.getParameter("pg");

    if (strPg != null) {
      pg = Integer.parseInt(strPg);
    }
    int rowSize = 10;
    int start = (pg * rowSize) - (rowSize - 1);
    int end = pg * rowSize;

    int total = noticeDAOImpl.getNoticeCount(); //총 게시물수
    System.out.println("시작 : "+start +" 끝:"+end);
    System.out.println("글의 수 : "+total);


    int allPage = (int) Math.ceil(total/(double)rowSize); //페이지수
    //int totalPage = total/rowSize + (total%rowSize==0?0:1);
    System.out.println("페이지수 : "+ allPage);

    int block = 3; //한페이지에 보여줄  범위 << [1] [2] [3] [4] [5] [6] [7] [8] [9] [10] >>
    int fromPage = ((pg-1)/block*block)+1;  //보여줄 페이지의 시작
    //((1-1)/10*10)
    int toPage = ((pg-1)/block*block)+block; //보여줄 페이지의 끝
    if(toPage> allPage){ // 예) 20>17
        toPage = allPage;
    }

    HashMap map = new HashMap();
    map.put("start", start);
    map.put("end", end);

    List<NoticeDTO> list = noticeDAOImpl.getNoticeList(map);
    request.setAttribute("noticelist", list);
    request.setAttribute("pg",pg);
    request.setAttribute("allPage",allPage);
    request.setAttribute("block",block);
    request.setAttribute("fromPage",fromPage);
    request.setAttribute("toPage",toPage);
    return "admin/notice";

  }

  // 관리자 공지사항 상세 보기
  @RequestMapping("/admin/noticeDetail")
  public String editDetail(int notice_num, Model model) {
    noticeDAOImpl.updateHit(notice_num);
    NoticeDTO dto = noticeDAOImpl.getNotice(notice_num);
    model.addAttribute("p", dto);
    return "admin/noticeDetail";
  }

  // 공지사항 삭제
  @RequestMapping("/admin/notice/delete")
  public String delete(NoticeDTO dto) {
    int cnt = noticeDAOImpl.deleteNotice(dto);
    String res = "redirect:/admin/notice";
    if (cnt == 0) {
      res = "fail";
    }
    return res;
  }


}
