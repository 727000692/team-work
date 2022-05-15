package com.teamwork.service.Impl;

import com.teamwork.dao.MessageMapper;
import com.teamwork.dao.TaskMapper;
import com.teamwork.dao.TeamMapper;
import com.teamwork.dao.UserMapper;
import com.teamwork.pojo.Message;
import com.teamwork.pojo.Team;
import com.teamwork.pojo.User;
import com.teamwork.service.MessageService;
import com.teamwork.utils.GetTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class MessageServiceImpl implements MessageService {

    @Autowired
    private MessageMapper messageMapper;

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private TeamMapper teamMapper;





    @Override
    public List<Message> getMy(String login_name) {
        return messageMapper.getMy(login_name);
    }

    @Override
    public boolean read(int id) {
        int read = messageMapper.read(id);
        return read > 0;
    }

    @Override
    public boolean send(Message message) {
        int send = messageMapper.send(message);
        return send > 0;
    }

    @Override
    public String dealWth(int type, int id, String send_name, Long team_id, HttpSession session) {

        User user = (User) session.getAttribute("user");
        String login_name = user.getLogin_name();
        Message message = new Message();
        message.setCreate_time(GetTime.precise());
        message.setMessage_type("反馈信息");
        message.setSend_name(login_name);
        message.setReceive_name(send_name);

        if (type == 0) {
            //获取当前用户信息
            Long user_id = user.getUser_id();
            Long team_id1 = user.getTeam_id();
            //邀请你加入团队信息
            if (team_id1 == null) {
                //如果当前还没加入团队
                Team team = teamMapper.selectTeamByTeamId(team_id);
                if (userMapper.teamNum(team_id) < team.getTeam_num()) {
                    //如果这个团队人还没满，就加入
                    userMapper.updateTeam(user_id, team_id, "团队成员");
                    //更新当前用户信息
                    User user1 = userMapper.selectUserByUserId(user_id);
                    session.setAttribute("user", user1);

                    //回复一句xxx已同意加入你的团队！
                    message.setContent("用户" + login_name + "已同意加入你的团队！");

                    messageMapper.send(message);
                    //将消息设为已读
                    messageMapper.read(id);
                    //同意加入成功！
                    return "invite_1";
                } else {
                    //回复一句：你的团队人数已满，你邀请的xxx加入失败！
                    message.setContent("你的团队人数已满，你邀请的用户" + login_name + "加入失败！");
                    messageMapper.send(message);
                    //将消息设为已读
                    messageMapper.read(id);
                    //该团队人数已满，加入失败！
                    return "invite_-1";
                }
            } else {
                //回复一句xxx拒绝加入你的团队！
                message.setContent("用户" + login_name + "拒绝了你的邀请！");
                messageMapper.send(message);
                //将消息设为已读
                messageMapper.read(id);
                //你当前已在团队中，不可再加入！
                return "invite_-2";
            }

        } else if (type == 1) {
            //申请信息
            //看看申请加入自己团队的这个人有没有加入团队
            User send_user = userMapper.selectUserByName(send_name);
            Long user_id = send_user.getUser_id();
            Long team_id1 = send_user.getTeam_id();

            if (team_id1 == null) {
                //如果当前还没加入团队
                Team team = teamMapper.selectTeamByTeamId(team_id);
                if (userMapper.teamNum(team_id) < team.getTeam_num()) {
                    //如果这个团队人还没满，就加入
                    userMapper.updateTeam(user_id, team_id, "团队成员");
                    //回复一句
                    message.setContent("用户" + login_name + "已同意你加入他的团队！");

                    messageMapper.send(message);
                    //将消息设为已读
                    messageMapper.read(id);
                    //同意加入成功！
                    return "apply_1";

                } else {
                    //回复一句：你的团队人数已满，你邀请的xxx加入失败！
                    message.setContent("你申请加入的团队" + team_id + "人数已满，加入失败！");
                    messageMapper.send(message);
                    //将消息设为已读
                    messageMapper.read(id);
                    return "apply_-1";
                }

            } else {
                //回复一句xxx拒绝加入你的团队！
                message.setContent("你申请加入的团队" + team_id + "团队队长" + login_name + "拒绝了你的申请！");
                messageMapper.send(message);
                //将消息设为已读
                messageMapper.read(id);
                //你当前已在团队中，不可再加入！
                return "apply_-2";
            }
        }
        return "0";
    }

    @Override
    public String refuse(int type, int id, String send_name, String receive_name) {

        Message message = new Message();
        message.setCreate_time(GetTime.precise());
        message.setMessage_type("反馈信息");
        message.setSend_name(send_name);
        message.setReceive_name(receive_name);

        if (type == 0) {
            //回复一句xxx拒绝加入你的团队！
            message.setContent("用户" + send_name + "拒绝了你的邀请！");
            messageMapper.send(message);
            //将消息设为已读
            messageMapper.read(id);
            return "1";
        } else if (type == 1) {
            message.setContent("用户" + send_name + "拒绝了你申请加入他的团队！");
            messageMapper.send(message);
            //将消息设为已读
            messageMapper.read(id);
            return "1";
        }
        return "0";
    }

    @Override
    public boolean deleteById(int id) {
        int i = messageMapper.deleteById(id);
        return i > 0;
    }

    @Override
    public String invite(String receive_name, HttpSession session) {
        User user = (User) session.getAttribute("user");
        String login_name = user.getLogin_name();
        Long team_id = user.getTeam_id();
        String team_permission = user.getTeam_permission();
        if (team_id != null) {
            //有团队
            if ("团队队长".equals(team_permission)) {
                //如果是队长
                Team team = teamMapper.selectTeamByTeamId(team_id);
                if (userMapper.teamNum(team_id) < team.getTeam_num()) {
                    //如果这个团队人还没满
                    Message message = new Message();
                    message.setCreate_time(GetTime.precise());
                    message.setMessage_type("加入团队");
                    message.setType(0);
                    message.setSend_name(login_name);
                    message.setReceive_name(receive_name);
                    message.setTeam_id(team_id);
                    message.setContent("用户" + login_name + "邀请你加入他的团队！");
                    messageMapper.send(message);
                    return "1";
                } else {
                    return "-1";
                }

            } else {
                return "0";
            }


        }

        return "2";

    }

    @Override
    public String join(Long team_id, String create_by, HttpSession session) {
        User user = (User) session.getAttribute("user");
        String login_name = user.getLogin_name();
        Long team_id1 = user.getTeam_id();
        if (team_id1 == null) {
            //没有团队
            Message message = new Message();
            message.setCreate_time(GetTime.precise());
            message.setMessage_type("加入团队");
            message.setType(1);
            message.setSend_name(login_name);
            message.setReceive_name(create_by);
            message.setTeam_id(team_id);
            message.setContent("用户" + login_name + "申请加入你的团队！");
            messageMapper.send(message);
            return "1";
        }
        //你当前已在团队中，无法再次加入
        return "0";
    }

    @Override
    public void remove(String login_name, HttpSession session) {
        User user = (User) session.getAttribute("user");
        String login_name1 = user.getLogin_name();
        int i = userMapper.removeTeam(login_name);
        if (i>0){
            Message message = new Message();
            message.setCreate_time(GetTime.precise());
            message.setMessage_type("移除团队");
            message.setSend_name(login_name1);
            message.setReceive_name(login_name);
            message.setContent("团队队长" + login_name1 + "已将你移出团队！");
            messageMapper.send(message);
        }
    }

    @Override
    public void exit(String create_by, HttpSession session) {
        User user = (User) session.getAttribute("user");
        String login_name = user.getLogin_name();
        int i = userMapper.removeTeam(login_name);
        if (i>0){
            Message message = new Message();
            message.setCreate_time(GetTime.precise());
            message.setMessage_type("退出团队");
            message.setSend_name(login_name);
            message.setReceive_name(create_by);
            message.setContent("用户" + login_name + "已退出你的团队！");
            messageMapper.send(message);
            User user1 = userMapper.selectUserByName(login_name);
            session.setAttribute("user",user1);
        }

    }

    @Override
    public void dissolve(Long team_id, HttpSession session) {

        int i = teamMapper.deleteTeamByTeamId(team_id);
        if (i>0){
            User user = (User) session.getAttribute("user");
            String login_name = user.getLogin_name();

            Message message = new Message();
            message.setCreate_time(GetTime.precise());
            message.setMessage_type("团队解散");
            message.setSend_name(login_name);
            List<User> users = userMapper.selectUserByTeamId(team_id);
            for (User user1 : users) {
                String login_name1 = user1.getLogin_name();
                userMapper.removeTeam(login_name1);
                message.setReceive_name(login_name1);
                message.setContent("你所处的团队" + team_id + "已被队长"+login_name+"解散了!");
                messageMapper.send(message);
            }
            User user1 = userMapper.selectUserByName(login_name);
            session.setAttribute("user",user1);
        }

    }
}
