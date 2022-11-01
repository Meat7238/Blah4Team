package com.douzon.blah.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReviewpayDTO {

	private String reviewpay_num;
	private String reviewpay_corpreviewnum;
	private String reviewpay_usernum;
	private String reviewpay_point;
}
