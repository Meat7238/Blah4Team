package com.douzone.blah.security.domain;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class UserDetailsVO implements UserDetails {

	private static final long serialVersionUID = 1L;

	private String user_id; // ID
	private String user_password; // PW
	private String user_nick; 
	private String user_email;
	private String user_jobgroup;
	private String user_workspace;
	private String authority;
	

	private List<GrantedAuthority> authorities;

	
	public void setUser_id(String user_id) {this.user_id = user_id;	}
	public void setUser_password(String user_password) {this.user_password = user_password;	}
	public void setUser_nick(String user_nick) {this.user_nick = user_nick;}
	public void setUser_email(String user_email) {this.user_email = user_email;}
	public void setUser_jobgroup(String user_jobgroup) {this.user_jobgroup = user_jobgroup;}
	public void setUser_workspace(String user_workspace) {this.user_workspace = user_workspace;}
	public void setAuthority(String authority) {
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		authorities.add(new SimpleGrantedAuthority(authority));
		this.authorities = authorities; 
	}
	public String getUser_id() {return user_id;	}
	public String getUser_password() {return user_password;	}
	public String getUser_nick() {return user_nick;}
	public String getUser_email() {return user_email;}
	public String getUser_jobgroup() {return user_jobgroup;}
	public String getUser_workspace() {return user_workspace;}
	public String getAuthority() {return authority;	}
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {return authorities;}

	@Override
	public String getPassword() {return user_password;}

	@Override
	public String getUsername() {return user_id;}

	@Override
	public boolean isAccountNonExpired() {return true;}

	@Override
	public boolean isAccountNonLocked() {return true;}

	@Override
	public boolean isCredentialsNonExpired() {return true;}

	@Override
	public boolean isEnabled() {return true;}



}
