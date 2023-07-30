package com.password.passwordManager.service.Accounts;

import com.password.passwordManager.model.Accounts;
import com.password.passwordManager.repository.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;

import java.util.List;

public class AccountsImpl implements AccountsInt{
    @Autowired
    private AccountRepository accountRepository;

    @Override
    public Accounts saveUser(Accounts account) {
        // Check if exist
        Example<Accounts> userItemExample = Example.of(account);
        if (accountRepository.exists(userItemExample)) {
            return null;
        }
        return accountRepository.save(account);
    }

    @Override
    public Accounts fetchUser(String idAccount) {
        return accountRepository.findById(idAccount).get();
    }

    @Override
    public List<Accounts> fetchAllUsers() {
        return accountRepository.findAll();
    }

    @Override
    public Accounts updateUser(Accounts account) {
        return null;
    }

    @Override
    public boolean deleteUser(String idAccount) {
        return false;
    }
}
