package com.password.passwordManager.service.Accounts;

import com.password.passwordManager.model.Accounts;

import java.util.List;

public interface AccountsInt {
    public Accounts saveAccount(Accounts account);
    public Accounts fetchAccount(String idAccount);
    public List<Accounts> fetchAllAccounts();
    public Accounts updateAccount(String idAccount, Accounts account);
    public boolean deleteAccount(String idAccount);
}
