package com.douzone.blah.model;


import java.util.Date;
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
	private Date user_enddate;
	private Date user_jobgroup;
	private String user_workspace;
	private String enabled;
	private String authority;

}
