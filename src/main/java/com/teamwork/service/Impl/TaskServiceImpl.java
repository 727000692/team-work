package com.teamwork.service.Impl;

import com.teamwork.dao.ProjectMapper;
import com.teamwork.dao.TaskMapper;
import com.teamwork.pojo.Project;
import com.teamwork.pojo.Task;
import com.teamwork.pojo.User;
import com.teamwork.service.TaskService;
import com.teamwork.utils.FileUpload;
import com.teamwork.utils.GetTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class TaskServiceImpl implements TaskService {

    @Autowired
    private TaskMapper taskMapper;

    @Autowired
    private ProjectMapper projectMapper;




    @Override
    public List<Task> getTasks(Long project_id,String status) {
        return taskMapper.selectTasks(project_id,status);
    }

    @Override
    public List<Task> getTasksComplete(Long project_id) {
        return null;
    }

    @Override
    public List<Task> getMyTasks(Long project_id, String distribution_by, String status) {
        return taskMapper.getMyTasks(project_id,distribution_by,status);
    }

    @Override
    public int getMyTasksAll(Long project_id, String distribution_by) {
        return taskMapper.getMyTasksAll(project_id,distribution_by);
    }

    @Override
    public String newTasks(Task task, HttpSession session) {
        User user = (User) session.getAttribute("user");
        String login_name = user.getLogin_name();
        Long team_id = user.getTeam_id();
        Project project = projectMapper.selectProjectByNow(team_id);
        if (project != null){
            task.setProject_id(project.getProject_id());
            task.setCreate_by(login_name);
            task.setCreate_time(GetTime.precise());
            if ("未分配".equals(task.getDistribution_by())){
                task.setStatus("0");
            }else {
                task.setStatus("1");
            }
            taskMapper.newTasks(task);
            return "1";
        }
        return "0";
    }

    @Override
    public boolean update(Task task) {
        if ("未分配".equals(task.getDistribution_by())){
            task.setStatus("0");
        }else {
            task.setStatus("1");
        }
        int update = taskMapper.update(task);
        return update > 0;
    }

    @Override
    public boolean deleteById(int task_id) {
        int i = taskMapper.deleteById(task_id);
        return i>0;
    }

    @Override
    public boolean receive(int task_id, HttpSession session) {
        User user = (User) session.getAttribute("user");
        String login_name = user.getLogin_name();
        int receive = taskMapper.receive(task_id, login_name, "1");
        return receive>0;
    }

    @Override
    public boolean submit(Long task_id,String info, CommonsMultipartFile file, HttpServletRequest req) {

        Task task = new Task();
        task.setTask_id(task_id);
        task.setFinish_time(GetTime.precise());
        task.setInfo(info);
        task.setStatus("2");
        task.setFile_name(file.getOriginalFilename());
        task.setFile_path(FileUpload.uploadOne(file, req));

        int submit = taskMapper.submit(task);
        return submit>0;
    }
}
