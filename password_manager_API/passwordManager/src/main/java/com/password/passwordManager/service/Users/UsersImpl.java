package com.password.passwordManager.service.Users;

import com.password.passwordManager.model.Accounts;
import com.password.passwordManager.model.Users;
import com.password.passwordManager.repository.AccountRepository;
import com.password.passwordManager.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UsersImpl implements UsersInt {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private AccountRepository accountRepository;

    @Override
    public Users saveUser(Users user) {
        Users user1 = userRepository.findByEmail(user.getEmail());
        // Check if exist
        if (user1 == null) {
            return userRepository.save(user);
        }
        return null;
    }

    @Override
    public Users fetchUser(String idUsers) {
        return userRepository.findById(idUsers).get();
    }

    @Override
    public List<Users> fetchAllUsers() {
        return userRepository.findAll();
    }

    @Override
    public Users updateUser(String idUsers, Users user) {
        Users user1 = userRepository.findById(idUsers).get();
        if (user1 == null) {
            return null;
        }

        user1.setEmail(user.getEmail() == null ? user1.getEmail() : user.getEmail());
        user1.setName(user.getName() == null ? user1.getName() : user.getName());
        user1.setPicture(user.getPicture() == null ? user1.getPicture() : user.getPicture());
        user1.setAccounts(user.getAccounts() == null ? user1.getAccounts() : user.getAccounts());

        return userRepository.save(user1);
    }

    @Override
    public boolean deleteUser(String idUsers) {
        Users user1 = userRepository.findById(idUsers).get();
        if (user1 == null) {
            return false;
        }
        userRepository.deleteById(idUsers);
        return true;
    }

    public Users fetchByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    @Override
    public Users createNewAccount(String idUser, Accounts account) {
        Accounts account1 = accountRepository.save(account);

        Users user = userRepository.findById(idUser).get();

        List<Accounts> accounts =  user.getAccounts();
        accounts.add(account1);

        user.setAccounts(accounts);

        return userRepository.save(user);
    }

    @Override
    public boolean deleteAccount(String idUser, String idAccount) {
        accountRepository.deleteById(idAccount);

        Users user = userRepository.findById(idUser).get();

        Accounts account = accountRepository.findById(idAccount).get();

        List<Accounts> accounts =  user.getAccounts();
        accounts.remove(account);

        return true;
    }
}
