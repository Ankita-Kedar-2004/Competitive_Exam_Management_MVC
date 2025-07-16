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

import com.competitive_exam_management.Dto.StudentDto;
import com.competitive_exam_management.Services.StudentServicesImpl;

@Controller

public class StudentController {
	
	@Autowired
	private StudentServicesImpl servicesImpl;

	 @GetMapping("/student_registration")
	    public String studentRegistration() {
	        return "Student_Registration"; 
	    }
	

	    @GetMapping("/student_view")
	    public String viewStudents(Model model) {
	        List<StudentDto> students = servicesImpl.getAllStudents();
	        model.addAttribute("students", students);
	        return "Student-View"; 
	    }

	    
		@GetMapping("/student_update/{id}")
		public String studentUpdate(@PathVariable int id, Model model) {
			StudentDto student = servicesImpl.getStudentById(id);
		    model.addAttribute("student", student);
            return "Student-Update"; 
	    }
		
		@GetMapping("/student_delete/{id}")
		public String studentDelete(@PathVariable int id) {
			StudentDto student = servicesImpl.deleteStudentById(id);
			return "redirect:/student_view";	    }
	 
	    @PostMapping("/student_save")
	    public String registerStudent(@ModelAttribute StudentDto studentDto,RedirectAttributes redirectAttributes) {
	 		StudentDto success = servicesImpl.studentRegistration(studentDto);
	 		redirectAttributes.addFlashAttribute("successMsg", "Student List Successfully Updated!");
	 		return "redirect:/student_view";
	    }


     @PostMapping("/student_update")
     public String studentUpdateData(@ModelAttribute StudentDto studentDto,RedirectAttributes redirectAttributes) {
    	 StudentDto success = servicesImpl.studentUpdate(studentDto);
  		redirectAttributes.addFlashAttribute("successMsg", "Student List Successfully Updated!");
	 return "redirect:/student_view";
    	 
     }
     }
