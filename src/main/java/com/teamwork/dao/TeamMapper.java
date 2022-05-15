package com.teamwork.dao;

import com.teamwork.pojo.Team;
import com.teamwork.pojo.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TeamMapper {
    /**
     * 查询团队信息
     *
     * @param teamId 团队信息主键
     * @return 团队信息
     */
    public Team selectTeamByTeamId(@Param("teamId") Long teamId);

    /**
     * 查询团队信息列表
     *
     * @return 团队信息集合
     */
    public List<Team> selectTeamList();

    /**
     * 新增团队信息
     *
     * @param team 团队信息
     * @return 结果
     */
    public int insertTeam(Team team);

    /**
     * 修改团队信息
     *
     * @param team 团队信息
     * @return 结果
     */
    public int updateTeam(Team team);

    /**
     * 删除团队信息
     *
     * @param teamId 团队信息主键
     * @return 结果
     */
    public int deleteTeamByTeamId(Long teamId);






}
