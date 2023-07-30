package com.password.passwordManager.repository;

import com.password.passwordManager.model.Accounts;
import com.password.passwordManager.model.Users;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface UserRepository extends MongoRepository<Users, String> {
    public Users findByEmail(String email);
}
