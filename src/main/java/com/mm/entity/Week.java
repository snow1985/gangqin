package com.mm.entity;

import org.hibernate.validator.constraints.NotBlank;

import java.util.Date;

public class Week {
    @NotBlank(message = "id不能为空")
    private Integer id;
    private String name;
    private String zjbs;
    private String stime;
    private String etime;
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }



    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getZjbs() {
        return zjbs;
    }

    public void setZjbs(String zjbs) {
        this.zjbs = zjbs;
    }
    public String getStime() {
        return stime;
    }

    public void setStime(String stime) {
        this.stime = stime;
    }

    public String getEtime() {
        return etime;
    }
    public void setEtime(String etime) {
        this.etime = etime;
    }

    @Override
    public String toString() {
        return "Week{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", zjbs='" + zjbs + '\'' +
                ", stime='" + stime + '\'' +
                ", etime='" + etime + '\'' +
                '}';
    }
}
