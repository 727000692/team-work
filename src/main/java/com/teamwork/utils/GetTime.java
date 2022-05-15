package com.teamwork.utils;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class GetTime {


    /**
     * 获取精确到秒的时间
     * @return
     */
    public static String precise(){
        //年月日 时分秒
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date();
        return format.format(date);
    }

    /**
     * 获取简单时间
     * @return
     */
    public static String simple(){
        //年月日
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        return format.format(date);
    }
}
