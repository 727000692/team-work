package com.teamwork.service.Impl;

import com.teamwork.dao.ProjectMapper;
import com.teamwork.dao.TaskMapper;
import com.teamwork.pojo.Project;
import com.teamwork.pojo.Task;
import com.teamwork.pojo.User;
import com.teamwork.service.ProjectService;
import com.teamwork.utils.FileUpload;
import com.teamwork.utils.GetTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Service("projectService")
public class ProjectServiceImpl implements ProjectService {
    @Autowired
    private ProjectMapper projectMapper;

    @Autowired
    private TaskMapper taskMapper;


    @Override
    public Project selectProjectByNow(Long team_id) {
        return projectMapper.selectProjectByNow(team_id);
    }

    @Override
    public List<Project> selectProjects(Long team_id) {
        return projectMapper.selectProjects(team_id);
    }

    @Override
    public int TaskNum(Long project_id) {
        return taskMapper.TaskNum(project_id);
    }

    @Override
    public int TaskNumComplete(Long project_id) {
        return taskMapper.TaskNumComplete(project_id);
    }

    @Override
    public String newProject(Project project,
                          CommonsMultipartFile file,
                          HttpServletRequest req, HttpSession session) {
        User user = (User) session.getAttribute("user");

        String login_name = user.getLogin_name();
        Long team_id = user.getTeam_id();
        project.setCreate_by(login_name);
        project.setTeam_id(team_id);
        project.setCreate_time(GetTime.precise());

        String s = FileUpload.uploadOne(file, req);
        //有文件
        if (!"-1".equals(s)){
            project.setFile_name(file.getOriginalFilename());
            project.setFile_path(s);
        }
        int i = projectMapper.newProject(project);
        if (i>0){
            return "1";
        }

        return "0";
    }

    @Override
    public boolean update(Project project, CommonsMultipartFile file, HttpServletRequest req) {

        int i;
        String s = FileUpload.uploadOne(file, req);
        //有文件
        if (!"-1".equals(s)){
            project.setFile_name(file.getOriginalFilename());
            project.setFile_path(s);
            i = projectMapper.updateFile(project);
        }else {
            //没文件
            i = projectMapper.updateProject(project);
        }

        return i>0;
    }

    @Override
    public boolean finishProject(Long project_id) {
        String finish_time = GetTime.precise();
        int i = projectMapper.finishProject(project_id, finish_time);
        return i>0;
    }

    @Override
    public List<Task> complete(Long project_id) {
        return taskMapper.selectTasks(project_id,"2");
    }
}
