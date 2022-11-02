package com.douzone.blah.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class NoticeDTO {

	private String notice_num;
	private String notice_title;
	private String notice_category;
	private String notice_content;
	private String notice_adminnum;
	private String notice_regdate;
	private String notice_readcount;
}
