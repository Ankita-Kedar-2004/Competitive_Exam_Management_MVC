package ServicesInterface;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.competitive_exam_management.Dto.QuestionsResponseDto;
import com.competitive_exam_management.Dto.ResultRespDto;

@Service
public interface ResultInterface {

	int evaluateExam(int studentId, int examId, Map<Integer, String> answers);

	List<ResultRespDto> viewResult();

	List<ResultRespDto> viewResultById(int id);
	

}
