package com.teamwork.dao;

import com.teamwork.pojo.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMapper {

    /**
     * 查询对应账号和密码的用户
     * @param loginName 账号
     * @param password 密码
     * @return 用户信息
     */
    public User login(@Param("loginName") String loginName,
                      @Param("password")String password);
    /**
     * 查询用户信息
     *
     * @param userId 用户信息主键
     * @return 用户信息
     */
    public User selectUserByUserId(Long userId);

    /**
     * 查询所有用户信息
     * @return
     */
    public List<User> selectAll();


    /**
     * 按照name模糊查询用户信息
     * @return
     */
    public List<User> selectAllByName(@Param("name") String name);



    public User get_loginName(@Param("loginName") String loginName);


    /**
     * 修改头像
     */
    public int update_photo(@Param("userId")Long userId,@Param("path")String path);

    /**
     * 更新用户信息
     */
    public int update(@Param("userId")Long userId,
                      @Param("user")User user);


    public  List<User> selectUserByTeamId(Long team_id);


    /**
     * 更新用户团队信息
     */
    public int updateTeam(@Param("userId") Long userId,
                          @Param("team_id") Long team_id,
                          @Param("team_permission") String team_permission);


    /**
     * 查询团队当前用户数
     */
    public int teamNum(Long team_id);

    public User selectUserByName(String login_name);


    public int removeTeam(String login_name);

    public int fixPassword(@Param("userId")Long userId,
                           @Param("password")String password);

    public int fixPasswordByName(@Param("login_name")String login_name,
                                     @Param("password")String password);

    public int register(User user);

    public User userEmail(@Param("loginName") String loginName,
                         @Param("email") String email);

}
