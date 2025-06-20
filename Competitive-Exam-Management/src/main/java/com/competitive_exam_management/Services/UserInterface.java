package com.competitive_exam_management.Services;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import com.competitive_exam_management.Dto.UserDto;
import com.competitive_exam_management.Dto.UserLoginDto;
import com.competitive_exam_management.Dto.UserLoginRespDto;

@Service
public interface UserInterface {
	

	String userDto(UserDto userDto);
	UserLoginRespDto userLoginDto(UserLoginDto userLoginDto, HttpSession session);
	

}
