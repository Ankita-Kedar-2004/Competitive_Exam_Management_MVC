package com.competitive_exam_management.Services;

import java.util.Arrays;
import java.util.List;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.competitive_exam_management.Dto.ExamDto;
import com.competitive_exam_management.Dto.StudentDto;

import ServicesInterface.ExamInterface;

@Service
public class ExamServicesImpl implements ExamInterface{

	@Override
	public ExamDto registerExam(ExamDto examDto) {
		String API_URL = "http://localhost:8282/exam/registerExam";
		System.out.println(examDto.getExamName());
	 
			 RestTemplate restTemplate = new RestTemplate();

		        HttpHeaders headers = new HttpHeaders();
		        headers.setContentType(MediaType.APPLICATION_JSON);

		        HttpEntity<ExamDto> request = new HttpEntity<>(examDto, headers);
		        
		        try {
		       
		        	ExamDto response = restTemplate.postForObject(API_URL, request, ExamDto.class);
		        	if(response!=null) {
		            return response;
		        	}
		        	
		        }catch(Exception e) {
		        	
		        	
		        }
		return null;
	}

	@Override
	public List<ExamDto> getAllExamName() {
		String API_URL = "http://localhost:8282/exam/Exam_view";
		 RestTemplate restTemplate = new RestTemplate();

	        HttpHeaders headers = new HttpHeaders();
	        headers.setContentType(MediaType.APPLICATION_JSON);
	        ExamDto[] response = restTemplate.getForObject(API_URL, ExamDto[].class);
       return Arrays.asList(response);
	}

	@Override
	public ExamDto updateExam(int id) {
		String API_URL = "http://localhost:8282/exam/exam_update/"+id;
	    System.out.println(id);
			 RestTemplate restTemplate = new RestTemplate();
			    
			    try {
			    	ExamDto response = restTemplate.getForObject(API_URL, ExamDto.class);
			        return response;
			    } catch (Exception e) {
			        System.err.println("Error calling API: " + e.getMessage());
			        return null;
			    }
	}

	
	@Override
	public ExamDto examUpdate(ExamDto examDto) {
		String API_URL = "http://localhost:8282/exam/exam_update";
		   
		 RestTemplate restTemplate = new RestTemplate();

	        HttpHeaders headers = new HttpHeaders();
	        headers.setContentType(MediaType.APPLICATION_JSON);

	        HttpEntity<ExamDto> request = new HttpEntity<>(examDto, headers);
	        
	        try {
	       
	        	ExamDto response = restTemplate.postForObject(API_URL, request, ExamDto.class);
	        	if(response!=null) {
	            return response;
	        	}
	        	
	        }catch(Exception e) {
	        	
	        	
	        }
			return null;
	}

	@Override
	public int deleteExamById(int id) {
		String API_URL = "http://localhost:8282/exam/exam_delete/"+id;
			 RestTemplate restTemplate = new RestTemplate();
			    
			    try {
			        int response = restTemplate.getForObject(API_URL, Integer.class);
			        return response;
			    } catch (Exception e) {
			        System.err.println("Error calling API: " + e.getMessage());
			        return 0;
			    }
	        
	}

}
