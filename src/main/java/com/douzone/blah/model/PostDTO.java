package com.douzone.blah.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PostDTO {
	private String post_num;
	private String post_boardnum;
	private String post_title;
	private String post_category;
	private String post_content;
	private String post_usernum;
	private String post_like;
	private String post_regdate;
	private int post_readcount;	
}
