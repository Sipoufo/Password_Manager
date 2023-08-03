package com.password.passwordManager.controller;

import com.password.passwordManager.model.Accounts;
import com.password.passwordManager.service.Accounts.AccountsInt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin(origins = "*", allowedHeaders = "*")
@RequestMapping("/account")
public class AccountController {
    @Autowired
    private AccountsInt accountsService;

    @PostMapping("")
    public ResponseEntity<Accounts> saveAccount(@RequestBody Accounts accounts) {
        return ResponseEntity.ok(accountsService.saveAccount(accounts));
    }

    @GetMapping("/{id}")
    public ResponseEntity<Accounts> fetchAccount(@PathVariable("id") String id) {
        return ResponseEntity.ok(accountsService.fetchAccount(id));
    }

    @GetMapping("")
    public ResponseEntity<List<Accounts>> fetchAllAccount() {
        return ResponseEntity.ok(accountsService.fetchAllAccounts());
    }

    @PutMapping("/{id}")
    public ResponseEntity<Accounts> updateAccount(@PathVariable("id") String id, @RequestBody Accounts accounts) {
        return ResponseEntity.ok(accountsService.updateAccount(id, accounts));
    }

    @DeleteMapping("{id}")
    public ResponseEntity<Boolean> deleteAccount(@PathVariable("id") String id) {
        return ResponseEntity.ok(accountsService.deleteAccount(id));
    }
}
