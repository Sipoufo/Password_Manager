package com.password.passwordManager.repository;

import com.password.passwordManager.model.Accounts;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface AccountRepository extends MongoRepository<Accounts, String> {
    public Accounts findByLink(String link);
}
