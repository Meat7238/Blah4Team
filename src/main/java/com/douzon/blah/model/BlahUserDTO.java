package com.douzon.blah.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BlahUserDTO {
    private int user_num;
    private String user_id;
    private String user_password;
    private String user_nick;
    private String user_email;
    private int user_point;

    public BlahUserDTO(String user_id, String user_password, String user_nick, String user_email) {
        this.user_id = user_id;
        this.user_password = user_password;
        this.user_nick = user_nick;
        this.user_email = user_email;
    }
}
