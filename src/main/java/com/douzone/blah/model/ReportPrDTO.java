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
    private String reportpr_adminnum;
    private String reportpr_regdate;
    private String reportpr_type;
}