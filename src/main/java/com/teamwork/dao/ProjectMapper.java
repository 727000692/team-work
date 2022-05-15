package com.teamwork.dao;

import com.teamwork.pojo.Project;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import javax.servlet.http.HttpSession;
import java.util.List;

@Repository
public interface ProjectMapper {

    /**
     * 查询当前项目信息
     */
    public Project selectProjectByNow(Long team_id);

    /**
     * 查询当前项目信息
     */
    public List<Project> selectProjects(Long team_id);


    public int updateProject(Project project);

    public int updateFile(Project project);

    public int newProject(Project project);

    public int finishProject(@Param("project_id") Long project_id,
                             @Param("finish_time") String finish_time);



}
