package com.douzone.blah.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.douzone.blah.dao.PostDAO;
import com.douzone.blah.dao.PostReviewDAO;
import com.douzone.blah.dao.User2DAO;
import com.douzone.blah.model.PostDTO;
import com.douzone.blah.model.PostReviewDTO;

@Controller
public class PostController {

  @Resource
  private PostDAO postDAOImpl;

  @Resource
  private PostReviewDAO postReviewDAOImpl;

  @Resource
  private User2DAO user2DAOImpl;

  // 게시글 목록
  @RequestMapping("/board")
  public String list(HttpServletRequest request, PostDTO dto) {

    String result = request.getParameter("category");
    System.out.println(result);


    int pg = 1;
    String strPg = request.getParameter("pg");

    if (strPg != null) {
      pg = Integer.parseInt(strPg);
    }
    int rowSize = 10;
    int start = (pg * rowSize) - (rowSize - 1);
    int end = pg * rowSize;

    int total = postDAOImpl.getPostCount(); // 총 게시물수
    System.out.println("시작 : " + start + " 끝:" + end);
    System.out.println("글의 수 : " + total);

    int allPage = (int) Math.ceil(total / (double) rowSize); // 페이지수
    // int totalPage = total/rowSize + (total%rowSize==0?0:1);
    System.out.println("페이지수 : " + allPage);

    int block = 10; // 한페이지에 보여줄 범위 << [1] [2] [3] [4] [5] [6] [7] [8] [9] [10] >>
    int fromPage = ((pg - 1) / block * block) + 1; // 보여줄 페이지의 시작
    // ((1-1)/10*10)
    int toPage = ((pg - 1) / block * block) + block; // 보여줄 페이지의 끝
    if (toPage > allPage) { // 예) 20>17
      toPage = allPage;
    }

    if (result == null) {
      String category1 = "블라블라";
      String category2 = "주식투자";
      String category3 = "썸,연애";
      String category4 = "회사생활";
      String category5 = "이직,커리어";
      String category6 = "결혼,육아";
      String category7 = "홍보";
      String category8 = "취미생활";
      String category9 = "우리회사 채용해요";

      List<PostDTO> list1 = postDAOImpl.getPostList1(category1);
      List<Integer> ali1 = new ArrayList<Integer>();
      for (int i = 0; i < list1.size(); i++) {
        ali1.add(postDAOImpl.getPostReviewCount(list1.get(i).getPost_num()));
      }
      List<String> idList1 = new ArrayList<String>();
      for (int i = 0; i < list1.size(); i++) {
        idList1.add(postDAOImpl.getUserID(list1.get(i).getPost_usernum()));
      }
      List<PostDTO> list2 = postDAOImpl.getPostList1(category2);
      List<Integer> ali2 = new ArrayList<Integer>();
      for (int i = 0; i < list2.size(); i++) {
        ali2.add(postDAOImpl.getPostReviewCount(list2.get(i).getPost_num()));
      }
      List<String> idList2 = new ArrayList<String>();
      for (int i = 0; i < list2.size(); i++) {
        idList2.add(postDAOImpl.getUserID(list2.get(i).getPost_usernum()));
      }

      List<PostDTO> list3 = postDAOImpl.getPostList1(category3);
      List<Integer> ali3 = new ArrayList<Integer>();
      for (int i = 0; i < list3.size(); i++) {
        ali3.add(postDAOImpl.getPostReviewCount(list3.get(i).getPost_num()));
      }
      List<String> idList3 = new ArrayList<String>();
      for (int i = 0; i < list3.size(); i++) {
        idList3.add(postDAOImpl.getUserID(list3.get(i).getPost_usernum()));
      }

      List<PostDTO> list4 = postDAOImpl.getPostList1(category4);
      List<Integer> ali4 = new ArrayList<Integer>();
      for (int i = 0; i < list4.size(); i++) {
        ali4.add(postDAOImpl.getPostReviewCount(list4.get(i).getPost_num()));
      }
      List<String> idList4 = new ArrayList<String>();
      for (int i = 0; i < list4.size(); i++) {
        idList4.add(postDAOImpl.getUserID(list4.get(i).getPost_usernum()));
      }

      List<PostDTO> list5 = postDAOImpl.getPostList1(category5);
      List<Integer> ali5 = new ArrayList<Integer>();
      for (int i = 0; i < list5.size(); i++) {
        ali5.add(postDAOImpl.getPostReviewCount(list5.get(i).getPost_num()));
      }
      List<String> idList5 = new ArrayList<String>();
      for (int i = 0; i < list5.size(); i++) {
        idList5.add(postDAOImpl.getUserID(list5.get(i).getPost_usernum()));
      }

      List<PostDTO> list6 = postDAOImpl.getPostList1(category6);
      List<Integer> ali6 = new ArrayList<Integer>();
      for (int i = 0; i < list6.size(); i++) {
        ali6.add(postDAOImpl.getPostReviewCount(list6.get(i).getPost_num()));
      }
      List<String> idList6 = new ArrayList<String>();
      for (int i = 0; i < list6.size(); i++) {
        idList6.add(postDAOImpl.getUserID(list6.get(i).getPost_usernum()));
      }

      List<PostDTO> list7 = postDAOImpl.getPostList1(category7);
      List<Integer> ali7 = new ArrayList<Integer>();
      for (int i = 0; i < list7.size(); i++) {
        ali7.add(postDAOImpl.getPostReviewCount(list7.get(i).getPost_num()));
      }
      List<String> idList7 = new ArrayList<String>();
      for (int i = 0; i < list7.size(); i++) {
        idList7.add(postDAOImpl.getUserID(list7.get(i).getPost_usernum()));
      }

      List<PostDTO> list8 = postDAOImpl.getPostList1(category8);
      List<Integer> ali8 = new ArrayList<Integer>();
      for (int i = 0; i < list8.size(); i++) {
        ali8.add(postDAOImpl.getPostReviewCount(list8.get(i).getPost_num()));
      }
      List<String> idList8 = new ArrayList<String>();
      for (int i = 0; i < list8.size(); i++) {
        idList8.add(postDAOImpl.getUserID(list8.get(i).getPost_usernum()));
      }

      List<PostDTO> list9 = postDAOImpl.getPostList1(category9);
      List<Integer> ali9 = new ArrayList<Integer>();
      for (int i = 0; i < list9.size(); i++) {
        ali9.add(postDAOImpl.getPostReviewCount(list9.get(i).getPost_num()));
      }
      List<String> idList9 = new ArrayList<String>();
      for (int i = 0; i < list9.size(); i++) {
        idList9.add(postDAOImpl.getUserID(list9.get(i).getPost_usernum()));
      }



      request.setAttribute("list1", list1);
      request.setAttribute("postrivew_count1", ali1);
      request.setAttribute("postid1", idList1);
      request.setAttribute("list2", list2);
      request.setAttribute("postrivew_count2", ali2);
      request.setAttribute("postid2", idList2);
      request.setAttribute("list3", list3);
      request.setAttribute("postrivew_count3", ali3);
      request.setAttribute("postid3", idList3);
      request.setAttribute("list4", list4);
      request.setAttribute("postrivew_count4", ali4);
      request.setAttribute("postid4", idList4);
      request.setAttribute("list5", list5);
      request.setAttribute("postrivew_count5", ali5);
      request.setAttribute("postid5", idList5);
      request.setAttribute("list6", list6);
      request.setAttribute("postrivew_count6", ali6);
      request.setAttribute("postid6", idList6);
      request.setAttribute("list7", list7);
      request.setAttribute("postrivew_count7", ali7);
      request.setAttribute("postid7", idList7);
      request.setAttribute("list8", list8);
      request.setAttribute("postrivew_count8", ali8);
      request.setAttribute("postid8", idList8);
      request.setAttribute("list9", list9);
      request.setAttribute("postrivew_count9", ali9);
      request.setAttribute("postid9", idList9);
      request.setAttribute("pg", pg);

      return "board/post";

    } else {
      pg = 1;
      strPg = request.getParameter("pg");

      if (strPg != null) {
        pg = Integer.parseInt(strPg);
      }
      rowSize = 10;
      start = (pg * rowSize) - (rowSize - 1);
      end = pg * rowSize;

      total = postDAOImpl.getPostCountCategory(result); // 카테고리 게시물수

      allPage = (int) Math.ceil(total / (double) rowSize); // 페이지수

      block = 10;
      fromPage = ((pg - 1) / block * block) + 1;
      toPage = ((pg - 1) / block * block) + block;
      if (toPage > allPage) {
        toPage = allPage;
      }

      HashMap map = new HashMap();
      map.put("start", start);
      map.put("end", end);
      map.put("post_category", result);

      List<PostDTO> list = postDAOImpl.getPostList(map);
      List<Integer> ali = new ArrayList<Integer>();
      for (int i = 0; i < list.size(); i++) {
        ali.add(postDAOImpl.getPostReviewCount(list.get(i).getPost_num()));
      }
      List<String> idList = new ArrayList<String>();
      for (int i = 0; i < list.size(); i++) {
        idList.add(postDAOImpl.getUserID(list.get(i).getPost_usernum()));
      }
      request.setAttribute("postrivew_count", ali);
      System.out.println(idList);
      request.setAttribute("postid", idList);
      request.setAttribute("list", list);
      request.setAttribute("pg", pg);
      request.setAttribute("allPage", allPage);
      request.setAttribute("block", block);
      request.setAttribute("fromPage", fromPage);
      request.setAttribute("toPage", toPage);
      request.setAttribute("category", result);

      return "board/board";

    }
  }

