package com.douzon.blah.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PostReviewDTO {
	private String postreview_num;
	private String postreview_usernum;
	private String postreview_postnum;
	private String postreview_content;
	private String postreview_like;
	private String postreview_regdate;


}
