package com.competitive_exam_management.ServicesInterface;

import org.springframework.stereotype.Service;

import com.competitive_exam_management.Dto.QuestionsDto;

@Service
public interface QuestionsInterface {

	QuestionsDto registerQuestions(QuestionsDto questionsDto);

}
