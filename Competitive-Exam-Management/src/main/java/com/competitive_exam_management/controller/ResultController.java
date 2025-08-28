package com.competitive_exam_management.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.competitive_exam_management.Dto.QuestionsResponseDto;
import com.competitive_exam_management.Dto.ResultRespDto;

import ServicesInterface.AssignQuestionsInterface;
import ServicesInterface.ResultInterface;

@Controller
@RequestMapping("/result")
@SessionAttributes("questions")  
public class ResultController {
	
	@Autowired
	private ResultInterface resultInterface;
	
	@PostMapping("/submitExam")
	public String viewResult(@RequestParam("studentId") int studentId,
	                         @RequestParam("examId") int examId,
	                         @RequestParam Map<String, String> allParams,
	                         Model model) {
	    
	    Map<Integer, String> answers = new HashMap<>();
	    for (Map.Entry<String, String> entry : allParams.entrySet()) {
	        if (entry.getKey().startsWith("answers[")) {
	            String qIdStr = entry.getKey().substring(8, entry.getKey().length() - 1);
	            int qId = Integer.parseInt(qIdStr);
	            answers.put(qId, entry.getValue()); 
	        }
	    }
	    
	  
	    int score = resultInterface.evaluateExam(studentId, examId, answers);
	    
	    model.addAttribute("score", score);
	    return "ExamResult";
	}
	
	@GetMapping("/viewAllResult")
	public String viewResult( Model model,HttpSession session) {
		String role=(String) session.getAttribute("userRole");
		
            
            if("Student".equals(role)) {
            	String userIdStr = (String) session.getAttribute("userId");
        		int id = Integer.parseInt(userIdStr);
            	List<ResultRespDto> result=resultInterface.viewResultById(id);
            	model.addAttribute("result",result);
            }
            else {
            	List<ResultRespDto> result=resultInterface.viewResult();
            	model.addAttribute("result",result);
            }
       
        return "ViewAllResults";
}
	
}