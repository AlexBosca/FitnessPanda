package com.fitnesspanda.web.api;

import com.fitnesspanda.web.dao.UserRepository;
import com.fitnesspanda.web.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class LoginController {

    @Autowired
    private UserRepository userRepo;

    //May be deleted
    @GetMapping("")
    public String viewDefaultPage() {
        return "login";
    }

    @GetMapping("/login")
    public String viewLoginPage() {
            return "login";
    }

    @GetMapping("/sign_up")
    public String viewSignUpPage(Model model) {
        model.addAttribute("user", new User());

        return "sign_up";
    }

    @GetMapping("/home")
    public String viewHomePage() {
        return "home";
    }

    @PostMapping("/process_sign_up")
    public String processSignUp(User user) {
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String encodedPassword = passwordEncoder.encode(user.getPassword());
        user.setPassword(encodedPassword);

        userRepo.save(user);

        return "sign_up_success";
    }
}
