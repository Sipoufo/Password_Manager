package com.password.passwordManager.service.Accounts;

import com.password.passwordManager.model.Accounts;
import com.password.passwordManager.repository.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AccountsImpl implements AccountsInt{
    @Autowired
    private AccountRepository accountRepository;

    @Override
    public Accounts saveAccount(Accounts account) {
        Accounts accounts = accountRepository.findByLink(account.getLink());
        // Check if exist
        if (accounts == null) {
            return accountRepository.save(account);
        }
        return null;
    }

    @Override
    public Accounts fetchAccount(String idAccount) {
        return accountRepository.findById(idAccount).get();
    }

    @Override
    public List<Accounts> fetchAllAccounts() {
        return accountRepository.findAll();
    }

    @Override
    public Accounts updateAccount(String idAccount, Accounts account) {
        Accounts accounts = accountRepository.findById(idAccount).get();
        if (accounts == null) {
            return null;
        }

        accounts.setDate(account.getDate());
        accounts.setLink(account.getLink());
        accounts.setPassword(account.getPassword());

        return accountRepository.save(accounts);
    }

    @Override
    public boolean deleteAccount(String idAccount) {
        Accounts accounts = accountRepository.findById(idAccount).get();
        if (accounts == null) {
            return false;
        }
        accountRepository.deleteById(idAccount);
        return true;
    }
}
