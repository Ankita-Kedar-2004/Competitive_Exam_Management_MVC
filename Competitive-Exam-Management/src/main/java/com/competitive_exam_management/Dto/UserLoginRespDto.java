package com.competitive_exam_management.Dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class UserLoginRespDto {

	
	private String email;
	private String role;

	public UserLoginRespDto(String email,String role) {
		this.email=email;
		this.role=role;
		
	}
}
