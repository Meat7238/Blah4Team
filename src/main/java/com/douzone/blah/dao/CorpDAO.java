package com.douzone.blah.dao;

import java.util.List;
import java.util.Map;

import com.douzone.blah.model.CorpDTO;
import com.douzone.blah.model.CorpreviewDTO;

public interface CorpDAO {

	//public List<CorpDTO> getCorpList(HashMap map); // 기업 전체 읽기
	
	public List<CorpDTO> searchCorp(String corp_num); //기업조회
	
	public CorpDTO corpDetail(String corp_num); //기업 상세 확인
	
//	public CorpreviewDTO corpReview(String corpreviewnum); //기업 리뷰 확인
	public List<Map<String, Object>> corpReview(String corpreviewnum); //기업 리뷰 확인
	
	public void insertReview(CorpreviewDTO dto); //기업 리뷰 쓰기
}