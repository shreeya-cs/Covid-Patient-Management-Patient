package com.example.CMS_2.controller;

import com.example.CMS_2.model.User;
import com.example.CMS_2.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@org.springframework.web.bind.annotation.RestController
public class RestController {
    @Autowired
    private UserService userService;
    @GetMapping("/saveUser")
    public String saveUser(@RequestParam String username ,
                           @RequestParam String firstname,
                           @RequestParam String lastname,
                           @RequestParam int age,
                           @RequestParam String password){
        User user = new User(username,firstname,lastname,age,password);
        userService.saveMyUser(user);
        return "User Saved";
    }
}
