package com.teamwork.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Component
public class User {
    /** 用户ID */
    private Long user_id;

    /** 团队ID */
    private Long team_id;

    /** 用户权限 */
    private String team_permission;

    /** 登录账号 */
    private String login_name;

    /** 用户昵称 */
    private String user_name;

    /** 用户类型（0普通用户 1管理员） */
    private String user_type;

    /** 用户邮箱 */
    private String email;

    /** 手机号码 */
    private String phonenumber;

    /** 用户性别（0男 1女） */
    private String sex;

    /** 头像路径 */
    private String avatar;

    /** 密码 */
    private String password;

    /** 帐号状态（0正常 1停用） */
    private String status;

    /** 删除标志（0代表存在 2代表删除） */
    private String del_flag;

    private String create_time;

    /** 介绍 */
    private String intro;




}
