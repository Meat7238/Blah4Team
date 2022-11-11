package com.douzone.blah.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReportPrDTO {
    private String reportpr_num;
    private String reportpr_postreviewnum;
    private String reportpr_usernum;
    private String reportpr_content;
    private String reportpr_result;
    private String reportpr_regdate;
    private String reportpr_type;
}

//CREATE TABLE REPORTPR(
//REPORTPR_NUM varchar2(30) CONSTRAINT REPORTPR_NUM_pk PRIMARY key,
//REPORTPR_POSTREVIEWNUM NUMBER CONSTRAINT REPORTPR_POSTREVIEWNUM_fk REFERENCES POSTREVIEW(POSTREVIEW_NUM) ON DELETE CASCADE,
//REPORTPR_USERNUM varchar2(30) CONSTRAINT REPORTPR_USERNUM_fk REFERENCES USER2(USER_NUM) ON DELETE CASCADE,
//REPORTPR_CONTENT varchar2(2000),
//REPORTPR_RESULT varchar2(20),
//REPORTPR_ADMINNUM varchar2(20),
//REPORTPR_REGDATE DATE,
//REPORTPR_TYPE varchar2(20)
//);