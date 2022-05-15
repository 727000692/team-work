package com.teamwork.controller;

import com.teamwork.utils.SendMailUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Random;
import java.util.Timer;
import java.util.TimerTask;

@Controller
public class SendEmail {
    @Autowired
    private SendMailUtil sendMailUtil;

    @RequestMapping("/code")
    @ResponseBody
    public int sendEmail(String email, HttpSession session){
        String code="";
        //随机产生验证码
        Random rd=new Random();
        while(code.length()<6){
            code+=rd.nextInt(10);
        }

        //如果验证码发送成功
        if(sendMailUtil.sendHtmlMail(email, "yjjs", code)){
            session.setAttribute("vcode", code);

            //创建TimerTask用来三分钟之后移出vcode
            TimerTask task=new TimerTask(){

                @Override
                public void run() {
                    session.removeAttribute("vcode");
                }
            };

            //实例化这个task任务
            Timer timer=new Timer();
            timer.schedule(task, 180000);//三分钟之后执行task任务
            return 1;
        }

        return 0;
    }
}
