package com.douzone.blah.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PostReviewDTO {
	private int postreview_num;
	private String postreview_usernum;
	private int postreview_postnum;
	private String postreview_content;
	private int postreview_like;
	private String postreview_regdate;

}
