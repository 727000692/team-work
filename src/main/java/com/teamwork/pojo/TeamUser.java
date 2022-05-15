package com.teamwork.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Component
public class TeamUser {
    /**
     * 团队ID
     */
    private Long team_id;

    /**
     * 团队创始人账号
     */
    private String create_by;

    /**
     * 团队名
     */

    private String team_name;

    /**
     * 团队上限人数
     */

    private Long team_num;


    /**
     * 团队当前人数
     */
    private int status;

    /**
     * 联系电话
     */
    private String phone;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 头像路径
     */
    private String avatar;




    /**
     * 注册时间
     */
    private String create_time;

    /**
     * 团队介绍
     */
    private String intro;











    /** 登录账号 */
    private String login_name;

    /** 用户昵称 */
    private String user_name;


    /** 用户邮箱 */
    private String user_email;

    /** 手机号码 */
    private String user_phone;

    /** 用户性别（0男 1女） */
    private String user_sex;

    /** 头像路径 */
    private String user_avatar;


    /** 介绍 */
    private String user_intro;













}
