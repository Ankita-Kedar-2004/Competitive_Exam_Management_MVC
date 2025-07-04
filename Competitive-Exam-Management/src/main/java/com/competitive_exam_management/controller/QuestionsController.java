package com.competitive_exam_management.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.competitive_exam_management.Dto.QuestionsDto;
import com.competitive_exam_management.ServicesInterface.QuestionsInterface;

@Controller
public class QuestionsController {
     
	@Autowired
	QuestionsInterface questionsInterface;
	
	@GetMapping("/registerQuestions")
	public String registerQuestionsPage(){
		return "Questions_Registration";
		
	}
	
	@GetMapping("/registerQuestionsData")
	public String registerQuestions(@ModelAttribute QuestionsDto questionsDto ){
		QuestionsDto success=questionsInterface.registerQuestions(questionsDto);
		return "Questions_View";
		
	}
}
