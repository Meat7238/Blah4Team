package com.douzon.blah.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Admin2DTO {

	private String admin_num;
	private String admin_id;
	private String admin_password;
	private String admin_name;
	private String admin_email;
}
