package com.password.passwordManager.service.Users;

import com.password.passwordManager.model.Users;

import java.util.List;

public interface UsersInt {
    public Users saveUser(Users user);
    public Users fetchUser(String idUsers);
    public List<Users> fetchAllUsers();
    public Users updateUser(String idUsers, Users user);
    public boolean deleteUser(String Users);
    public Users fetchByEmail(String email);
}
