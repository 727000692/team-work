package com.teamwork.controller;

import com.alibaba.fastjson.JSON;
import com.teamwork.pojo.*;
import com.teamwork.service.ProjectService;
import com.teamwork.service.TaskService;
import com.teamwork.service.UserService;
import com.teamwork.utils.CollectionsFactory;
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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/project")
public class ProjectController {

    @Autowired
    private ProjectService projectService;

    @Autowired
    private UserService userService;

    @Autowired
    private TaskService taskService;


    @RequestMapping("/team_project")
    public String team_project(HttpSession session, Model model) {

        User user = (User) session.getAttribute("user");
        Long team_id = user.getTeam_id();

        if (team_id != null){
            //当前项目
            Project project = projectService.selectProjectByNow(team_id);
            model.addAttribute("project", project);
            //已完成的项目list
            List<Project> projects = projectService.selectProjects(team_id);
            model.addAttribute("projects", projects);

            if (project != null){
                Long project_id = project.getProject_id();
                //项目已完成任务数
                int i = projectService.TaskNumComplete(project_id);
                //项目总任务数
                int num = projectService.TaskNum(project_id);
                if (num > 0){
                    model.addAttribute("process", i * 100 / num);
                }
                model.addAttribute("num", num);
            }

            if ("团队队长".equals(user.getTeam_permission())){
                return "project/team_projects";
            }
            return "project/team_projects_user";
       }

       return "team/new_team";

    }

    @RequestMapping(value = "/finish", method = RequestMethod.POST)
    @ResponseBody
    public String finishProject(@RequestParam("project_id")Long project_id) {
        boolean b = projectService.finishProject(project_id);
        if (b){
            return "1";
        }
        return "0";
    }

    @RequestMapping(value = "/new", method = RequestMethod.POST)
    @ResponseBody
    public String newProject(Project project,
                             @RequestParam("file") CommonsMultipartFile file,
                             HttpServletRequest req, HttpSession session) {
        return projectService.newProject(project,file,req,session);
    }


    @RequestMapping("/data")
    public String data(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
//        ArrayList<Object> maps = CollectionsFactory.newArrayList();
        List<TaskData> taskDatas = new ArrayList<>();

        Long team_id = user.getTeam_id();
        if (team_id != null){
            //当前项目
            Project project = projectService.selectProjectByNow(team_id);
            model.addAttribute("project", project);

            if (project != null){
                Long project_id = project.getProject_id();
                //项目已完成任务数
                int i = projectService.TaskNumComplete(project_id);
                //项目总任务数
                int num = projectService.TaskNum(project_id);
                model.addAttribute("num", num);
                if (num > 0){
                    model.addAttribute("process", i * 100 / num);
                }

                List<User> users = userService.selectUserByTeamId(team_id);

                for (User user1 : users) {
                    TaskData taskData = new TaskData();
                    String login_name = user1.getLogin_name();
                    String user_name = user1.getUser_name();
                    int size = taskService.getMyTasks(project_id, login_name, "2").size();
                    int myTasksAll = taskService.getMyTasksAll(project_id, login_name);

                    taskData.setUser_name(user_name);
                    taskData.setTaskNum(myTasksAll);
                    taskData.setCompleteNum(size);
                    if (myTasksAll>0){
                        taskData.setStatus(size*100/myTasksAll);
                    }
                    taskDatas.add(taskData);
//                    HashMap<Object, Object> map = CollectionsFactory.newHashMap();
//                    map.put("value",size);
//                    map.put("name",user_name);
//                    maps.add(map);
                }
//                String mapJson= JSON.toJSONString(maps);
//                model.addAttribute("maps",mapJson);
                model.addAttribute("taskData",taskDatas);
            }


            return "project/data";
        }








        return "project/data";
    }

    @RequestMapping("/update")
    public String update(Project project,
                         @RequestParam("file") CommonsMultipartFile file,
                         HttpServletRequest req) {
        projectService.update(project, file, req);
        return "redirect:/project/team_project";
    }

    @RequestMapping("/complete")
    public String complete(@RequestParam("project_id")Long project_id,Model model) {
        List<Task> complete = projectService.complete(project_id);
        model.addAttribute("complete",complete);
        return "task/complete_project_tasks";
    }

}
