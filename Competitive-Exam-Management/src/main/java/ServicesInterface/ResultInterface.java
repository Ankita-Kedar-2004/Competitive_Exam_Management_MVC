package ServicesInterface;

import java.util.Map;

import org.springframework.stereotype.Service;

@Service
public interface ResultInterface {

	int evaluateExam(int studentId, int examId, Map<Integer, String> answers);
	

}
