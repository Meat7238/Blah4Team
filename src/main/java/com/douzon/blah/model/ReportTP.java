package com.douzon.blah.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReportTP {
	private String reporttp_num;
	private String reporttp_corpreviewnum;
	private String reporttp_usernum;
	private String reporttp_content;
	private String reporttp_result;
	private String reporttp_adminnum;
	private String reporttp_regdate;
	private String reporttp_type;
}
