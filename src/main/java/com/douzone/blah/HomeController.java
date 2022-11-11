package com.douzone.blah;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.douzone.blah.dao.PostDAO;
import com.douzone.blah.model.PostDTO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

  @Resource
  private PostDAO postDAOImpl;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest request, Model model) {
//	  System.out.println("Principal : " + principal.getName());
	  int pg=1;
      String strPg = request.getParameter("pg");

      if(strPg!=null){
          pg = Integer.parseInt(strPg);
      }
      int rowSize = 10;
      int start = (pg*rowSize)-(rowSize -1);
      int end = pg*rowSize;

      int total = postDAOImpl.getPostCount(); //총 게시물수

      int allPage = (int) Math.ceil(total/(double)rowSize); //페이지수
      //int totalPage = total/rowSize + (total%rowSize==0?0:1);

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

      List<PostDTO> list = postDAOImpl.getPostListAll(map);
      request.setAttribute("list", list);
      request.setAttribute("pg",pg);
      request.setAttribute("allPage",allPage);
      request.setAttribute("block",block);
      request.setAttribute("fromPage",fromPage);
      request.setAttribute("toPage",toPage);


		return "home";
	}

	@RequestMapping(value = "/home", method = RequestMethod.POST)
	public String home(HttpServletRequest request ) {
//      String column = request.getParameter("column");
      String keyvalue = request.getParameter("keyvalue");

      Map<String, String> map = new HashMap<>(); // collection
      map.put("column", "post_title"); // column : title or writer or contnet
      map.put("keyvalue", keyvalue);

      List<PostDTO> list = postDAOImpl.getSearchList(map);
      System.out.println(list);
      request.setAttribute("list", list);
		return "home";
	}
	@RequestMapping("home/stipulation")
	public String stipulation(HttpServletRequest request) {
	  return "info/stipulation";
	}
}
