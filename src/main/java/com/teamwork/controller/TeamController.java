package com.teamwork.controller;

import com.teamwork.pojo.Team;
import com.teamwork.pojo.TeamUser;
import com.teamwork.pojo.User;
import com.teamwork.service.TeamService;
import com.teamwork.service.UserService;
import com.teamwork.utils.FileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/team")
public class TeamController {

    @Autowired
    private TeamService teamService;

    @Autowired
    private UserService userService;



    /**
     * 我的团队
     *
     * @param session
     * @return
     */
    @RequestMapping("/my")
    public String my(HttpSession session,Model model) {
        //去后端查一下该用户团队id
        User user = (User) session.getAttribute("user");
        Long teamId = user.getTeam_id();
        String team_permission = user.getTeam_permission();

        if (teamId != null) {
            //去有我的团队信息地方
            Team team = teamService.selectTeamByTeamId(teamId);
            List<User> team_user = userService.selectUserByTeamId(teamId);

            model.addAttribute("team",team);
            model.addAttribute("team_user",team_user);


            if ("团队队长".equals(team_permission)){
                return "team/my_team";
            }else {
                return "team/user_team";
            }

        }

        return "team/new_team";
    }

    /**
     * 寻找团队
     *
     * @param session
     * @return
     */
    @RequestMapping("/all")
    public String all(HttpSession session, Model model) {
        List<Team> teams = teamService.selectTeamList();


        List<TeamUser> teamUsers = new ArrayList<>();
        for (Team team : teams) {
            TeamUser teamUser = new TeamUser();
            teamUser.setTeam_id(team.getTeam_id());
            teamUser.setAvatar(team.getAvatar());
            teamUser.setCreate_by(team.getCreate_by());
            teamUser.setTeam_num(team.getTeam_num());
            teamUser.setTeam_name(team.getTeam_name());
            teamUser.setEmail(team.getEmail());
            teamUser.setPhone(team.getPhone());
            teamUser.setCreate_time(team.getCreate_time());
            teamUser.setIntro(team.getIntro());

            int i = userService.teamNum(team.getTeam_id());
            teamUser.setStatus(i);

            User user = userService.selectUserByName(team.getCreate_by());
            teamUser.setLogin_name(user.getLogin_name());
            teamUser.setUser_name(user.getUser_name());
            teamUser.setUser_avatar(user.getAvatar());
            teamUser.setUser_email(user.getEmail());
            teamUser.setUser_sex(user.getSex());
            teamUser.setUser_phone(user.getPhonenumber());
            teamUser.setUser_intro(user.getIntro());

            teamUsers.add(teamUser);
        }

        model.addAttribute("teamUsers",teamUsers);
        return "team/all_team";
    }


    @RequestMapping("/update")
    public String update(@RequestParam("file") CommonsMultipartFile file,
                         HttpServletRequest req,
                         Team team) {
        String s = FileUpload.uploadOne(file, req);
        if (!"-1".equals(s)){
            team.setAvatar(s);
        }
        teamService.update(team);
        return "redirect:/team/my";
    }

    @RequestMapping("/new_team")
    public String new_team(@RequestParam("file") CommonsMultipartFile file,
                           HttpServletRequest req,
                           Team team,
                           HttpSession session,
                           Model model) {

        User user = (User) session.getAttribute("user");
        String login_name = user.getLogin_name();
        Long user_id = user.getUser_id();
        team.setTeam_id(user_id);
        team.setCreate_by(login_name);

        String s = FileUpload.uploadOne(file, req);
        if (!"-1".equals(s) ){
            team.setAvatar(s);
        }
        boolean insert = teamService.insert(team);
        if (insert){
            userService.updateTeam(user_id,user_id,"团队队长");
            User user1 = userService.selectUserByUserId(user_id);
            session.setAttribute("user",user1);
        }

        return "redirect:/team/my";
    }
}
