package com.douzone.blah.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReportPDTO {
	private String reportp_num;
	private String reportp_postnum;
	private String reportp_usernum;
	private String reportp_content;
	private String reportp_result;
	private String reportp_adminnum;
	private String reportp_regdate;
	private String reportp_type;
}

//REPORTP_NUM varchar2(30) CONSTRAINT REPORTP_NUM_pk PRIMARY key,
//REPORTP_POSTNUM NUMBER CONSTRAINT REPORTP_POSTNUM_fk REFERENCES POST(POST_NUM) ON DELETE CASCADE,
//REPORTP_USERNUM varchar2(30) CONSTRAINT REPORTP_USERNUM_fk REFERENCES USER2(USER_NUM) ON DELETE CASCADE,
//REPORTP_CONTENT varchar2(2000),
//REPORTP_RESULT varchar2(20),
//REPORTP_ADMINNUM varchar2(20),
//REPORTP_REGDATE DATE,
//REPORTP_TYPE varchar2(20)