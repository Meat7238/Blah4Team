package com.douzone.blah.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PayListDTO {

	private String paylist_num;
	private String paylist_usernum;
	private String paylist_setnum;
}
