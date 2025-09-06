package com.competitive_exam_management.Services;

import java.util.Arrays;
import java.util.List;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.competitive_exam_management.Dto.ExamDto;
import com.competitive_exam_management.Dto.QuestionsDto;
import com.competitive_exam_management.Dto.QuestionsResponseDto;
import com.competitive_exam_management.Dto.StudentDto;

import ServicesInterface.QuestionsInterface;

@Service
public class QuestionsServicesImpl implements QuestionsInterface {

    @Override
    public QuestionsDto registerQuestions(QuestionsDto questionsDto) {
        String API_URL = "http://localhost:8282/registerQuestions";
        RestTemplate restTemplate = new RestTemplate();

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        HttpEntity<QuestionsDto> request = new HttpEntity<>(questionsDto, headers);
        try {
            QuestionsDto response = restTemplate.postForObject(API_URL, request, QuestionsDto.class);
            if (response != null) {
                return response;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<QuestionsResponseDto> getAllQuestions() {
        String API_URL = "http://localhost:8282/viewQuestions";
        RestTemplate restTemplate = new RestTemplate();

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        QuestionsResponseDto[] response = restTemplate.getForObject(API_URL, QuestionsResponseDto[].class);
        return Arrays.asList(response);
    }

    @Override
    public QuestionsResponseDto updateQuestions(int id) {
        String API_URL = "http://localhost:8282/questions_update/" + id;
        RestTemplate restTemplate = new RestTemplate();

        try {
            QuestionsResponseDto response = restTemplate.getForObject(API_URL, QuestionsResponseDto.class);
            return response;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public QuestionsResponseDto questionsUpdate(QuestionsDto questionsDto) {
        String API_URL = "http://localhost:8282/questions_update_data1";
        RestTemplate restTemplate = new RestTemplate();

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        // Send request body as QuestionsDto
        HttpEntity<QuestionsDto> request = new HttpEntity<>(questionsDto, headers);

        try {
            ResponseEntity<QuestionsResponseDto> response = restTemplate.exchange(
                    API_URL,
                    HttpMethod.POST,
                    request,
                    QuestionsResponseDto.class
            );

            if (response != null && response.getBody() != null) {
                return response.getBody();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }


    @Override
    public boolean deleteQuestions(int id) {
        String API_URL = "http://localhost:8282/questions_delete/" + id;
        RestTemplate restTemplate = new RestTemplate();

        try {
            boolean response = restTemplate.getForObject(API_URL, boolean.class);
            return response;
        } catch (Exception e) {
            System.err.println("Error calling API: " + e.getMessage());
        }
        return false;
    }
}
