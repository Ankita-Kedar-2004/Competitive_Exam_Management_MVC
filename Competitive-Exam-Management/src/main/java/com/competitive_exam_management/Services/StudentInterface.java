package com.competitive_exam_management.Services;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.competitive_exam_management.Dto.StudentDto;

@Service
public interface StudentInterface {
	
	public StudentDto studentRegistration(StudentDto studentDto);
	
	 public List<StudentDto> getAllStudents() ;
	 
	 public StudentDto getStudentById(int id);
	 
	 public StudentDto studentUpdate(StudentDto studentDto) ;
	 
		public StudentDto deleteStudentById(int id);

}
