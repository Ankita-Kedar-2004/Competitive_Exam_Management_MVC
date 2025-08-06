package com.competitive_exam_management.Services;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.competitive_exam_management.Dto.StudentDto;
import com.competitive_exam_management.Dto.UserLoginDto;
import com.competitive_exam_management.Dto.UserLoginRespDto;

import ServicesInterface.StudentInterface;

@Service
public class StudentServicesImpl implements StudentInterface {


	public StudentDto studentRegistration(StudentDto studentDto) {
	String API_URL = "http://localhost:8282/student/student_registration_data";
    System.out.println(studentDto.getPassword());
		 RestTemplate restTemplate = new RestTemplate();

	        HttpHeaders headers = new HttpHeaders();
	        headers.setContentType(MediaType.APPLICATION_JSON);

	        HttpEntity<StudentDto> request = new HttpEntity<>(studentDto, headers);
	        
	        try {
	       
	        	StudentDto response = restTemplate.postForObject(API_URL, request, StudentDto.class);
	        	if(response!=null) {
	            return response;
	        	}
	        	
	        }catch(Exception e) {
	        	
	        	
	        }
			return null;
	        
	}

		
	@Override
    public List<StudentDto> getAllStudents() {
		String API_URL = "http://localhost:8282/student/student_view";
		 RestTemplate restTemplate = new RestTemplate();

	        HttpHeaders headers = new HttpHeaders();
	        headers.setContentType(MediaType.APPLICATION_JSON);
        StudentDto[] response = restTemplate.getForObject(API_URL, StudentDto[].class);
        return Arrays.asList(response);
    }

    @Override
	public StudentDto getStudentById(int id) {
		String API_URL = "http://localhost:8282/student/student_update/"+id;
			 RestTemplate restTemplate = new RestTemplate();
			    
			    try {
			        StudentDto response = restTemplate.getForObject(API_URL, StudentDto.class);
			        return response;
			    } catch (Exception e) {
			        System.err.println("Error calling API: " + e.getMessage());
			        return null;
			    }
	}


	public StudentDto studentUpdate(StudentDto studentDto) {
		String API_URL = "http://localhost:8282/student/student_update";
	   
			 RestTemplate restTemplate = new RestTemplate();

		        HttpHeaders headers = new HttpHeaders();
		        headers.setContentType(MediaType.APPLICATION_JSON);

		        HttpEntity<StudentDto> request = new HttpEntity<>(studentDto, headers);
		        
		        try {
		       
		        	StudentDto response = restTemplate.postForObject(API_URL, request, StudentDto.class);
		        	if(response!=null) {
		            return response;
		        	}
		        	
		        }catch(Exception e) {
		        	
		        	
		        }
				return null;
		        
	}

@Override
	public int deleteStudentById(int id) {
		String API_URL = "http://localhost:8282/student/student_delete/"+id;
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
