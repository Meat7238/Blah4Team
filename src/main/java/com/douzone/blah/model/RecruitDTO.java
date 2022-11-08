package com.douzone.blah.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RecruitDTO {
	private String recruit_num;
	private String recruit_corpnum;
	private String recruit_adminnum;
	private Date recruit_startdate;
	private Date recruit_enddate;
	private String recruit_jobgroup;
	private String recruit_career;
	private int recruit_readcount;
}
