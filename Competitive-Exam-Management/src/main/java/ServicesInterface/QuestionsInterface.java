package ServicesInterface;

import java.util.List;

import org.springframework.stereotype.Service;

import com.competitive_exam_management.Dto.ExamDto;
import com.competitive_exam_management.Dto.QuestionsDto;

@Service
public interface QuestionsInterface {

	QuestionsDto registerQuestions(QuestionsDto questionsDto);

	List<QuestionsDto> getAllQuestions();

	QuestionsDto updateQuestions(int id);

	QuestionsDto questionsUpdate(QuestionsDto questionsDto);


	

}
