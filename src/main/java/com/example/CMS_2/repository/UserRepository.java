package com.example.CMS_2.repository;

import com.example.CMS_2.model.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface UserRepository extends CrudRepository<User,Integer> {

//    @Query("select password from user where username=:username")
//    String fetchPassworFromUsername(@Param("username") String username);

     User findByusername(String username);
}
