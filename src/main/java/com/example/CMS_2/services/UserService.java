package com.example.CMS_2.services;

import com.example.CMS_2.controller.AppController;
import com.example.CMS_2.model.User;
import com.example.CMS_2.repository.UserRepository;
import org.slf4j.ILoggerFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class UserService {
    Logger log = LoggerFactory.getLogger(AppController.class);

    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public void saveMyUser(User user){
        userRepository.save(user);
    }

    public List<User> showAllUsers(){
        List<User> users = new ArrayList<User>();
        for(User user : userRepository.findAll()){
            users.add(user);
        }
        return  users;
    }

    public boolean vaildateCredentails(User loggingUser){

        User user;
        user =  userRepository.findByusername(loggingUser.getUsername());
        if(user!=null){
            String password = user.getPassword();
            System.out.println("password "+loggingUser.getPassword());

            if(loggingUser.getPassword().equals(password)){
                return true;
            }
        }

        return false;
    }

}

