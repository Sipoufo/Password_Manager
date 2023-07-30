package com.password.passwordManager.service.Users;

import java.util.List;

public interface UsersInt {
    public UsersInt saveUser(UsersInt user);
    public UsersInt fetchUser(String idUsers);
    public List<UsersInt> fetchAllUsers();
    public UsersInt updateUser(UsersInt user);
    public boolean deleteUser(String idUsers);
}
