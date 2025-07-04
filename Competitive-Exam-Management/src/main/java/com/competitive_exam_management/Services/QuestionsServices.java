package com.competitive_exam_management.Services;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.competitive_exam_management.Dto.ExamDto;
import com.competitive_exam_management.Dto.QuestionsDto;
import com.competitive_exam_management.ServicesInterface.QuestionsInterface;

@Service
public class QuestionsServices implements QuestionsInterface{

	@Override
	public QuestionsDto registerQuestions(QuestionsDto questionsDto) {
		String API_URL = "http://localhost:8282/registerQuestions";
		;
	 
			 RestTemplate restTemplate = new RestTemplate();

		        HttpHeaders headers = new HttpHeaders();
		        headers.setContentType(MediaType.APPLICATION_JSON);

		        HttpEntity<QuestionsDto> request = new HttpEntity<>(questionsDto, headers);
		        
		        try {
		       
		        	QuestionsDto response = restTemplate.postForObject(API_URL, request, QuestionsDto.class);
		        	if(response!=null) {
		            return response;
		        	}
		        	
		        }catch(Exception e) {
		        	
		        	
		        }
		return null;
		
	}

}
