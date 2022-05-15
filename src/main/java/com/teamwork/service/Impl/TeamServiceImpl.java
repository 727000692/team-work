package com.teamwork.service.Impl;

import com.teamwork.dao.TeamMapper;
import com.teamwork.pojo.Team;
import com.teamwork.service.TeamService;
import com.teamwork.utils.GetTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TeamServiceImpl implements TeamService {

    @Autowired
    private TeamMapper teamMapper;

    @Override
    public Team selectTeamByTeamId(Long teamId) {
        return teamMapper.selectTeamByTeamId(teamId);
    }

    @Override
    public List<Team> selectTeamList() {
        return teamMapper.selectTeamList();
    }

    @Override
    public boolean update(Team team) {
        int i = teamMapper.updateTeam(team);
        return i>0;
    }

    @Override
    public boolean insert(Team team) {
        String precise = GetTime.precise();
        team.setCreate_time(precise);

        int i = teamMapper.insertTeam(team);
        return i>0;
    }


}
