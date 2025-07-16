package com.competitive_exam_management.controller;

import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.competitive_exam_management.Dto.ExamDto;
import com.competitive_exam_management.Dto.QuestionsDto;
import com.competitive_exam_management.Dto.QuestionsResponseDto;
import com.competitive_exam_management.Dto.UserLoginRespDto;

import ServicesInterface.QuestionsInterface;
@RequestMapping("/question")
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
		int userId = Integer.parseInt(userIdStr);
		 questionsDto.setUserId(userId);
		    QuestionsDto success=questionsInterface.registerQuestions(questionsDto);
		    return "redirect:/question/viewQuestions";
		}
	
	@GetMapping("/viewQuestions")
    public String viewExams(Model model) {
    List<QuestionsResponseDto> question = questionsInterface.getAllQuestions();
    model.addAttribute("questions", question);
    Set<String> examNames = question.stream()
            .map(QuestionsResponseDto::getExamName)
            .collect(Collectors.toSet());
    model.addAttribute("examNames", examNames);
    return "Questions-View"; 
}
	
	@GetMapping("/updateQuestions/{id}")
    public String updateQuestions(@PathVariable int id,Model model){
		QuestionsResponseDto success = questionsInterface.updateQuestions(id);  
		
	      model.addAttribute("question", success);
	return  "Questions-Update";
	}
	
	@PostMapping("/questions_update_data")
	public String questionsUpdateData(@ModelAttribute QuestionsDto questionsDto, RedirectAttributes redirectAttributes) {
	    questionsInterface.questionsUpdate(questionsDto); 
	    redirectAttributes.addFlashAttribute("successMsg", "Question Updated Successfully!");
	    return "redirect:/question/viewQuestions";
	}
	
	@GetMapping("/deleteQuestions/{id}")
    public String deleteQuestions(@PathVariable int id ,RedirectAttributes redirectAttributes){
		boolean success = questionsInterface.deleteQuestions(id);    
		redirectAttributes.addFlashAttribute("successMsg", "Question Deleted Successfully!");
	    return "redirect:/question/viewQuestions";
	}
}
		