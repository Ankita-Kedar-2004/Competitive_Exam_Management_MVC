package ServicesInterface;

import java.util.List;

import org.springframework.stereotype.Service;

import com.competitive_exam_management.Dto.ExamDto;
import com.competitive_exam_management.Dto.StudentDto;

@Service
public interface ExamInterface {

	ExamDto registerExam(ExamDto examDto);

	List<ExamDto> getAllExamName();

	ExamDto updateExam(int id);

	ExamDto examUpdate(ExamDto examDto);

}
