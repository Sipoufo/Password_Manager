package com.password.passwordManager.service.Auth;

import com.password.passwordManager.model.AuthenticationResponse;
import com.password.passwordManager.model.LoginRequest;
import com.password.passwordManager.model.RegisterRequest;
import com.password.passwordManager.model.Users;
import com.password.passwordManager.repository.UserRepository;
import com.password.passwordManager.service.JWT.JWTInt;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class AuthenticateServiceImpl implements AuthenticationInt {
    @Autowired
    private UserRepository usersRepository;
    private final PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
    private final JWTInt jwtService;
    private final AuthenticationManager authenticationManager;

    public AuthenticationResponse register(RegisterRequest request) {
        var user = Users
                .builder()
                .name(request.getName())
                .email(request.getEmail())
                .password(passwordEncoder.encode(request.getPassword()))
                .build();
        usersRepository.save(user);
        var jwtToken = jwtService.generateToken(user);
        return AuthenticationResponse
                .builder()
                .token(jwtToken)
                .build();
    }

    @Override
    public AuthenticationResponse login(LoginRequest request) {
        System.out.print(request.getEmail());
        System.out.print(request.getPassword());
        authenticationManager.authenticate(
            new UsernamePasswordAuthenticationToken(
                request.getEmail(),
                request.getPassword()
            )
        );
        var user = usersRepository
                .findByEmail(request.email);

        var jwtToken = jwtService.generateToken(user);
        return AuthenticationResponse
                .builder()
                .token(jwtToken)
                .build();
    }
}
