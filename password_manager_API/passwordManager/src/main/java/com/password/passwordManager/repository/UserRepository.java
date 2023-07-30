package com.password.passwordManager.repository;

import com.password.passwordManager.model.Users;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface UserRepository extends MongoRepository<Users, String> {
}
