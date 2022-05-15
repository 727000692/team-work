package com.teamwork.service;

import com.teamwork.pojo.Project;
import com.teamwork.pojo.Task;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;


public interface TaskService {

    public List<Task> getTasks(Long project_id,String status);

    public List<Task> getTasksComplete(Long project_id);

    public List<Task> getMyTasks(Long project_id,String distribution_by,String status);

    public int getMyTasksAll(Long project_id,String distribution_by);

    public String newTasks(Task task, HttpSession session);

    public boolean update(Task task);

    public boolean deleteById(int task_id);

    public boolean receive(int task_id,HttpSession session);

    public boolean submit(Long task_id,String info, CommonsMultipartFile file, HttpServletRequest req);



}
