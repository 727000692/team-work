package com.teamwork.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Component

public class Team {

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
     * 团队状态（0正常 1停用）
     */

    private String status;

    /**
     * 删除标志（0代表存在 1代表删除）
     */
    private String del_flag;

    /**
     * 注册时间
     */
    private String create_time;

    /**
     * 团队介绍
     */
    private String intro;

}
