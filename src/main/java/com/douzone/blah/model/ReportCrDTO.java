package com.douzone.blah.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReportCrDTO {
	private String reportcr_num;
	private String reportcr_corpreviewnum;
	private String reportcr_usernum;
	private String reportcr_content;
	private String reportcr_result;
	private String reportcr_regdate;
	private String reportcr_type;
}
