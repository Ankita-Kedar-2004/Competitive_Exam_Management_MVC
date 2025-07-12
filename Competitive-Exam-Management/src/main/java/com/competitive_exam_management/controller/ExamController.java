package com.competitive_exam_management.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.competitive_exam_management.Dto.ExamDto;
import com.competitive_exam_management.Dto.StudentDto;

import ServicesInterface.ExamInterface;

@Controller
public class ExamController {
	@Autowired
	ExamInterface examInterface;
	

	@GetMapping("/addExam")
	public String AddExamPage(){
		return "Exam_Registration";
		
	}
	
@PostMapping("/registerExam")
	public String registerExam(@ModelAttribute ExamDto examDto,RedirectAttributes redirectAttributes){
		ExamDto success = examInterface.registerExam(examDto);
 		redirectAttributes.addFlashAttribute("successMsg", "Exam List Successfully Updated!");
 		return  "redirect:/Exam_View";
		}

@GetMapping("/updateExam/{id}")
    public String updateExam(@PathVariable int id,Model model){
	ExamDto success = examInterface.updateExam(id);    
	model.addAttribute("exam", success);
	return  "Exam-Update";
	}

@GetMapping("/Exam_View")
    public String viewExams(Model model) {
    List<ExamDto> exam = examInterface.getAllExamName();
    
    model.addAttribute("exams", exam);
   

    return "Exam-View"; 
}

@PostMapping("/exam_update")
public String examUpdateData(@ModelAttribute ExamDto examDto,RedirectAttributes redirectAttributes) {
	 System.out.println(examDto.getExamId());
	 ExamDto success = examInterface.examUpdate(examDto);
	 redirectAttributes.addFlashAttribute("successMsg", "Exam List Successfully Updated!");
	 return "redirect:/Exam_View";
	 
}
}
