package com.password.passwordManager.controller;

import com.password.passwordManager.model.Users;
import com.password.passwordManager.service.Users.UsersInt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin(origins = "*", allowedHeaders = "*")
@RequestMapping("/user")
public class UsersController {
    @Autowired
    private UsersInt userService;

    @PostMapping("")
    public Users saveAccount(@RequestBody Users user) {
        return userService.saveUser(user);
    }

    @GetMapping("/{id}")
    public Users fetchUser(@PathVariable("id") String id) {
        return userService.fetchUser(id);
    }

    @GetMapping("")
    public List<Users> fetchAllUsers() {
        return userService.fetchAllUsers();
    }

    @PutMapping("/{id}")
    public Users updateUser(@PathVariable("id") String id, Users user) {
        return userService.updateUser(id, user);
    }

    @DeleteMapping("{id}")
    public boolean deleteUser(@PathVariable("id") String id) {
        return userService.deleteUser(id);
    }
}
