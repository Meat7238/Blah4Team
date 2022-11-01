package com.douzon.blah.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CorpDTO {

	private String corp_num;
	private String corp_name;
	private String corp_addr;
	private String corp_category;
	private String corp_madedate;
	private String corp_emplcount;
	private String corp_locate;
	private String corp_pay;
	private String corp_detail;
}
