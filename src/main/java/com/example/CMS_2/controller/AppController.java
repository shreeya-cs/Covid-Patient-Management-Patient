package com.example.CMS_2.controller;

import com.example.CMS_2.model.User;
import com.example.CMS_2.services.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

@Controller
public class AppController {
    Logger logger = LoggerFactory.getLogger(AppController.class);
    @Autowired
    UserService userService;
    @RequestMapping(value="User_page" , method= RequestMethod.POST)
    public String home(){
        return "home";
    }

    @RequestMapping(value="/welcome" )
    public String welcome(HttpServletRequest request)
    {
        logger.info("request.toStirng "+request.toString());
        request.setAttribute("mode","MODE_HOME");
        logger.info("set mode to MODE_HOME :"+request.getAttribute("mode")  );
        return "welcomepage";
    }

    @RequestMapping(value="list_contact")
    public String listContact(){
        return "contact";
    }

    @RequestMapping("/register")
    public String registration(HttpServletRequest request){
        logger.info("set mode to MODE_REGISTER :"+request.getAttribute("mode")  );

        request.setAttribute("mode","MODE_REGISTER");
        return "welcomepage";
    }



    @PostMapping("/save-user")
    @ResponseBody
    public String registerUser(@ModelAttribute User user,
                               BindingResult bindingResult,
                               HttpServletRequest httpServletRequest) {
        userService.saveMyUser(user);
        httpServletRequest.setAttribute("message", "MODE_HOME");
        return "User-saved-successfully"; //view
    }

    @GetMapping("/show-users")
    public String show_users(HttpServletRequest httpServletRequest){
        httpServletRequest.setAttribute("users",userService.showAllUsers());
        httpServletRequest.setAttribute("mode","ALL_USERS");
        return "welcomepage";
    }

    @GetMapping("/login")
    public String login(HttpServletRequest httpServletRequest){
        httpServletRequest.setAttribute("mode","LOGIN");
        return "welcomepage";
    }

    @PostMapping("/login-user")
    public String loginUser(@ModelAttribute User user,
                            BindingResult bindingResult){
//        httpServletRequest.setAttribute("mode","LOGIN");
        if(userService.vaildateCredentails(user)){
            return "welcomepage";
        }
        return "invalid";
    }





}
