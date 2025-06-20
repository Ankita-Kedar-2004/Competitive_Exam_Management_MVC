package com.competitive_exam_management.Dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class StudentDto {
	 
	private int id;
	 private String name;
	    private String email;
	    private String password;
	    private String contactNumber;
	    private String qualification;
	    private int passingYear;
	    private String collegeName;
	    private int examId;

}
