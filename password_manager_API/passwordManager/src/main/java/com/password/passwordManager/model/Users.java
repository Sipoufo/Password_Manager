package com.password.passwordManager.model;

import lombok.*;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;

import java.util.List;

@Document("users")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Builder
public class Users {
    @Id
    private String id;
    private String name;
    private String email;
    private String password;
    private String picture;
    @DBRef
    private List<Accounts> accounts;
}
