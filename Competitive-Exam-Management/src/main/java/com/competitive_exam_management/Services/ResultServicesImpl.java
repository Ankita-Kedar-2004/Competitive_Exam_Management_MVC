package com.competitive_exam_management.Services;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.competitive_exam_management.Dto.QuestionsResponseDto;

import ServicesInterface.ResultInterface;

@Service
public class ResultServicesImpl implements ResultInterface{

	@Override
	public int evaluateExam(int studentId, int examId, Map<Integer, String> answers) {
	    String API_URL = "http://localhost:8282/result/evaluateExam/" + studentId + "/" + examId;

	    RestTemplate restTemplate = new RestTemplate();
	    try {
	        Map<String, String> stringKeyMap = new HashMap<>();
	        for (Map.Entry<Integer, String> entry : answers.entrySet()) {
	            stringKeyMap.put(entry.getKey().toString(), entry.getValue());
	        }
	        int result=restTemplate.postForObject(API_URL, stringKeyMap, Integer.class);
            		 return result;
	    } catch (Exception e) {
	        System.err.println("Error calling API: " + e.getMessage());
	        return 0;
	    }
	}
	

}
