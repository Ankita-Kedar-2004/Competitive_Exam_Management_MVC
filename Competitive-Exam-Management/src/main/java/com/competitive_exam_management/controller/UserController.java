package com.competitive_exam_management.controller;

import javax.servlet.http.HttpSession;

import org.apache.catalina.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.competitive_exam_management.Dto.StudentDto;
import com.competitive_exam_management.Dto.UserDto;
import com.competitive_exam_management.Dto.UserLoginDto;
import com.competitive_exam_management.Dto.UserLoginRespDto;
import com.competitive_exam_management.Services.UserServicesImpl;

@Controller
public class UserController {
	
	@Autowired
	private UserServicesImpl servicesImpl;
	
	    
    @GetMapping("/")
    public String loginpage() {
        return "login"; 
    }
    
    @GetMapping("/dashborad")
    public String Dashborad() {
        return "Dashborad"; 
    }
    
    
  @GetMapping("/login")
public String logindata(@ModelAttribute UserLoginDto userLoginDto ,HttpSession session) {
	  
    System.out.println(userLoginDto.getEmail());
		UserLoginRespDto success = servicesImpl.userLoginDto(userLoginDto, session);
		if(success!=null) {
			  session.setAttribute("user", success);
                UserLoginRespDto storedUser = (UserLoginRespDto) session.getAttribute("user");
		        System.out.println("Session user: " + storedUser.getEmail() + ", Role: " + storedUser.getRole());
	       return "Dashborad"; 
		}
		return "login";
		
       
    }
 
 
 
 @RequestMapping("/Sign_up")
 public String user(@ModelAttribute UserDto userDto) {
 	
 	
 	String success = servicesImpl.userDto(userDto);
 	    
 	    if (success != null) {
 	        return "redirect:/login";
 	    }
     return "login"; 
 }
 
 @GetMapping("/sign_up")
 public String signup(){
	return "sign_up";
	 
	 
 }
}
