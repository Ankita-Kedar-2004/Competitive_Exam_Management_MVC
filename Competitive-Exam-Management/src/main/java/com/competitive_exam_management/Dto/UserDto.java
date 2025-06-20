package com.competitive_exam_management.Dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserDto {
	private String username;
	private String contact_number;
	private String email;
	private String password;
	private String role;
	
}
