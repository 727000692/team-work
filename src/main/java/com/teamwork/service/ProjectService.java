package com.teamwork.service;

import com.teamwork.pojo.Project;
import com.teamwork.pojo.Task;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

public interface ProjectService {
    /**
     * 查询当前项目信息
     */
    public Project selectProjectByNow(Long team_id);

    /**
     * 查询当前项目信息
     */
    public List<Project> selectProjects(Long team_id);

    /**
     * 查询当前项目任务数
     */
    public int TaskNum(Long project_id);

    /**
     * 查询当前项目完成的任务数
     */
    public int TaskNumComplete(Long project_id);

    public String newProject(Project project,
                          CommonsMultipartFile file,
                          HttpServletRequest req, HttpSession session);

    public boolean update(Project project,
                         CommonsMultipartFile file,
                         HttpServletRequest req);


    public boolean finishProject(Long project_id);

    public List<Task> complete(Long project_id);




}
