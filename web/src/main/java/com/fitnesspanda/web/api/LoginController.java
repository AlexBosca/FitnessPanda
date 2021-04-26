package com.fitnesspanda.web.api;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {

    @GetMapping(path = "")
    public String viewHomePage() {
        return "index";
    }
}
