package com.teamwork.service;

import com.teamwork.pojo.Message;
import com.teamwork.pojo.User;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface MessageService {

    //获取发送给我的信息
    public List<Message> getMy(String login_name);

    //获取发送给我的信息
    public boolean read(int id);

    public boolean send(Message message);

    public String dealWth(int type, int id, String send_name, Long team_id, HttpSession session);

    public String refuse(int type, int id, String send_name,String receive_name);

    public boolean deleteById(int id);
    public String invite(String receive_name, HttpSession session);

    public String join(Long team_id, String create_by, HttpSession session);

    public void remove(String login_name,HttpSession session);

    public void exit(String create_by,HttpSession session);

    public void dissolve(Long team_id,HttpSession session);

}