  // 게시글 쓰기
  @RequestMapping("/writeform")
  public String writeform(HttpServletRequest request, Principal principal) {
    String user = principal.getName();
    String user_num = user2DAOImpl.getUserNum(user); // id -> num변환
    System.out.println(user_num + "입니다");

    request.setAttribute("user_num", user_num);
    return "board/writeform";
  }

  @RequestMapping("/write")
  public String write(HttpServletRequest request, PostDTO dto) {
    String userid = request.getParameter("writer");
    postDAOImpl.insertPost(dto);
    return "redirect:/board";
  }

  // 게시글 하나 읽기
  @RequestMapping("/readform")
  public String read(HttpServletRequest request, int post_num, Model model, int pg) {

    postDAOImpl.updateHit(post_num);
    // int postreview_postnum = request.getParameterValues(postreview_postnum);
    // postDAOImpl.updateReviewCount(postreview_postnum);

    String user_id = user2DAOImpl.getUserID(post_num);
    System.out.println(user_id + "입니다");
    request.setAttribute("user_id", user_id);

    PostDTO dto = postDAOImpl.getPost(post_num);
    model.addAttribute("b", dto);
    model.addAttribute("pg", pg);

    List<PostReviewDTO> reviewList = postReviewDAOImpl.getPostReview(post_num);
    List<String> reviewListId = new ArrayList<String>();
    for(int i=0; i<reviewList.size();i++) {
      reviewListId.add(user2DAOImpl.getUserID(reviewList.get(i).getPostreview_num()));
    }
    model.addAttribute("reviewListId", reviewListId);
    model.addAttribute("reviewList", reviewList);
    int reviewnum = postDAOImpl.getPostReviewCount(Integer.toString(post_num));
    model.addAttribute("review_num", reviewnum);
    /*
     * int review_num = postReviewDAOImpl.getReviewNum(post_num); String review_id =
     * postReviewDAOImpl.getReviewId(post_num);
     */

    return "board/readform";
  }

