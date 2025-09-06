package com.competitive_exam_management.controller;

import javax.servlet.http.HttpSession;

import org.apache.catalina.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	      @GetMapping("/admin-dashborad")
            public String AdminDashborad() {
        return "Admin-Dashborad"; 
    }
	      
	      @GetMapping("/student-dashborad")
	      public String StudentDashborad() {
	          return "Student-Dashboard"; 
	      }
	     
	      @GetMapping("/dashborad")
          public String Dashborad(HttpSession session) {
	    	  String userRole=(String) session.getAttribute("userRole");
	    		if ("Admin".equalsIgnoreCase(userRole)) {
        	 		return "redirect:/user/admin-dashborad";   
        	 	} else if ("Student".equalsIgnoreCase(userRole)) {
        	 		return "redirect:/user/student-dashborad";
        	 	}
				return "redirect:/user/student-dashborad";
      
  }
    
  @GetMapping("/login")
  public String logindata(@ModelAttribute UserLoginDto userLoginDto, HttpSession session,  Model model) {
         UserLoginRespDto success = servicesImpl.userLoginDto(userLoginDto);

         if (success != null) {
        	 	String userId = String.valueOf(success.getId());
        	 	String userEmail = success.getEmail();
        	 	String userRole = success.getRole();

        	 	session.setAttribute("userId", userId);
        	 	session.setAttribute("useremail", userEmail);
        	 	session.setAttribute("userRole", userRole);

        	 	if ("Admin".equalsIgnoreCase(userRole)) {
        	 		return "redirect:/user/admin-dashborad";   
        	 	} else if ("Student".equalsIgnoreCase(userRole)) {
        	 		return "redirect:/user/student-dashborad";
        	 	}

         }

         // If login fails
         model.addAttribute("error", "Invalid email or password!");
         return "login"; // return back to login.jsp
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
