package com.competitive_exam_management.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {
	
	 @GetMapping("/index")
	    public String index() {
	        return "index"; 
	    }
	 
	 @GetMapping("/login")
	    public String loginpage() {
	        return "login"; 
	    }
	    
	 @RequestMapping("/Login")
	    public String logindata(@RequestParam("email")String email,@RequestParam("password")String password,@RequestParam("role")String role) {
	    	System.out.println(email);
	    	System.out.println(password);
	    	System.out.println(role);
	        return "login"; 
	    }

    @GetMapping("/sign_up")
    public String home() {
        return "sign_up";
    }
    
    @RequestMapping("/Sign_up")
    public String sign_updata(@RequestParam("email")String email,@RequestParam("password")String password,@RequestParam("role")String role) {
    	System.out.println(email);
    	System.out.println(password);
    	System.out.println(role);
        return "sign_up"; 
    }
    
    @GetMapping("/dash")
    public String dash() {
        return "dash"; 
    }
}