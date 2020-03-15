package com.mm.service;

import com.mm.dao.WeekDao;
import com.mm.entity.Week;
import com.mm.util.State;
import org.apache.ibatis.annotations.Case;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class WeekService {
    @Autowired
    private WeekDao weekDao;

    public Map<String,List<Week>> selectAll() {
        List<Week> week = new ArrayList<>();
        week=weekDao.selectAll();

        return zhouji(week);
    }

    public List<Week> selectWeek(Week week) {
        return weekDao.selectByWeek(week);
    }

    public void addWeek(Week week) {
        weekDao.addWeek(week);
    }

    public void deleteWeek(Week week) {
        weekDao.deleteWeek(week);
    }

    public Map<String,List<Week>> zhouji(List<Week> weeks){
        Map<String,List<Week>> week=new HashMap<>();
        List<Week> monday = new ArrayList<>();
        List<Week> tuesday = new ArrayList<>();
        List<Week> wednesday = new ArrayList<>();
        List<Week> thursday = new ArrayList<>();
        List<Week> friday = new ArrayList<>();
        List<Week> saturday = new ArrayList<>();
        List<Week> sunday = new ArrayList<>();
        for (Week ww : weeks) {
            String zhouji = ww.getZjbs();
            switch (zhouji) {
                case State.ZHOUYI:
                    monday.add(ww);
                    break;
                case State.ZHOUER:
                    tuesday.add(ww);
                    break;
                case State.ZHOUSAN:
                    wednesday.add(ww);
                    break;
                case State.ZHOUSI:
                    thursday.add(ww);
                    break;
                case State.ZHOUWU:
                    friday.add(ww);
                    break;
                case State.ZHOULIU:
                    saturday.add(ww);
                    break;
                case State.ZHOURI:
                    sunday.add(ww);
                    break;
                default:
            }
        }
        week.put(State.ZHOUYI,monday);
        week.put(State.ZHOUER,tuesday);
        week.put(State.ZHOUSAN,wednesday);
        week.put(State.ZHOUSI,thursday);
        week.put(State.ZHOUWU,friday);
        week.put(State.ZHOULIU,saturday);
        week.put(State.ZHOURI,sunday);
        return week;
    }

}
