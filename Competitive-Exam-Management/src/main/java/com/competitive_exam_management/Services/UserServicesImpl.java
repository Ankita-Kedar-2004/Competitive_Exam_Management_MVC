package com.competitive_exam_management.Services;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.competitive_exam_management.Dto.StudentDto;
import com.competitive_exam_management.Dto.UserDto;
import com.competitive_exam_management.Dto.UserLoginDto;
import com.competitive_exam_management.Dto.UserLoginRespDto;

import ServicesInterface.UserInterface;

@Service
public class UserServicesImpl implements UserInterface {

    
    @Override
    public String userDto(UserDto userDto) {
    	String API_URL = "http://localhost:8282/Sign_up";

    	System.out.println(userDto.getEmail());
        RestTemplate restTemplate = new RestTemplate();

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        HttpEntity<UserDto> request = new HttpEntity<>(userDto, headers);

        try {
            ResponseEntity<String> response = restTemplate.postForEntity(API_URL, request, String.class);
            return response.getBody();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    @Override
	public UserLoginRespDto userLoginDto(UserLoginDto userLoginDto,HttpSession session) {
    	String API_URL = "http://localhost:8282/login";
    
       System.out.println(userLoginDto.getPassword());
		 RestTemplate restTemplate = new RestTemplate();

	        HttpHeaders headers = new HttpHeaders();
	        headers.setContentType(MediaType.APPLICATION_JSON);

	        HttpEntity<UserLoginDto> request = new HttpEntity<>(userLoginDto, headers);
	        
	        try {
	       
	        	UserLoginRespDto response = restTemplate.postForObject(API_URL, request, UserLoginRespDto.class);
	        	if(response!=null) {
	            return response;
	        	}
	        	
	        }catch(Exception e) {
	        	
	        	
	        }
			return null;
	        
	}

	
}
