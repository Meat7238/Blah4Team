package com.douzone.blah.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User2DTO {

	private String user_num;
	private String user_id;
	private String user_password;
	private String user_nick;
	private String user_point;
	private String user_email;
	private String user_startdate;
	private String user_enddate;
	private String user_jobgroup;
	private String user_workspace;
}