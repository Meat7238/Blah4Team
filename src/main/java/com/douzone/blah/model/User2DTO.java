package com.douzone.blah.model;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Data;

@Data
public class User2DTO extends User {

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
	
	public User2DTO(String username, String password, 
			boolean enabled, boolean accountNonExpired,
			boolean credentialsNonExpired, 
			boolean accountNonLocked, 
			Collection<? extends GrantedAuthority> authorities,
			String user_id) {
		super(username, password, enabled, accountNonExpired
				, credentialsNonExpired, accountNonLocked
				, authorities);
		this.user_id = user_id;
	}
	
	@Override
	public String toString() {
		return "User2DTO [user_id=" + user_id + "]";
	}

	public User2DTO(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}
	
	
	
	
}
