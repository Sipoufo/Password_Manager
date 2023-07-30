package com.password.passwordManager.controller;

import com.password.passwordManager.model.Accounts;
import com.password.passwordManager.service.Accounts.AccountsInt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin(origins = "*", allowedHeaders = "*")
@RequestMapping("/account")
public class AccountController {
    @Autowired
    private AccountsInt accountsService;

    @PostMapping("")
    public Accounts saveAccount(@RequestBody Accounts accounts) {
        return accountsService.saveAccount(accounts);
    }

    @GetMapping("/{id}")
    public Accounts fetchAccount(@PathVariable("id") String id) {
        return accountsService.fetchAccount(id);
    }

    @GetMapping("")
    public List<Accounts> fetchAllAccount() {
        return accountsService.fetchAllAccounts();
    }

    @PutMapping("/{id}")
    public Accounts updateAccount(@PathVariable("id") String id, Accounts accounts) {
        return accountsService.updateAccount(id, accounts);
    }

    @DeleteMapping("{id}")
    public boolean deleteAccount(@PathVariable("id") String id) {
        return accountsService.deleteAccount(id);
    }
}
