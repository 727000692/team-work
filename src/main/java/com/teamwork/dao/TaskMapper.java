package com.teamwork.dao;

import com.teamwork.pojo.Project;
import com.teamwork.pojo.Task;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Repository
public interface TaskMapper {
    /**
     * 查询当前项目任务
     */
    public List<Task> selectTasks(@Param("project_id") Long project_id,
                                  @Param("status") String status);


    /**
     * 查询当前项目任务数
     */
    public int TaskNum(Long project_id);

    /**
     * 查询当前项目完成的任务数
     */
    public int TaskNumComplete(Long project_id);

    public List<Task> getMyTasks(@Param("project_id") Long project_id,
                                 @Param("distribution_by") String distribution_by,
                                 @Param("status") String status);

    public int getMyTasksAll(@Param("project_id") Long project_id,
                                 @Param("distribution_by") String distribution_by);


    public int newTasks(Task task);

    public int update(Task task);

    public int deleteById(int task_id);

    public int receive(@Param("task_id") int task_id,
                       @Param("distribution_by") String distribution_by,
                       @Param("status") String status);

    public int submit(Task task);


}
