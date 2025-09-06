package com.competitive_exam_management.Dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ExamDto {
	 private int ExamId;
 private String ExamName;
 private int ExamDuration;
 private String status;
private String user;
}
