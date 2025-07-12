package com.competitive_exam_management.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.competitive_exam_management.Dto.ExamDto;
import com.competitive_exam_management.Dto.QuestionsDto;
import com.competitive_exam_management.Dto.UserLoginRespDto;

import ServicesInterface.QuestionsInterface;

@Controller
public class QuestionsController {
     
	@Autowired
	QuestionsInterface questionsInterface;
	
	@GetMapping("/registerQuestions")
	public String registerQuestionsPage(){
		 
		return "Questions_Registration";
		
	}
	
	@PostMapping("/registerQuestionsData")
	public String registerQuestions(@ModelAttribute QuestionsDto questionsDto,HttpSession session  ){
		
		String userIdStr = (String) session.getAttribute("userId");
		Integer userId = Integer.parseInt(userIdStr);
		 questionsDto.setUserId(userId);
          
		    if (userId != null) {
		        System.out.println("Session user: " +userId );
		    } else {
		        System.out.println("No user found in session.");
		    }
		    
		    QuestionsDto success=questionsInterface.registerQuestions(questionsDto);
		
		return  "redirect:/viewQuestions";
		
	}
	
	@GetMapping("/viewQuestions")
    public String viewExams(Model model) {
    List<QuestionsDto> question = questionsInterface.getAllQuestions();
    
    model.addAttribute("questions", question);
   

    return "Questions-View"; 
}
	
	@GetMapping("/updateQuestions/{id}")
    public String updateQuestions(@PathVariable int id,Model model){
		QuestionsDto success = questionsInterface.updateQuestions(id);    
	model.addAttribute("question", success);
	return  "Questions-Update";
	}
	
	@PostMapping("/questions_update_data")
	public String examUpdateData(@ModelAttribute QuestionsDto questionsDto,RedirectAttributes redirectAttributes) {
		System.out.println("Hiii..");
		 System.out.println(questionsDto.getExamId());
		 QuestionsDto success = questionsInterface.questionsUpdate(questionsDto);
		 redirectAttributes.addFlashAttribute("successMsg", "Questions List Successfully Updated!");
		 return "redirect:/viewQuestions";
		 
	}

	
}
			