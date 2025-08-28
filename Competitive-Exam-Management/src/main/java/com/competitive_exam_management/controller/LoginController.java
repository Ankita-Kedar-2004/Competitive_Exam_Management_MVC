package com.competitive_exam_management.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {
	
	@GetMapping("/")
    public String loginpage() {
        return "login"; 
    }
}
