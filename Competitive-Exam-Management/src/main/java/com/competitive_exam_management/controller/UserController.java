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
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserServicesImpl servicesImpl;
	
	      @GetMapping("/dashborad")
    public String Dashborad() {
        return "Dashborad"; 
    }
    
    
  @GetMapping("/login")
public String logindata(@ModelAttribute UserLoginDto userLoginDto ,HttpSession session) {
		UserLoginRespDto success = servicesImpl.userLoginDto(userLoginDto);
		if(success!=null) {
			String userId=String.valueOf(success.getId());
			String userEmail=success.getEmail();
			String userRole=success.getRole();
			session.setAttribute("userId", userId);
			session.setAttribute("useremail", userEmail);
			session.setAttribute("userRole", userRole);
			return "redirect:/user/dashborad";
		}
		return "login";
		
       
    }
 
 
 
 @RequestMapping("/Sign_up")
 public String user(@ModelAttribute UserDto userDto) {
 	String success = servicesImpl.userDto(userDto);
 	    
 	    if (success != null) {
 	        return "redirect:/user/login";
 	    }
     return "login"; 
 }
 
 @GetMapping("/sign_up")
 public String signup(){
	return "sign_up";
	 }
}
