package ServicesInterface;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.competitive_exam_management.Dto.ExamDto;
import com.competitive_exam_management.Dto.QuestionsDto;
import com.competitive_exam_management.Dto.QuestionsResponseDto;

@Service
public interface QuestionsInterface {

	QuestionsDto registerQuestions(QuestionsDto questionsDto);

	List<QuestionsResponseDto> getAllQuestions();

	QuestionsResponseDto updateQuestions(int id);

	QuestionsResponseDto questionsUpdate(QuestionsDto questionsDto);

	boolean deleteQuestions(int id);


	

}
