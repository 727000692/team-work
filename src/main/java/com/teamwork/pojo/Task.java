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
public class Task {
    /** 任务ID */
    private Long task_id;

    /** 项目ID */
    private Long project_id;

    /** 任务创始者账号 */
    private String create_by;

    /** 任务名 */
    private String task_name;

    /** 任务领取者账号 */
    private String distribution_by;

    /** 任务状态（0未完成 1完成） */
    private String status;

    /** 删除标志（0代表存在 1代表删除） */
    private String del_flag;

    /** 任务领取时间 */
    private String create_time;

    /** 任务领取时间 */
    private String receive_time;

    /** 任务完成时间 */
    private String finish_time;

    /** 任务介绍 */
    private String intro;

    /** 任务提交完成信息 */
    private String info;

    /** 任务提交附件名 */
    private String file_name;

    /** 任务提交附件路径 */
    private String file_path;

}