  // 게시글 삭제
  @RequestMapping("/delete")
  public String delete(PostDTO dto, int pg) {
    int result = postDAOImpl.deletePost(dto);
    String res = "redirect:/board?pg=" + pg;
    if (result == 0) {
      res = "fail";
    }
    return "history";
  }

  // 게시글 수정
  @RequestMapping("/updateform")
  public String updateform(int post_num, Model model, int pg, Principal principal) {
    PostDTO dto = postDAOImpl.getPost(post_num);

    String user = principal.getName();
    String user_num = user2DAOImpl.getUserNum(user);

    model.addAttribute("user_num", user_num);
    model.addAttribute("b", dto);
    model.addAttribute("pg", pg);
    System.out.println(principal.getName());
    return "board/updateform";
  }

  @RequestMapping("/update")
  public String update(PostDTO dto, int pg, int post_num) {
    System.out.println("업데이트 직전까지 왔음!!");
    int result = postDAOImpl.updatePost(dto);
    String res = "redirect:/readform?post_num=" + post_num + "&pg=" + pg;
    System.out.println(result);
    return res;
  }

  // 댓글 작성
  @RequestMapping("/review")
  public String insertPostReview(HttpServletRequest request, PostReviewDTO dto, int post_num,
      int pg) {
    String writer = request.getParameter("writer");
    System.out.println(writer + "가 작성한 댓글입니다");

    String postreview_postnum = request.getParameter("postreview_postnum");
    String postreview_content = request.getParameter("postreview_content");
    String postreview_usernum = user2DAOImpl.getUserNum(writer);
    System.out.println(writer + "에 해당하는 user_num은" + postreview_usernum + "입니다");

    HashMap map = new HashMap();
    map.put("postreview_usernum", postreview_usernum);
    map.put("postreview_content", postreview_content);
    map.put("postreview_postnum", postreview_postnum);

    postReviewDAOImpl.insertPostReview(map);

    return "redirect:/readform?post_num=" + post_num + "&pg=" + pg;
  }

  @RequestMapping("/search")
  public String search(HttpServletRequest request, int pg) {
    String column = request.getParameter("column");
    String keyvalue = request.getParameter("keyvalue");

    Map<String, String> map = new HashMap<>(); // collection
    map.put("column", column); // column : title or writer or contnet
    map.put("keyvalue", keyvalue);
    System.out.println("column :" + column);
    System.out.println("keyvalue :" + keyvalue);

    List<Map<String, Object>> list = postDAOImpl.getSearchList2(map);


    request.setAttribute("list", list);
    request.setAttribute("pg", pg);


    return "board/searchlist";
  }

}
