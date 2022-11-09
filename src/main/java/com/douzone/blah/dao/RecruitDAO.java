package com.douzone.blah.dao;

import java.util.List;
import java.util.Map;

public interface RecruitDAO {
	public List<Map<String, Object>> selectRecruit(String corp_name);
}
