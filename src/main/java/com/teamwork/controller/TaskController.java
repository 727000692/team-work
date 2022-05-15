package com.teamwork.controller;

import com.teamwork.pojo.Project;
import com.teamwork.pojo.Task;
import com.teamwork.pojo.Team;
import com.teamwork.pojo.User;
import com.teamwork.service.ProjectService;
import com.teamwork.service.TaskService;
import com.teamwork.service.UserService;
import com.teamwork.utils.FileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/task")
public class TaskController {

    @Autowired
    private UserService userService;

    @Autowired
    private TaskService taskService;

    @Autowired
    private ProjectService projectService;

    @RequestMapping("/project_task")
    public String project_task(HttpSession session, Model model) {

        User user = (User) session.getAttribute("user");
        Long team_id = user.getTeam_id();

        if (team_id != null){
            Project project = projectService.selectProjectByNow(team_id);
            if (project != null){
                Long project_id = project.getProject_id();
                //获取未分配的任务
                List<Task> tasks = taskService.getTasks(project_id,"0");
                //获取已领取的任务
                List<Task> receiveTasks = taskService.getTasks(project_id,"1");
                //获取已完成的任务
                List<Task> completeTasks = taskService.getTasks(project_id,"2");
                model.addAttribute("tasks",tasks);
                model.addAttribute("receiveTasks",receiveTasks);
                model.addAttribute("completeTasks",completeTasks);
            }
            if ("团队队长".equals(user.getTeam_permission())){

                List<User> team_user = userService.selectUserByTeamId(team_id);
                model.addAttribute("team_user",team_user);
                return "task/project_task_captain";
            }
            return "task/project_task_user";

        }
        return "team/new_team";




    }

    @RequestMapping("/my_task")
    public String my_task(HttpSession session, Model model) {

        User user = (User) session.getAttribute("user");
        Long team_id = user.getTeam_id();
        String login_name = user.getLogin_name();

        if (team_id != null){
            Project project = projectService.selectProjectByNow(team_id);
            if (project != null){
                Long project_id = project.getProject_id();
                //获取分配给我的且未完成的任务
                List<Task> myTasks = taskService.getMyTasks(project_id,login_name,"1");
                model.addAttribute("myTasks",myTasks);
                //获取分配给我的，已完成的任务
                List<Task> myTasksComplete = taskService.getMyTasks(project_id, login_name, "2");
                model.addAttribute("myTasksComplete",myTasksComplete);
            }
            return "task/my_task";
        }


        return "team/new_team";
    }


    @RequestMapping("/new_task")
    public String new_task(Task task,
                           HttpSession session,
                           Model model) {
        String s = taskService.newTasks(task, session);
        if ("1".equals(s)){
            return "redirect:/task/project_task";
        }
        return "redirect:/project/team_project";
    }

    @RequestMapping("/update")
    public String update(Task task) {
        taskService.update(task);
        return "redirect:/task/project_task";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public String delTask(@RequestParam("task_id") int task_id){
        boolean b = taskService.deleteById(task_id);
        if (b){ return "1"; }
        return "0";
    }

    @RequestMapping("/receive")
    public String receive(@RequestParam("task_id") int task_id,HttpSession session) {
        boolean receive = taskService.receive(task_id, session);
        if (receive){
            return "redirect:/task/my_task";
        }
        return "redirect:/task/project_task";
    }

    @RequestMapping("/submit")
    public String submit(@RequestParam("task_id") Long task_id,
                         @RequestParam("info") String info,
                         @RequestParam("file") CommonsMultipartFile file,
                         HttpServletRequest req) {
        taskService.submit(task_id, info, file, req);
        return "redirect:/task/my_task";
    }







}
