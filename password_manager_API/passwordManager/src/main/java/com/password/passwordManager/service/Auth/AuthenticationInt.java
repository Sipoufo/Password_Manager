package com.password.passwordManager.service.Auth;

import com.password.passwordManager.model.AuthenticationResponse;
import com.password.passwordManager.model.LoginRequest;
import com.password.passwordManager.model.RegisterRequest;

public interface AuthenticationInt {
    public AuthenticationResponse register(RegisterRequest request);
    public AuthenticationResponse login(LoginRequest request);
}
