package com.douzone.blah.controller;

import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.douzone.blah.dao.RecruitDAO;
import com.douzone.blah.model.RecruitDTO;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class RecruitController {

	@Resource
	private RecruitDAO recruitDAO;

	// 검색 전 매핑
	@GetMapping("/recruitMain")
	public String RecruitPage() {
		return "/recruit/recruit";
	}

	// 검색 처리
	@GetMapping("/recruitSelect")
	public String searchRecruit(@RequestParam("corp_name") String corp_name, HttpServletRequest request, HttpServletResponse response) throws ParseException {

		log.warn("여기에 온 copr_name ====> " + corp_name);
		List<Map<String, Object>> recruitInfo = recruitDAO.selectRecruit(corp_name);
		recruitInfo.forEach(x -> log.warn("이거 타나"+x));

		recruitInfo.get(0).get("CORP_NAME").toString();


		if (recruitInfo == null) {
			return null;
		} else {
			request.setAttribute("list", recruitInfo);
			System.out.println("========돌아요");
		}
		return "/recruit/recruit";
	}

	//공고 조회
	  @RequestMapping(value = "admin/recruit", method = RequestMethod.GET)
	  public String Recruit(HttpServletRequest request) {
	    HashMap map = new HashMap();
	    List<RecruitDTO> list = recruitDAO.getRecruitList(map);
	    System.out.println(list);
	    request.setAttribute("recruitlist", list);
	    return "admin/Recruit";
	  }
//	  @RequestMapping(value = "admin/writeform", method = RequestMethod.POST)
//	  public String writeform(NoticeDTO dto) {
//	    System.out.println(dto);
////	    noticeDAOImpl.insertNotice(dto);
//	    return "redirect:notice";
//	  }
}

//
//  for (Map<String, Object> map : recruitInfo) {
//  recruitDTO.setRecruit_adminnum(map.get("RECRUIT_ADMINNUM").toString());
//  recruitDTO.setRecruit_num(map.get("RECRUIT_NUM").toString());
//  corpDTO.setCorp_name(map.get("CORP_NAME").toString());
//  recruitDTO.setRecruit_corpnum(map.get("RECRUIT_CORPNUM").toString());
//  recruitDTO.setRecruit_startdate(formatter.parse(map.get("RECRUIT_STARTDATE").
//  toString()));
//  recruitDTO.setRecruit_enddate(formatter.parse(map.get("RECRUIT_ENDDATE").
//  toString()));
//  recruitDTO.setRecruit_jobgroup(map.get("RECRUIT_JOBGROUP").toString());
//  recruitDTO.setRecruit_readcount(Integer.parseInt(map.get("RECRUIT_READCOUNT")
//  .toString())); }
//