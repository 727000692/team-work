package com.teamwork.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Component
public class Message {

    private int id;
    private String message_type;
    private int type;
    private String send_name;
    private String receive_name;
    private String tag;
    private String content;
    private String create_time;
    private Long team_id;
    private String team_name;


}
