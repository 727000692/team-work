package com.teamwork.service;

import com.teamwork.pojo.Team;
import com.teamwork.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface TeamService {
    /**
     * 查询团队信息
     *
     * @param teamId 团队信息主键
     * @return 团队信息
     */
    public Team selectTeamByTeamId(Long teamId);

    /**
     * 查询团队信息列表
     *
     * @return 团队信息集合
     */
    public List<Team> selectTeamList();


    /**
     * 更新团队信息
     */
    public boolean update(Team team);



    /**
     * 插入团队信息
     */
    public boolean insert(Team team);
}
