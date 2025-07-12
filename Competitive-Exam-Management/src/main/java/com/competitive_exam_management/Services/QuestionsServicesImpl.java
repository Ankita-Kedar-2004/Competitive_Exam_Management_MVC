package com.competitive_exam_management.Services;

import java.util.Arrays;
import java.util.List;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.competitive_exam_management.Dto.ExamDto;
import com.competitive_exam_management.Dto.QuestionsDto;

import ServicesInterface.QuestionsInterface;

@Service
public class QuestionsServicesImpl implements QuestionsInterface{

	@Override
	public QuestionsDto registerQuestions(QuestionsDto questionsDto) {
		String API_URL = "http://localhost:8282/registerQuestions";
		
	        RestTemplate restTemplate = new RestTemplate();

		        HttpHeaders headers = new HttpHeaders();
		        headers.setContentType(MediaType.APPLICATION_JSON);

		        HttpEntity<QuestionsDto> request = new HttpEntity<>(questionsDto, headers);
		         try {
		       
		        	QuestionsDto response = restTemplate.postForObject(API_URL, request, QuestionsDto.class);
		        	if(response!=null) {
		            return response;
		        	}
		        	  }catch(Exception e) {  }
		return null;
		
	}

	
	
	@Override
	public List<QuestionsDto> getAllQuestions() {
		String API_URL = "http://localhost:8282/viewQuestions";
		 RestTemplate restTemplate = new RestTemplate();

	        HttpHeaders headers = new HttpHeaders();
	        headers.setContentType(MediaType.APPLICATION_JSON);
	        QuestionsDto[] response = restTemplate.getForObject(API_URL, QuestionsDto[].class);
      return Arrays.asList(response);

	}



	@Override
	public QuestionsDto updateQuestions(int id) {
		String API_URL = "http://localhost:8282/questions_update/"+id;
	    System.out.println(id);
			 RestTemplate restTemplate = new RestTemplate();
			    
			    try {
			    	QuestionsDto response = restTemplate.getForObject(API_URL, QuestionsDto.class);
			        return response;
			    } catch (Exception e) {
			        System.err.println("Error calling API: " + e.getMessage());
			        return null;
			    }
	}



	@Override
	public QuestionsDto questionsUpdate(QuestionsDto questionsDto) {

		String API_URL = "http://localhost:8282/questions_update_data";
		   
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
