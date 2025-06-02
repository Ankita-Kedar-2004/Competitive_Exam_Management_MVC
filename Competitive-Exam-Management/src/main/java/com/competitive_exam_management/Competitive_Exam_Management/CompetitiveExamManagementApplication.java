package com.competitive_exam_management.Competitive_Exam_Management;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages="com.competitive_exam_management")
public class CompetitiveExamManagementApplication {

	public static void main(String[] args) {
		SpringApplication.run(CompetitiveExamManagementApplication.class, args);
	}

}
