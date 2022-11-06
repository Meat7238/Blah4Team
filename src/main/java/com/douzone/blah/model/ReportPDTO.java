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
