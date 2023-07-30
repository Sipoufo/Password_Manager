package com.password.passwordManager.controller;

import com.password.passwordManager.model.AuthenticationResponse;
import com.password.passwordManager.model.LoginRequest;
import com.password.passwordManager.model.RegisterRequest;
import com.password.passwordManager.service.Auth.AuthenticationInt;
import com.password.passwordManager.service.JWT.JWTInt;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@CrossOrigin(origins = "*", allowedHeaders = "*")
@RequestMapping("/auth")
@RequiredArgsConstructor
public class AuthenticationController {
    private final AuthenticationInt authenticationService;
    private final JWTInt jwtService;
    @PostMapping("/login")
    public ResponseEntity<AuthenticationResponse> login(
            @RequestBody LoginRequest request
    ){
        System.out.println(request.password);
        return ResponseEntity.ok(authenticationService.login(request));
    }

    @PostMapping("/register")
    public ResponseEntity<AuthenticationResponse> register(
            @RequestBody RegisterRequest request
    ){
        System.out.println(request.password);
        return ResponseEntity.ok(authenticationService.register(request));
    }
}
