package com.competitive_exam_management.Services;

import java.util.Arrays;
import java.util.List;

import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.competitive_exam_management.Dto.QuestionsResponseDto;
import com.competitive_exam_management.Dto.StudentDto;

import ServicesInterface.AssignQuestionsInterface;

@Service
public class AssignQuestionServiceImpl implements AssignQuestionsInterface{

	@Override
	public List<QuestionsResponseDto> assignQuestions(int studentId, int examId) {
		 String API_URL = "http://localhost:8282/assignQuestion/random/" + studentId + "/" + examId;
		    RestTemplate restTemplate = new RestTemplate();
		    try {  
		    	QuestionsResponseDto[] response = restTemplate.getForObject(API_URL, QuestionsResponseDto[].class);
		      return Arrays.asList(response);
		    } catch (Exception e) {
		        System.err.println("Error calling API: " + e.getMessage());
		        return null;
		    }
	}

}
