package com.competitive_exam_management.Services;

import java.util.Arrays;
import java.util.List;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.competitive_exam_management.Dto.StudentDto;

import ServicesInterface.StudentInterface;

@Service
public class StudentServicesImpl implements StudentInterface {

    @Override
    public StudentDto studentRegistration(StudentDto studentDto) {
        String API_URL = "http://localhost:8282/student/student_registration_data";
        System.out.println(studentDto.getPassword());

        RestTemplate restTemplate = new RestTemplate();

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        HttpEntity<StudentDto> request = new HttpEntity<>(studentDto, headers);

        try {
            StudentDto response = restTemplate.postForObject(API_URL, request, StudentDto.class);
            if (response != null) {
                return response;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<StudentDto> getAllStudents() {
        String API_URL = "http://localhost:8282/student/student_view";
        RestTemplate restTemplate = new RestTemplate();

        try {
            StudentDto[] response = restTemplate.getForObject(API_URL, StudentDto[].class);
            return Arrays.asList(response);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public StudentDto getStudentById(int id) {
        String API_URL = "http://localhost:8282/student/student_update/" + id;
        RestTemplate restTemplate = new RestTemplate();

        try {
            StudentDto response = restTemplate.getForObject(API_URL, StudentDto.class);
            return response;
        } catch (Exception e) {
            System.err.println("Error calling API: " + e.getMessage());
            return null;
        }
    }

    @Override
    public StudentDto studentUpdate(StudentDto studentDto) {
        String API_URL = "http://localhost:8282/student/student_update";

        RestTemplate restTemplate = new RestTemplate();

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        HttpEntity<StudentDto> request = new HttpEntity<>(studentDto, headers);

        try {
            StudentDto response = restTemplate.postForObject(API_URL, request, StudentDto.class);
            if (response != null) {
                return response;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean deleteStudentById(int id) {
        String API_URL = "http://localhost:8282/student/student_delete/" + id;
        RestTemplate restTemplate = new RestTemplate();

        try {
            Boolean response = restTemplate.getForObject(API_URL, Boolean.class);
            return response != null && response;
        } catch (Exception e) {
            System.err.println("Error calling API: " + e.getMessage());
            return false;
        }
    }
}
