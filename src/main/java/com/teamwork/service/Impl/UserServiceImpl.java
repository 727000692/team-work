package com.teamwork.service.Impl;



import com.teamwork.dao.UserMapper;
import com.teamwork.pojo.User;
import com.teamwork.service.UserService;
import com.teamwork.utils.GetTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Override
    public User login(String loginName, String password) {
        return userMapper.login(loginName,password);
    }

    /**
     * 查询用户信息
     * @param userId 用户信息主键
     * @return 用户信息
     */
    @Override
    public User selectUserByUserId(Long userId)
    {
        return userMapper.selectUserByUserId(userId);
    }

    @Override
    public User selectUserByName(String login_name) {
        return userMapper.selectUserByName(login_name);
    }

    @Override
    public List<User> selectUserByTeamId(Long team_id) {
        return userMapper.selectUserByTeamId(team_id);
    }

    @Override
    public List<User> selectAll() {
        return userMapper.selectAll();
    }

    @Override
    public List<User> selectAllByName(String name) {
        return null;
    }

    @Override
    public User get_loginName(String loginName) {

        return userMapper.get_loginName(loginName);
    }

    @Override
    public boolean update_photo(Long userId, String path) {

        int i = userMapper.update_photo(userId, path);
        return i>0;
    }

    @Override
    public boolean update(Long userId, User user) {

        int update = userMapper.update(userId, user);
        return update>0;
    }

    @Override
    public boolean fixPassword(Long userId, String password) {
        int i = userMapper.fixPassword(userId, password);
        return i>0;
    }

    @Override
    public boolean fixPasswordByName(String loginName, String password) {
        int i = userMapper.fixPasswordByName(loginName, password);
        return i>0;
    }

    @Override
    public boolean updateTeam(Long userId,Long team_id,String team_permission) {


        int i = userMapper.updateTeam(userId, team_id, team_permission);

        return i>0;
    }

    @Override
    public int teamNum(Long team_id) {
        return userMapper.teamNum(team_id);
    }

    @Override
    public String register(User user) {
        User loginName = userMapper.get_loginName(user.getLogin_name());
        if (loginName == null){
            user.setCreate_time(GetTime.precise());
            int register = userMapper.register(user);
            if (register > 0){
                return "1";
            }
        }
        return "0";

    }

    @Override
    public boolean forgetPwd(String loginName, String email) {
        User user = userMapper.userEmail(loginName, email);
        return user != null;
    }

}
