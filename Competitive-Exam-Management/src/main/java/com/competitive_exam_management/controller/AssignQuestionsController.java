package com.competitive_exam_management.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.competitive_exam_management.Dto.QuestionsResponseDto;
import com.competitive_exam_management.Services.AssignQuestionServiceImpl;

import ServicesInterface.AssignQuestionsInterface;

@Controller
@RequestMapping("/assignQuestions")
public class AssignQuestionsController { 
	
	@Autowired
	private AssignQuestionsInterface assignQuestionsInterface;
	
	@GetMapping("/assignQuestionspage")
	public String assignQuestionPage() {
		return "AssignQuestions";
		
	}

	@PostMapping("/assignQuestions")
	public String assignQuestion(@RequestParam int studentId,@RequestParam int examId,Model model) {
		List <QuestionsResponseDto> assignQuestions = assignQuestionsInterface.assignQuestions(studentId,examId);
		for (QuestionsResponseDto assignQuestion:assignQuestions) {
			System.out.println(assignQuestion);
		}
		model.addAttribute("questions", assignQuestions);
		return "AssignQuestionsView";
		
	}
}
