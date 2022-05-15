package com.teamwork.controller;

import com.teamwork.pojo.Message;
import com.teamwork.pojo.Team;
import com.teamwork.pojo.User;
import com.teamwork.service.MessageService;
import com.teamwork.service.TeamService;
import com.teamwork.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping("/mess")
public class MessageController {

    @Autowired
    private MessageService messageService;

    @Autowired
    private UserService userService;

    @Autowired
    private TeamService teamService;

    @RequestMapping("/user_message")
    public String data(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        List<Message> messages = messageService.getMy(user.getLogin_name());
        model.addAttribute("messages",messages);
        return "message/user_message";
    }

    @RequestMapping(value = "/invite", method = RequestMethod.POST)
    @ResponseBody
    public String invite(@RequestParam("receive_name") String receive_name,
                         HttpSession session) throws IOException {
        return messageService.invite(receive_name,session);
    }

    @RequestMapping(value = "/join", method = RequestMethod.POST)
    @ResponseBody
    public String join(@RequestParam("team_id") Long team_id,
                       @RequestParam("create_by") String create_by,
                         HttpSession session) throws IOException {
        return messageService.join(team_id,create_by,session);
    }

    @RequestMapping(value = "/remove", method = RequestMethod.POST)
    @ResponseBody
    public void remove(@RequestParam("login_name") String login_name,
                       HttpSession session) {
        messageService.remove(login_name,session);
    }

    @RequestMapping(value = "/exit", method = RequestMethod.POST)
    @ResponseBody
    public void exit(@RequestParam("create_by") String create_by,
                       HttpSession session) {
        messageService.exit(create_by,session);
    }

    @RequestMapping(value = "/dissolve", method = RequestMethod.POST)
    @ResponseBody
    public void dissolve(@RequestParam("team_id") Long team_id,
                     HttpSession session) {
        messageService.dissolve(team_id,session);
    }

    @RequestMapping(value = "/deal_agree", method = RequestMethod.POST)
    @ResponseBody
    public String dealAgree(@RequestParam("id") int id,
                            @RequestParam("type") int type,
                            @RequestParam("send_name") String send_name,
                            @RequestParam("team_id") Long team_id,
                            HttpSession session
                            ) throws IOException {
        return messageService.dealWth(type, id, send_name, team_id, session);
    }


    @RequestMapping(value = "/deal_refuse", method = RequestMethod.POST)
    @ResponseBody
    public String dealRefuse(@RequestParam("id") int id,
                             @RequestParam("type") int type,
                             @RequestParam("send_name") String send_name,
                             HttpSession session) throws IOException {

        User user = (User) session.getAttribute("user");
        String login_name = user.getLogin_name();
        return messageService.refuse(type,id,login_name,send_name);
    }

    @RequestMapping("/read")
    public String read(@RequestParam("id") int id) {
        messageService.read(id);
        return "redirect:/mess/user_message";
    }

    @RequestMapping(value = "/del", method = RequestMethod.POST)
    @ResponseBody
    public String delMess(@RequestParam("id") int id){
        boolean b = messageService.deleteById(id);
        if (b){ return "1"; }
        return "0";
    }
}
