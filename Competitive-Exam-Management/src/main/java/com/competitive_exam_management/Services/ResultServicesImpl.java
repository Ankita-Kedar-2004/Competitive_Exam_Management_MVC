package com.competitive_exam_management.Services;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.competitive_exam_management.Dto.ExamDto;
import com.competitive_exam_management.Dto.QuestionsResponseDto;
import com.competitive_exam_management.Dto.ResultRespDto;

import ServicesInterface.ResultInterface;

@Service
public class ResultServicesImpl implements ResultInterface{

	@Override
	public ResultRespDto evaluateExam(int studentId, int examId, Map<Integer, String> answers) {
	    String API_URL = "http://localhost:8282/result/evaluateExam/" + studentId + "/" + examId;

	    RestTemplate restTemplate = new RestTemplate();
	    try {
	        Map<String, String> stringKeyMap = new HashMap<>();
	        for (Map.Entry<Integer, String> entry : answers.entrySet()) {
	            stringKeyMap.put(entry.getKey().toString(), entry.getValue());
	        }
	        ResultRespDto result=restTemplate.postForObject(API_URL, stringKeyMap, ResultRespDto.class);
            		 return result;
	    } catch (Exception e) {
	        System.err.println("Error calling API: " + e.getMessage());
	        return null;
	    }
	}

	@Override
	public List <ResultRespDto> viewResult() {
		String API_URL = "http://localhost:8282/result/viewAllResult";
		 RestTemplate restTemplate = new RestTemplate();

	        HttpHeaders headers = new HttpHeaders();
	        headers.setContentType(MediaType.APPLICATION_JSON);
	        ResultRespDto[] response = restTemplate.getForObject(API_URL, ResultRespDto[].class);
      return  Arrays.asList(response);
	}

	@Override
	public List<ResultRespDto> viewResultById(int id) {
		String API_URL = "http://localhost:8282/result/viewResultById/"+id;
		 RestTemplate restTemplate = new RestTemplate();

		    HttpHeaders headers = new HttpHeaders();
		    headers.setContentType(MediaType.APPLICATION_JSON);

		    ResultRespDto[] response = restTemplate.postForObject(API_URL, null, ResultRespDto[].class);

		    return Arrays.asList(response);
	}
	

}
