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
public class Project {

    /** 项目ID */
    private Long project_id;

    /** 团队ID */
    private Long team_id;

    /**  项目创始者账号 */
    private String create_by;

    /** 项目名 */
    private String project_name;

    /** 项目状态（0未完成 1完成） */
    private String status;

    /** 删除标志（0代表存在 1代表删除） */
    private String del_flag;

    /** 项目发布时间 */
    private String create_time;

    /** 项目完成时间 */
    private String finish_time;

    /** 文件名 */
    private String file_name;

    /** 文件路径 */
    private String file_path;

    /** 项目介绍 */
    private String intro;
}
