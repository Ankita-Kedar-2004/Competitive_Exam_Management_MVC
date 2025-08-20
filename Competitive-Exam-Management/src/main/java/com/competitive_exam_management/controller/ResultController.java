package com.competitive_exam_management.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.competitive_exam_management.Dto.QuestionsResponseDto;

import ServicesInterface.AssignQuestionsInterface;
import ServicesInterface.ResultInterface;

@Controller
@RequestMapping("/result")
public class ResultController {
	
	@Autowired
	private ResultInterface resultInterface;
	
	@Autowired
	private AssignQuestionsInterface assignQuestionsInterface;
	
	@PostMapping("/submitExam")
	public String viewResult( @RequestParam("studentId") int studentId,@RequestParam("examId") int examId, @RequestParam Map<String, String> allParams,Model model)
	{
		Map<Integer, String> answers = new HashMap<>();
	    for (Map.Entry<String, String> entry : allParams.entrySet()) {
	        if (entry.getKey().startsWith("answers[")) {
	            String qIdStr = entry.getKey().substring(8, entry.getKey().length() - 1);
	            int qId = Integer.parseInt(qIdStr);
	            answers.put(qId, entry.getValue()); 
	        }
	    }
	    int score = resultInterface.evaluateExam(studentId, examId, answers);
	    
	    
	    List<QuestionsResponseDto> assignQuestions = assignQuestionsInterface.assignQuestions(studentId, examId);
	    for (QuestionsResponseDto q : assignQuestions) {
	        String studentAnswer = answers.get(q.getQuestionId());
	        if(studentAnswer == null) studentAnswer = "Not Answered"; 
	        q.setStudentAnswer(studentAnswer);
	    }
	    
	    
         model.addAttribute("score", score);
         model.addAttribute("questions", assignQuestions);
	    return "ExamResult";
}
}
