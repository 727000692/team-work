package com.teamwork.controller;

import com.teamwork.pojo.User;
import com.teamwork.service.UserService;
import com.teamwork.utils.CollectionsFactory;
import com.teamwork.utils.FileUpload;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public String login(@RequestParam("login_name") String loginName,
                        @RequestParam("password") String password,
                        HttpSession session,
                        Model model) {

        User user = userService.login(loginName, password);
        if (user != null) {
            //将登录的用户信息放在session中
            session.setAttribute("user", user);
            return  user.getUser_type();
        }
        return "-1";

    }


    @RequestMapping(value = "/register", method = RequestMethod.POST)
    @ResponseBody
    public String register(User user,@RequestParam("verification")String verification,
                        HttpSession session) {
        //获取验证码
        String vcode = (String) session.getAttribute("vcode");
        if (verification.equals(vcode)){
            return userService.register(user);
        }
        return "-1";
    }


    @RequestMapping(value = "/fix", method = RequestMethod.POST)
    @ResponseBody
    public String fix(@RequestParam("password") String password,
                        @RequestParam("password1") String password1,
                        HttpSession session) {
        User user = (User) session.getAttribute("user");
        String login_name = user.getLogin_name();

        User user1 = userService.login(login_name, password);
        if (user1 != null) {
            Long user_id = user1.getUser_id();
            boolean b = userService.fixPassword(user_id, password1);
            if (b){
                //修改成功
                return "1";
            }
            return "0";
        }
        return "-1";

    }

    @RequestMapping(value = "/forget", method = RequestMethod.POST)
    @ResponseBody
    public String forget(@RequestParam("loginName") String loginName,
                      @RequestParam("email") String email) {
        boolean b = userService.forgetPwd(loginName, email);
        if (b){
            return "1";
        }
        return "-1";
    }

    @RequestMapping(value = "/forget_pwd", method = RequestMethod.POST)
    @ResponseBody
    public String forgetPwd(@RequestParam("loginName") String loginName,
                            @RequestParam("password") String password,
                            @RequestParam("verification") String verification,
                            HttpSession session) {

        //获取验证码
        String vcode = (String) session.getAttribute("vcode");
        if (verification.equals(vcode)){
            boolean b = userService.fixPasswordByName(loginName, password);
            if (b){
                return "111";
            }
            return "0";

        }
        return "000";
    }


    @RequestMapping("/all_user")
    public String all_user(Model model) {
        List<User> users = userService.selectAll();
        model.addAttribute("users", users);
        return "user/all_users";
    }

    @RequestMapping("/team_user")
    public String team_user(Model model,HttpSession session) {
        User user = (User) session.getAttribute("user");
        Long team_id = user.getTeam_id();
        List<User> teamUsers = userService.selectUserByTeamId(team_id);
        model.addAttribute("teamUsers", teamUsers);
        return "user/my_team_users";
    }
    @RequestMapping("/update")
    public String update(User user, Model model,HttpSession session) {

        User user1= (User) session.getAttribute("user");
        Long userId = user1.getUser_id();
        boolean update = userService.update(userId, user);
        if (update){
            User user2 = userService.selectUserByUserId(userId);
            session.setAttribute("user",user2);
        }


        return "redirect:/profile";
    }


    /**
     * 修改头像
     */
    @RequestMapping("/update_photo")
    public String update_photo(@RequestParam("file") CommonsMultipartFile file,
                               HttpServletRequest req,
                               HttpSession session) {

        User user = (User) session.getAttribute("user");
        Long userId = user.getUser_id();

        String s = FileUpload.uploadOne(file, req);
        if (!"-1".equals(s)) {
            userService.update_photo(userId, s);
            user.setAvatar(s);
            session.setAttribute("user", user);
        }
        return "redirect:/profile";
    }



    @RequestMapping(value = "/get_loginName", method = RequestMethod.POST)
    @ResponseBody
    public User get_loginName(@RequestParam("loginName") String loginName) {
        User user = userService.get_loginName(loginName);
        return user;
    }

}
