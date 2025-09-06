package com.competitive_exam_management.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {
	
	@GetMapping("/")
    public String loginpage() {
        return "login"; 
    }
	
	@GetMapping("/logout")
	public String logoutpage(HttpSession session) {
	    if (session != null) {
	        session.invalidate(); // destroy session
	    }
	    return "redirect:/"; // redirect to login.jsp
	}
}
