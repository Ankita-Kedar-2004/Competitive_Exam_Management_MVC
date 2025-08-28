package com.competitive_exam_management.Dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ResultRespDto {
private int result_id;
private int user_id;
private int exam_id;
private int score;
private int total;
private List<QuestionsResponseDto> questions;
}
