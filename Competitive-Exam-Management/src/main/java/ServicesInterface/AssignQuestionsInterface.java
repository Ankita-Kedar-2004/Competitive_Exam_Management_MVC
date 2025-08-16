package ServicesInterface;

import java.util.List;

import org.springframework.stereotype.Service;

import com.competitive_exam_management.Dto.QuestionsResponseDto;


@Service
public interface AssignQuestionsInterface {

	List<QuestionsResponseDto> assignQuestions(int studentId, int examId);


}
