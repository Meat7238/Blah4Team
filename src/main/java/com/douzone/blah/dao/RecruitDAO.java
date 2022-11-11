package com.douzone.blah.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface RecruitDAO {
	public List<Map<String, Object>> selectRecruit(String corp_name);

//공고 조회하기
	public List getRecruitList(HashMap map);

}

