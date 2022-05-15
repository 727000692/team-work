package com.teamwork.dao;

import com.teamwork.pojo.Message;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MessageMapper {
    //获取发送给我的信息
    public List<Message> getMy(String login_name);

    public int read(int id);

    public int send(Message message);

    public int deleteById(int id);

}
