package com.teamwork.service;

import com.teamwork.pojo.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

public interface UserService {


    //用户登录
    public User login(String loginName, String password);
    /**
     * 查询用户信息
     *
     * @param userId 用户信息主键
     * @return 用户信息
     */
    public User selectUserByUserId(Long userId);

    public User selectUserByName(String login_name);

    public  List<User> selectUserByTeamId(Long team_id);


    /**
     * 查询所有用户信息
     * @return
     */
    public List<User> selectAll();


    /**
     * 按照name模糊查询用户信息
     * @return
     */
    public List<User> selectAllByName(String name);

    /**
     * 根据用户账号查询
     * @param loginName
     * @return
     */

    public User get_loginName(String loginName);


    /**
     * 修改头像
     */
    public boolean update_photo(Long userId,String path);


    /**
     * 更新用户信息
     */
    public boolean update(Long userId,User user);

    /**
     * 更新用户信息
     */
    public boolean fixPassword(Long userId,String password);

    public boolean fixPasswordByName(String loginName,String password);
    /**
     * 更新用户团队信息
     */
    public boolean updateTeam(Long userId,Long team_id,String team_permission);

    /**
     * 查询团队当前用户数
     */
    public int teamNum(Long team_id);

    /**
     * 用户注册
     */
    public String register(User user);

    public boolean forgetPwd(String loginName, String email);


}
