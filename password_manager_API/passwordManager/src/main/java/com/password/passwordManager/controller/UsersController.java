package com.password.passwordManager.controller;

import com.password.passwordManager.model.Accounts;
import com.password.passwordManager.model.Users;
import com.password.passwordManager.service.Users.UsersInt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin(origins = "*", allowedHeaders = "*")
@RequestMapping("/user")
public class UsersController {
    @Autowired
    private UsersInt userService;

    @PostMapping("")
    public ResponseEntity<Users> saveAccount(@RequestBody Users user) {
        return ResponseEntity.ok(userService.saveUser(user));
    }

    @GetMapping("/{id}")
    public ResponseEntity<Users> fetchUser(@PathVariable("id") String id) {
        return ResponseEntity.ok(userService.fetchUser(id));
    }

    @GetMapping("")
    public ResponseEntity<List<Users>> fetchAllUsers() {
        return ResponseEntity.ok(userService.fetchAllUsers());
    }

    @PutMapping("/{id}")
    public ResponseEntity<Users> updateUser(@PathVariable("id") String id, @RequestBody Users user) {
        System.out.println("Test !!");
        System.out.println(user.getName());
        System.out.println(user.getAccounts().get(0).getLink());
        return ResponseEntity.ok(userService.updateUser(id, user));
    }

    @DeleteMapping("{id}")
    public ResponseEntity<Boolean> deleteUser(@PathVariable("id") String id) {
        return ResponseEntity.ok(userService.deleteUser(id));
    }

    @PostMapping("/account/{id}")
    public ResponseEntity<Users> createAccountWithUserId(@PathVariable("id") String id, @RequestBody Accounts account) {
        System.out.println(account);
        return ResponseEntity.ok(userService.createNewAccount(id, account));
    }

    @DeleteMapping("/account/{id}")
    public ResponseEntity<Boolean> deleteAccountWithUserId(@PathVariable("id") String id, @RequestBody String idAccount) {
        return ResponseEntity.ok(userService.deleteAccount(id, idAccount));
    }
}
