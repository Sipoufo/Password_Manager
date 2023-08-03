package com.password.passwordManager.model;

import lombok.*;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.util.Date;

@Document("accounts")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Builder
public class Accounts {
    @Id
    private String id;
    private String name;
    private String link;
    private String username;
    private String password;
}
