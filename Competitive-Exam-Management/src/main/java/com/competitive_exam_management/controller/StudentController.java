package com.competitive_exam_management.controller;

import java.time.Year;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.competitive_exam_management.Dto.QuestionsResponseDto;
import com.competitive_exam_management.Dto.StudentDto;
import com.competitive_exam_management.Services.StudentServicesImpl;

import ServicesInterface.AssignQuestionsInterface;
import ServicesInterface.ResultInterface;
import ServicesInterface.StudentInterface;

@Controller
@RequestMapping("/student")
public class StudentController {
	
	@Autowired
	private StudentInterface studentInterface;

	 @GetMapping("/student_registration")
	    public String studentRegistration() {
	        return "Student_Registration"; 
	    }
	

	    @GetMapping("/student_view")
	    public String viewStudents(Model model) {
	        List<StudentDto> students = studentInterface.getAllStudents();
	        model.addAttribute("students", students);
	        return "Student-View"; 
	    }

	    
		@GetMapping("/student_update/{id}")
		public String studentUpdate(@PathVariable int id, Model model) {
			StudentDto student = studentInterface.getStudentById(id);
		    model.addAttribute("student", student);
            return "Student-Update"; 
	    }
		
		@GetMapping("/student_delete/{id}")
		public String studentDelete(@PathVariable int id) {
			StudentDto student = studentInterface.deleteStudentById(id);
			return "redirect:/student/student_view";	    }
	 
	    @PostMapping("/student_save")
	    public String registerStudent(@ModelAttribute StudentDto studentDto,RedirectAttributes redirectAttributes) {
	 		StudentDto success = studentInterface.studentRegistration(studentDto);
	 		redirectAttributes.addFlashAttribute("successMsg", "Student List Successfully Updated!");
	 		return "redirect:/student/student_view";
	    }


     @PostMapping("/student_update")
     public String studentUpdateData(@ModelAttribute StudentDto studentDto,RedirectAttributes redirectAttributes) {
    	 StudentDto success = studentInterface.studentUpdate(studentDto);
  		redirectAttributes.addFlashAttribute("successMsg", "Student List Successfully Updated!");
	 return "redirect:/student/student_view";
    	 
     }
     
     @GetMapping("/student_profile")
     public String studentProfieData(Model model,HttpSession session) {
    	   String userEmail=(String) session.getAttribute("useremail");
    	 StudentDto student = studentInterface.studentProfieData(userEmail);
    	 model.addAttribute("student", student);
	 return "StudentProfile";
    	 
     }
     }
