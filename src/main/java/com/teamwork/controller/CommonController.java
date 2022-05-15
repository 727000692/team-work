package com.teamwork.controller;

import com.teamwork.pojo.Project;
import com.teamwork.pojo.TaskData;
import com.teamwork.pojo.User;
import com.teamwork.service.ProjectService;
import com.teamwork.service.TaskService;
import com.teamwork.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class CommonController {

    @Autowired
    private ProjectService projectService;

    @Autowired
    private UserService userService;

    @Autowired
    private TaskService taskService;

    /**
     * 默认启动页
     *
     * @return 登录页
     */
    @RequestMapping("/")
    public String index() {
        return "login";
    }

    @RequestMapping("/to_register")
    public String to_register() {
        return "register";
    }


    @RequestMapping("/user_index")
    public String user(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        //如果用户未登录，返回首页，后续使用拦截器完成
        if (user != null) {
            String login_name = user.getLogin_name();
            Long team_id = user.getTeam_id();
            if (team_id != null) {
                //当前项目
                Project project = projectService.selectProjectByNow(team_id);
                if (project != null) {
                    Long project_id = project.getProject_id();
                    int size = taskService.getMyTasks(project_id, login_name, "2").size();
                    int myTasksAll = taskService.getMyTasksAll(project_id, login_name);
                    if (myTasksAll > 0) {
                        model.addAttribute("process",size * 100 / myTasksAll);
                    }
                }
            }
            return "user_index";
        }
        return"login";
    }




    @RequestMapping("/profile")
    public String profile(HttpSession session) {
        return "user/profile";
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("user");
        return "redirect:/";
    }

    @RequestMapping("/forget")
    public String forget() {
        return "forget_password";
    }


}
