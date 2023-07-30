package com.password.passwordManager.service.Accounts;

import com.password.passwordManager.model.Accounts;

import java.util.List;

public interface AccountsInt {
    public Accounts saveUser(Accounts account);
    public Accounts fetchUser(String idAccount);
    public List<Accounts> fetchAllUsers();
    public Accounts updateUser(Accounts account);
    public boolean deleteUser(String idAccount);
}
